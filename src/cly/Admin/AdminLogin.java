package cly.Admin;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import cly.Datalink.DataLink;
import com.opensymphony.xwork2.ActionSupport;
public class AdminLogin extends ActionSupport
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
		String id = request.getParameter("login_id");
		String password = request.getParameter("password");
		String url = "";
		try
	    {
	    	DataLink datalink = new DataLink();
		    Connection conn = datalink.getConnection();
		    Statement stmt=conn.createStatement(); 
		    ResultSet RS=null; 
		    RS = stmt.executeQuery("select * from admin where User_Id = '" + id + "' and User_Password='" + password +"'" );
		    if(RS.next())
		    {
			      RS.close();
			      stmt.close();
			      conn.close();
			      session.setMaxInactiveInterval(15*60);			      
				  session.setAttribute("currentLoginAdminId",id);
				  url = "adminindex.jsp";
				  try 
				  {
					response.sendRedirect(url);
				  } 
				  catch (IOException e) 
				  {
					e.printStackTrace();
				  }
				  return NONE;
			}
		    else
		    {
		    	RS.close();
		    	stmt.close();
			    conn.close();
			 }
	    }
	    catch(SQLException e)
	    {
	    	System.out.print("数据库操作失败");
	    }
	    out.println("<script language=javascript>");
		out.println("alert('你的登录密码不正确!请重新输入');history.back();");
		out.println("</script>");
		out.flush();
		out.close();
		return NONE;
	}
}
