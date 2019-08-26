package zw.Login;
import javax.servlet.http.*;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.*;
import java.sql.*;
import zw.Datalink.DataLink;
public class LoginAction extends ActionSupport
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
		    RS = stmt.executeQuery("select * from Registered_User where User_Id = '" + id + "' and User_Password='" +MD5Utils.md5(password)+"'" );
		    if(RS.next())
		    {
		    	  int i=Integer.parseInt(RS.getString("Cancellation_Mark"));
		    	  RS.close();
	    		  stmt.close();
	    		  conn.close();
		    	  if(i==0)
		    	  {
		    		  	session.setMaxInactiveInterval(15*60);		      
		    		  	session.setAttribute("currentLoginUserId",id);
		    		  	url = "pass.jsp?id="+id;
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
		    	  out.print("<script language='javascript'>");
				  out.print("alert('该用户已注销，如需恢复请联系作者:');history.back();");
				  out.print("</script>");
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
	    	System.out.print("数据库链接错误");
	    }
	    out.println("<script language=javascript>");
		out.println("alert('你的登录密码不正确!请重新登录:');history.back();");
		out.println("</script>");
		return NONE;
	}
}
