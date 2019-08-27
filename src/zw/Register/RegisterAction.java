package zw.Register;

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

import com.opensymphony.xwork2.ActionSupport;

public class RegisterAction extends ActionSupport
{
private static final long serialVersionUID = 1L;

public String execute()
   {
	   HttpServletRequest request = ServletActionContext.getRequest();
	   HttpServletResponse response=ServletActionContext.getResponse();
	   response.setContentType("text/html;charset=utf-8");
	   HttpSession session = request.getSession();
	   PrintWriter out = null;
	   try 
	   {
		   out = response.getWriter();
	   } 
	   catch (IOException e) 
	   {
		   e.printStackTrace();
	   }
       String id ;
	   String password ;
	   String name;
	   String sex ;
	   String age ;
	   String birthday;
	   String email;
	   String url = "";
	   id=request.getParameter("id");
	   password=request.getParameter("password");
	   name=request.getParameter("name");
	   sex=request.getParameter("sex");
	   age=request.getParameter("age");
	   birthday=request.getParameter("birthday");
	   email=request.getParameter("email");
	   try
	   {
			DataLink datalink = new DataLink();
			Connection con = datalink.getConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;
			String SELECT_SQL = "select * from User where User_Id = ?";
			String INSERT_SQL1 = "insert into User (User_Id,User_Password) values(?,?)";
			String INSERT_SQL2 = "insert into Registered_User (User_Id,User_Password,User_Sex,User_Age,User_Name,User_Birth,User_Email) "
					+ "values(?,?,?,?,?,?,?)";
			con.setAutoCommit(false);
			ps = con.prepareStatement(SELECT_SQL);
			ps.setString(1,id);
			rs = ps.executeQuery();
			if(rs.next())
			{
				try
				{
					rs.close();
					ps.close();
					con.close();
				}
				catch(SQLException e3)
				{
					System.out.print("数据库关闭失败!");
				}
				out.print("<script language='javascript'>");
				out.print("alert('该用户ID已存在:');history.back();");
				out.print("</script>");
			}
			else
			{
				ps = con.prepareStatement(INSERT_SQL1);
				ps.setString(1, id);
				ps.setString(2,password);
				ps.executeUpdate();
				con.commit();
	
				ps = con.prepareStatement(INSERT_SQL2);
				ps.setString(1, id);
				ps.setString(2, password);
				ps.setString(3, sex);
				ps.setString(4, age);
				ps.setString(5, name);
				ps.setString(6, birthday);
				ps.setString(7, email);
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
					out.print("数据库关闭失败!");
				}
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
			}
		}
		catch(SQLException err)
		{
			System.out.print(err.getMessage());
		}
	    return NONE;
   } 
}
