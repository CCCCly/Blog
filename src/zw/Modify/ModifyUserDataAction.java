package zw.Modify;
import javax.servlet.http.*;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.*;
import java.sql.*;
import zw.Datalink.DataLink;
public class ModifyUserDataAction extends ActionSupport
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
		String id = request.getParameter("id");
		String age = request.getParameter("age");
		String tel = request.getParameter("tel");	
		String sex = request.getParameter("sex");
		String UPDATE_SQL = "";
		UPDATE_SQL = "update Registered_User set User_Age = ?,User_PhoneNumber = ?,User_Sex = ?where User_Id = ?";
		try
		{
			DataLink datalink = new DataLink();
			Connection con = datalink.getConnection();
			con.setAutoCommit(false);
			PreparedStatement ps = con.prepareStatement(UPDATE_SQL);
			ps.setString(1,age);
			ps.setString(2,tel);
			ps.setString(3,sex);
			ps.setString(4,id);

			ps.executeUpdate();
			con.commit();
			ps.close();
		    con.close();
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
			out.print("<script language='javascript'>");
		    out.print("alert('修改失败!');");
		    out.print("</script>");
		    out.flush();
		    out.close();
		}
		session.setAttribute("modifymsg","修改个人信息成功!");
	    try 
	    {
			response.sendRedirect("modify_userdata.jsp?id="+id);
		} 
	    catch (IOException e) 
	    {
			e.printStackTrace();
		}
		return NONE;
	}
}
