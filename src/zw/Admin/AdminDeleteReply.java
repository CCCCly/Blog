package zw.Admin;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import zw.Datalink.DataLink;
public class AdminDeleteReply extends ActionSupport 
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
		String strarticle_no = request.getParameter("article_no");
		String speaker = request.getParameter("currentid");
		String strid = request.getParameter("id");
		int id = Integer.parseInt(strid);
		String DELETE_SQL = "delete from Comment where Comment_Id=?";
		try
		{
			DataLink datalink = new DataLink();
			Connection con = datalink.getConnection();
			PreparedStatement ps = null;
			con.setAutoCommit(false);
			ps = con.prepareStatement(DELETE_SQL);
			ps.setInt(1,id);
			ps.executeUpdate();
			con.commit();
			try
			{
				ps.close();
				con.close();
			}
			catch(SQLException e2)
			{
				out.print("数据库关闭失败!");
				out.print("<script language='javascript'>");
				out.print("alert('操作出错');history.back();");
				out.print("</script>");
			}
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
			out.print("<script language='javascript'>");
			out.print("alert('操作出错');history.back();");
			out.print("</script>");
			out.flush();
		}
		try 
		{
			response.sendRedirect("adminarticle_action.jsp?id="+speaker+"&&serial="+strarticle_no);
		} 
		catch (IOException e) 
		{
			e.printStackTrace();
		}
		return NONE;
	}
}
