package cly.Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import cly.Datalink.DataLink;
public class AdminDeleteArticleDAO extends ActionSupport 
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
		int article_no = Integer.parseInt(strarticle_no);
		String speaker = request.getParameter("currentid");
		String DELETE_SQL = "delete from Article where Article_Id = ?";
		try
		{
			DataLink datalink = new DataLink();
			Connection con = datalink.getConnection();
			PreparedStatement ps = null;
			con.setAutoCommit(false);
			ps = con.prepareStatement(DELETE_SQL);
			ps.setInt(1,article_no);
			ps.executeUpdate();
			con.commit();
			try
			{
				ps.close();
				con.close();
			}
			catch(SQLException e2)
			{
				out.print("Êý¾Ý¿â²Ù×÷Ê§°Ü!");
				out.print("<script language='javascript'>");
				out.print("alert('É¾³ýÊ§°Ü');history.back();");
				out.print("</script>");
			}
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
			out.print("<script language='javascript'>");
			out.print("alert('É¾³ýÊ§°Ü');history.back();");
			out.print("</script>");
			out.flush();
		}
		try 
		{
			response.sendRedirect("adminarticle.jsp?id="+speaker);
		} 
		catch (IOException e) 
		{
			e.printStackTrace();
		}
		return NONE;
	}
}
