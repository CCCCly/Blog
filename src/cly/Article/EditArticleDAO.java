package cly.Article;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import cly.Datalink.DataLink;
public class EditArticleDAO extends ActionSupport
{
	private static final long serialVersionUID = 1L;
	public String execute()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		PrintWriter out=null;
		try 
		{
			out = response.getWriter();
		} 
		catch (IOException e1) 
		{
			e1.printStackTrace();
		}
		String speaker = request.getParameter("currentuserid");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String articleid = request.getParameter("strserial");
		
		String UPDATE_SQL = "update Article set Article_Title = ?,Article_Content = ? where Article_Id = ?";
		try
		{
			DataLink datalink = new DataLink();
			Connection con = datalink.getConnection();
			PreparedStatement ps = null;
			con.setAutoCommit(false);
			ps = con.prepareStatement(UPDATE_SQL);
			ps.setString(1,title);
		    ps.setString(2,content);
		    ps.setString(3,articleid);
		    ps.executeUpdate();
			con.commit();
			try
			{
				ps.close();
				con.close();
			}
			catch(SQLException e2)
			{
				session.setAttribute("dealforummsg","修改文章失败!");
				out.print("数据库关闭失败!");
				out.print("<script language='javascript'>");
				out.print("alert('数据库操作出错');history.back();");
				out.print("</script>");
			}
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
		}
		session.setAttribute("dealforummsg","修改文章成功!");
		try 
		{
			response.sendRedirect("article.jsp?id="+speaker+"&&serial="+articleid);
		} 
		catch (IOException e) 
		{
			e.printStackTrace();
		}
		return NONE;
	}
}
