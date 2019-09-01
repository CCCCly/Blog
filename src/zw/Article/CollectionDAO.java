package zw.Article;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
import zw.Datalink.DataLink;
public class CollectionDAO extends ActionSupport 
{
	private static final long serialVersionUID = 1L;
	public String execute()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
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
		if(strserial != null)
		{
		    article_no = Integer.parseInt(strserial);
		}
		String INSERT_SQL = "insert into collection(User_Id,Article_Id) values(?,?)";

		try
		{
			DataLink datalink = new DataLink();
			Connection con = datalink.getConnection();
			PreparedStatement ps = null;
			con.setAutoCommit(false);
			ps = con.prepareStatement(INSERT_SQL);
			ps.setString(1,id);
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
				out.print("Êý¾Ý¿â²Ù×÷Ê§°Ü£¡");
				out.print("<script language='javascript'>");
				out.print("alert('ÊÕ²ØÊ§°Ü');history.back();");
				out.print("</script>");
			}
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
		}
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
