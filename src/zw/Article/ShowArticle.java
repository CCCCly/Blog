package zw.Article;
import zw.Datalink.DataLink;
import java.util.List;
import java.util.ArrayList;
import java.sql.*;
import zw.Article.Comment;
import zw.Article.Article;
public class ShowArticle 
{
	private List<Comment> CommentList = new ArrayList<Comment>();
	private String SELECT_SQLS[] = {"select * from article where article_id = ?",
			"select * from comment where article_id = ?",
			"select count(*) from artlike where Article_ID = ?",
			"select count(*) from artlike where Article_ID = ? and User_ID = ?",
			"select count(*) from collection where Article_Id = ? and User_Id = ?"};
	public Article getArticleByNo(int article_no)
	{
		Article art = new Article();
		try
		{
			DataLink datalink = new DataLink();
			Connection con = datalink.getConnection();
			con.setAutoCommit(true);
			PreparedStatement ps = con.prepareStatement(SELECT_SQLS[0]);
			ResultSet rs = null;
			ps.setInt(1,article_no);
			rs = ps.executeQuery();
			if(rs.next())
			{				
		    	art.setArticle_no(rs.getInt("Article_Id"));
		    	art.setTitle(rs.getString("Article_Title"));
		    	art.setSpeaker(rs.getString("User_Id"));
		    	art.setSent_time(rs.getString("Publish_Time"));
		    	art.setContent(rs.getString("Article_Content"));
			}
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
			return null;
		}
		return art;
	}
	public List<Comment> getCommentByArticle_no(int article_no)
	{
		try
		{
			DataLink datalink = new DataLink();
			Connection con = datalink.getConnection();
			con.setAutoCommit(true);
			PreparedStatement ps = con.prepareStatement(SELECT_SQLS[1]);
			ResultSet rs = null;
			ps.setInt(1,article_no);
			rs = ps.executeQuery();
			while(rs.next())
			{
				Comment comment = new Comment();
		    	comment.setId(rs.getInt("Comment_Id"));
		    	comment.setArticle_no(rs.getInt("Article_Id"));
		    	comment.setUser_id(rs.getString("User_Id"));
		    	comment.setInsert_time(rs.getString("Publish_Time"));
		    	comment.setContent(rs.getString("Comment_Content"));
		    	CommentList.add(comment);
			}
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
			return null;
		}
		return CommentList;
	}
	public int getLikeNum(int article_no) {
		int num = 0;
		try
		{
			DataLink datalink = new DataLink();
			Connection con = datalink.getConnection();
			con.setAutoCommit(true);
			PreparedStatement ps = con.prepareStatement(SELECT_SQLS[2]);
			ResultSet rs = null;
			ps.setInt(1,article_no);
			rs = ps.executeQuery();
			while(rs.next())
			{
		    	num = rs.getInt(1);
			}
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
			return num;
		}
		return num;
	}
	public boolean judgeLike(int article_no,int user_id) {
		int num = 0;
		try
		{
			DataLink datalink = new DataLink();
			Connection con = datalink.getConnection();
			con.setAutoCommit(true);
			PreparedStatement ps = con.prepareStatement(SELECT_SQLS[3]);
			ResultSet rs = null;
			ps.setInt(1, article_no);
			ps.setInt(2, user_id);
			rs = ps.executeQuery();
			while(rs.next())
			{
		    	num = rs.getInt(1);
			}
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
			return false;
		}
		if(num > 0)
			return true;
		return false;
	}
	
	public boolean judgeCollection(int article_no,int user_id) {
		int num = 0;
		try
		{
			DataLink datalink = new DataLink();
			Connection con = datalink.getConnection();
			con.setAutoCommit(true);
			PreparedStatement ps = con.prepareStatement(SELECT_SQLS[4]);
			ResultSet rs = null;
			ps.setInt(1, article_no);
			ps.setInt(2, user_id);
			rs = ps.executeQuery();
			while(rs.next())
			{
		    	num = rs.getInt(1);
			}
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
			return false;
		}
		if(num > 0)
			return true;
		return false;
	}
}
