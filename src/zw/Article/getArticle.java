package zw.Article;
import zw.Datalink.DataLink;
import java.util.List;
import java.util.ArrayList;
import java.sql.*;
import zw.Article.Article;
public class getArticle 
{
	private List<Article> articleList = new ArrayList<Article>();
	private String SELECT_SQLS[] = {"select * from article where Audit = '1' and User_Id = ?",
									"select article.* from collection,article where collection.User_Id = ? and collection.Article_Id = article.Article_Id and Audit = '1'",
									"select * from article where Audit = '0' "
									};
	private int introwcount; //记录总数
	private int i = 0;
	private int intpagesize = 15;  //一页显示的记录数
	public List<Article> getArticleMessage(String User_Id)
	{
		try
		{
			DataLink datalink = new DataLink();
			Connection con = datalink.getConnection();
			con.setAutoCommit(true);
			PreparedStatement ps = null;
			ResultSet rs = null;
	        ps = con.prepareStatement(SELECT_SQLS[0]);
		    ps.setString(1,User_Id);
			rs = ps.executeQuery();
			//获取记录总数
			rs.last();
			introwcount = rs.getRow();
			//显示数据
			i = 0;  
			while(i<introwcount&&!rs.isBeforeFirst())
			{
			    	Article art = new Article();
			    	art.setArticle_no(rs.getInt("Article_Id"));
			    	art.setTitle(rs.getString("Article_Title"));
			    	art.setSpeaker(rs.getString("User_Id"));
			    	art.setSent_time(rs.getString("Publish_Time"));
			    	art.setContent(rs.getString("Article_Content"));
			    	articleList.add(art);
			    	rs.previous();
			    	i++;
			}
			rs.close();
			ps.close();
			con.close();
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
			return null;
		}
		return articleList;
	}
	public List<Article> getCollectionMessage(String User_Id)
	{
		try
		{
			DataLink datalink = new DataLink();
			Connection con = datalink.getConnection();
			con.setAutoCommit(true);
			PreparedStatement ps = null;
			ResultSet rs = null;
	        ps = con.prepareStatement(SELECT_SQLS[1]);
		    ps.setString(1,User_Id);
			rs = ps.executeQuery();
			//获取记录总数
			rs.last();
			introwcount = rs.getRow();
			//显示数据
			i = 0;  
			while(i<introwcount&&!rs.isBeforeFirst())
			{
			    	Article art = new Article();
			    	art.setArticle_no(rs.getInt("Article_Id"));
			    	art.setTitle(rs.getString("Article_Title"));
			    	art.setSpeaker(rs.getString("User_Id"));
			    	art.setSent_time(rs.getString("Publish_Time"));
			    	art.setContent(rs.getString("Article_Content"));
			    	articleList.add(art);
			    	rs.previous();
			    	i++;
			}
			rs.close();
			ps.close();
			con.close();
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
			return null;
		}
		return articleList;
	}
	public List<Article> getAuditMessage()
	{
		try
		{
			DataLink datalink = new DataLink();
			Connection con = datalink.getConnection();
			con.setAutoCommit(true);
			PreparedStatement ps = null;
			ResultSet rs = null;
	        ps = con.prepareStatement(SELECT_SQLS[2]);
			rs = ps.executeQuery();
			//获取记录总数
			rs.last();
			introwcount = rs.getRow();
			//显示数据
			i = 0;  
			while(i<introwcount&&!rs.isBeforeFirst())
			{
			    	Article art = new Article();
			    	art.setArticle_no(rs.getInt("Article_Id"));
			    	art.setTitle(rs.getString("Article_Title"));
			    	art.setSpeaker(rs.getString("User_Id"));
			    	art.setSent_time(rs.getString("Publish_Time"));
			    	art.setContent(rs.getString("Article_Content"));
			    	articleList.add(art);
			    	rs.previous();
			    	i++;
			}
			rs.close();
			ps.close();
			con.close();
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
			return null;
		}
		return articleList;
	}
	public int getPageSize(String id)
	{
		int pageall = 1;
		try
		{
			DataLink datalink = new DataLink();
			Connection con = datalink.getConnection();
			con.setAutoCommit(true);
			PreparedStatement ps = null;
			ResultSet rs = null;
			ps = con.prepareStatement(SELECT_SQLS[0]);
			ps.setString(1,id);
			rs = ps.executeQuery();
			//获取记录总数
			rs.last();
			pageall = rs.getRow();
			 //计算总页数
			pageall = (pageall+intpagesize-1)/intpagesize;
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
		}
		return pageall;
	}
	public int getAuditPageSize()
	{
		int pageall = 1;
		try
		{
			DataLink datalink = new DataLink();
			Connection con = datalink.getConnection();
			con.setAutoCommit(true);
			PreparedStatement ps = null;
			ResultSet rs = null;
			ps = con.prepareStatement(SELECT_SQLS[2]);
			rs = ps.executeQuery();
			//获取记录总数
			rs.last();
			pageall = rs.getRow();
			 //计算总页数
			pageall = (pageall+intpagesize-1)/intpagesize;
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
		}
		return pageall;
	}
}