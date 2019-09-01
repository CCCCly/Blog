package zw.Admin;
import javax.servlet.http.*;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.*;
import java.sql.*;
import zw.Datalink.DataLink;
public class AuditComDAO extends ActionSupport
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
		String comment_no = request.getParameter("comment_no");
		String UPDATE_SQL = "";
		UPDATE_SQL = "update Comment set Audit = '1' where Comment_Id = ?";
		try
		{
			DataLink datalink = new DataLink();
			Connection con = datalink.getConnection();
			con.setAutoCommit(false);
			PreparedStatement ps = con.prepareStatement(UPDATE_SQL);
			ps.setString(1,comment_no);

			ps.executeUpdate();
			con.commit();
			ps.close();
		    con.close();
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
			out.print("<script language='javascript'>");
		    out.print("alert('���ͨ��ʧ��!');");
		    out.print("</script>");
		    out.flush();
		    out.close();
		}
		session.setAttribute("modifymsg","���ͨ��!");
		try 
	    {
			response.sendRedirect("admincomaudit.jsp?id="+id);
		} 
	    catch (IOException e) 
	    {
			e.printStackTrace();
		}
		return NONE;
	}
}
