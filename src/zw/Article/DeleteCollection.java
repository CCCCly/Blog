package zw.Article;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import zw.Datalink.DataLink;
public class DeleteCollection extends ActionSupport
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
		String id=request.getParameter("id");
		String strserial = request.getParameter("serial");
		int article_no = 1;
		int userid = 1;
		if(strserial != null)
		{
		    article_no = Integer.parseInt(strserial);
		    userid = Integer.parseInt(id);
		}
		String DELETE_SQL = "delete from collection where User_Id = ? and Article_Id = ?";
		try
		{
			DataLink datalink = new DataLink();
			Connection con = datalink.getConnection();
			PreparedStatement ps = null;
			con.setAutoCommit(false);
			ps = con.prepareStatement(DELETE_SQL);
			ps.setInt(1,userid);
			ps.setInt(2,article_no);
			ps.executeUpdate();
			con.commit();
			try
			{
				ps.close();
				con.close();
			}
			catch(SQLException e2)
			{
				session.setAttribute("dealforummsg","取消收藏失败!");
				out.print("数据库关闭失败!");
				out.print("<script language='javascript'>");
				out.print("alert('数据库操作出错');history.back();");
				out.print("</script>");
			}
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
			session.setAttribute("dealforummsg","取消收藏失败!");
			out.print("<script language='javascript'>");
			out.print("alert('操作出错');history.back();");
			out.print("</script>");
			out.flush();
		}
		session.setAttribute("dealforummsg","取消收藏成功!");
		try 
		{
			response.sendRedirect("article.jsp?id="+id+"&&serial="+strserial);
		} 
		catch (IOException e) 
		{
			e.printStackTrace();
		}
		return NONE;
	}
}
