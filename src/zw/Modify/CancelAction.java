package zw.Modify;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import zw.Datalink.DataLink;
import zw.Login.MD5Utils;
import com.opensymphony.xwork2.ActionSupport;

public class CancelAction extends ActionSupport
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
		String password=request.getParameter("password");
		String cancel = "1";
		String UPDATE_SQL = "";
		String SELECT_SQL = "select * from User where User_Id = ? AND User_Password=? ";
		UPDATE_SQL = "update Registered_User set Cancellation_Mark = ?where User_Id = ?";
		String url = "";
		try
		{
			DataLink datalink = new DataLink();
			Connection con = datalink.getConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;
			con.setAutoCommit(false);
			ps = con.prepareStatement(SELECT_SQL);
			ps.setString(1,id);
			ps.setString(2,MD5Utils.md5(password));
			rs = ps.executeQuery();
			if(!rs.next())
			{
				try
				{
					rs.close();
					ps.close();
					con.close();
				}
				catch(SQLException e3)
				{
					System.out.print("Êý¾Ý¿â¹Ø±ÕÊ§°Ü!");
				}
				out.print("<script language='javascript'>");
				out.print("alert('ÃÜÂë´íÎó:');history.back();");
				out.print("</script>");
			}
			else
			{
				ps = con.prepareStatement(UPDATE_SQL);
				ps.setString(1,cancel);
				ps.setString(2,id);
				ps.executeUpdate();
				con.commit();
				try
				{
					rs.close();
					ps.close();
					con.close();
				}
				catch(SQLException e2)
				{
					out.print("Êý¾Ý¿â¹Ø±ÕÊ§°Ü!");
				}
				session.removeAttribute("currentLoginUserId ");
				session.invalidate();
				url = "index.jsp";
				try 
				{
					response.sendRedirect(url);
				} 
				catch (IOException e) 
				{
					e.printStackTrace();
				}
			}
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
		}
		return NONE;
	}
}
