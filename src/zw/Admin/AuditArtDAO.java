package zw.Admin;
import javax.servlet.http.*;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.*;
import java.sql.*;
import zw.Datalink.DataLink;
public class AuditArtDAO extends ActionSupport
{
	private static final long serialVersionUID = 1L;
	public String execute()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=null;
		try 
		{
			out = response.getWriter();
		} 
		catch (IOException e1) 
		{
			e1.printStackTrace();
		}
		HttpSession session = request.getSession();
		String id = request.getParameter("currentid");
		String article_no = request.getParameter("article_no");
		String UPDATE_SQL = "";
		UPDATE_SQL = "update Article set Audit = '1' where Article_Id = ?";
		try
		{
			DataLink datalink = new DataLink();
			Connection con = datalink.getConnection();
			con.setAutoCommit(false);
			PreparedStatement ps = con.prepareStatement(UPDATE_SQL);
			ps.setString(1,article_no);

			ps.executeUpdate();
			con.commit();
			ps.close();
		    con.close();
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
			out.print("<script language='javascript'>");
		    out.print("alert('审核通过失败!');");
		    out.print("</script>");
		    out.flush();
		    out.close();
		}
		session.setAttribute("modifymsg","审核通过!");
		try 
	    {
			response.sendRedirect("adminartaudit.jsp?id="+id);
		} 
	    catch (IOException e) 
	    {
			e.printStackTrace();
		}
		return NONE;
	}
}
