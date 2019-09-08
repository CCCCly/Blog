package cly.Article;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import cly.Datalink.DataLink;
public class MessageShow 
{
	private List<Article> messageList = new ArrayList<Article>();
	private String SELECT_SQL = "select * from Article where Audit = '1'" ;
	private String SELECT_SQL1 = "SELECT * FROM Article where Audit = '1' ORDER BY Article_Id DESC";
	private int pagesize = 9;
	public List<Article> getMessage(int page)
	{
		try
		{
			DataLink datalink = new DataLink();
			Connection con = datalink.getConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;
			ps = con.prepareStatement(SELECT_SQL1);
			rs = ps.executeQuery();
			int pSize = getPageSize();
			if(page>pSize)
			{
				page = pSize;
			}
			if(pSize>1)
			{
				rs.absolute((page-1)*pagesize+1);
				rs.previous();
			}
			int i = 0;
			if(rs.next())
			{
				while(i<pagesize&&!rs.isAfterLast())
				{
					Article message = new Article();
					message.setArticle_no(rs.getInt("Article_Id"));
					message.setSpeaker(rs.getString("User_Id"));
					message.setTitle(rs.getString("Article_Title"));
					message.setContent(rs.getString("Article_Content"));
					message.setSent_time(rs.getString("Publish_Time"));
					messageList.add(message);
					rs.next();
					i++;
				}
			}
			try
			{
				rs.close();
				ps.close();
				con.close();
			}
			catch(SQLException e2)
			{
				System.out.print("数据库关闭失败!");
			}
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
			return null;
		}
		return messageList;
	}
	public int getPageSize()
	{
		int pageall = 1;
		try
		{
			DataLink datalink = new DataLink();
			Connection con = datalink.getConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;
			ps = con.prepareStatement(SELECT_SQL);
			rs = ps.executeQuery();
			rs.last();
			pageall = rs.getRow();
			pageall = (pageall+pagesize-1)/pagesize;
			try
			{
				rs.close();
				ps.close();
				con.close();
			}
			catch(SQLException e2)
			{
				System.out.print("数据库关闭失败!");
			}
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
			return 1;
		}
		return pageall;
	}
}
