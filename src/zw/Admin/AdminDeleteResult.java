package zw.Admin;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import zw.Datalink.DataLink;
import com.opensymphony.xwork2.ActionSupport;
public class AdminDeleteResult extends ActionSupport
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
		String start = request.getParameter("start");
		String end=request.getParameter("end");
		String DELETE_SQL = "delete from Result where Score_Start= ? And Score_End=?";
		try
		{
			DataLink datalink = new DataLink();
			Connection con = datalink.getConnection();
			PreparedStatement ps = null;
			con.setAutoCommit(false);
			ps = con.prepareStatement(DELETE_SQL);
			ps.setString(1,start);
			ps.setString(2,end);
			ps.executeUpdate();
			con.commit();
			try
			{
				ps.close();
				con.close();
			}
			catch(SQLException e2)
			{
				out.print("数据库断开关闭失败!");
				out.print("<script language='javascript'>");
				out.print("alert('删除失败');history.back();");
				out.print("</script>");
			}
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
			out.print("<script language='javascript'>");
			out.print("alert('删除失败');history.back();");
			out.print("</script>");
			out.flush();
		}
		try 
		{
			response.sendRedirect("adminresult.jsp");
		} 
		catch (IOException e) 
		{
			e.printStackTrace();
		}
		return NONE;
	}
}
