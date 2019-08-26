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
public class SendArticleDAO extends ActionSupport
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
		title = title.replaceAll("\\\"","'");
		content = content.replaceAll("\\\"","'");
		String INSERT_SQL = "insert into Article (Article_Title,User_Id,Article_Content) values(?,?,?)";
		try
		{
			DataLink datalink = new DataLink();
			Connection con = datalink.getConnection();
			PreparedStatement ps = null;
			con.setAutoCommit(false);
			ps = con.prepareStatement(INSERT_SQL);
			ps.setString(1,title);
		    ps.setString(2,speaker);
		    ps.setString(3,content);
		    ps.executeUpdate();
			con.commit();
			try
			{
				ps.close();
				con.close();
			}
			catch(SQLException e2)
			{
				session.setAttribute("dealforummsg","发表文章失败!");
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
		int artid = getAllArtId();
		session.setAttribute("dealforummsg","发表文章成功!");
		try 
		{
			response.sendRedirect("article.jsp?id="+speaker+"&&serial="+artid);
		} 
		catch (IOException e) 
		{
			e.printStackTrace();
		}
		return NONE;
	}
	public int getAllArtId()
	{
		int aId = 1;
		try
		{
			DataLink datalink = new DataLink();
			Connection con = datalink.getConnection();
			Statement stmt = null;
			ResultSet rs = null;
			stmt = con.createStatement();
			rs = stmt.executeQuery("SELECT max(Article_Id) as maxid FROM Article");
			if(rs.next())
			{
				aId = rs.getInt("maxid");
			}
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
			return 1;
		}
		return aId;
	}
}
