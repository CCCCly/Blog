package cly.Article;
import cly.Datalink.DataLink;
import java.util.List;
import java.util.ArrayList;
import java.sql.*;
import cly.Article.Comment;
public class getComment 
{
	private List<Comment> commentList = new ArrayList<Comment>();
	private String SELECT_SQL = "select * from comment where Audit = '0' ";
	private int introwcount; //��¼����
	private int i = 0;
	private int intpagesize = 15;  //һҳ��ʾ�ļ�¼��
	
	public List<Comment> getAuditMessage()
	{
		try
		{
			DataLink datalink = new DataLink();
			Connection con = datalink.getConnection();
			con.setAutoCommit(true);
			PreparedStatement ps = null;
			ResultSet rs = null;
	        ps = con.prepareStatement(SELECT_SQL);
			rs = ps.executeQuery();
			//��ȡ��¼����
			rs.last();
			introwcount = rs.getRow();
			//��ʾ����
			i = 0;  
			while(i<introwcount&&!rs.isBeforeFirst())
			{
			    	Comment cmt = new Comment();
			    	cmt.setId(rs.getInt("Comment_Id"));
			    	cmt.setArticle_no(rs.getInt("Article_Id"));
			    	cmt.setUser_id(rs.getString("User_Id"));
			    	cmt.setInsert_time(rs.getString("Publish_Time"));
			    	cmt.setContent(rs.getString("Comment_Content"));
			    	commentList.add(cmt);
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
		return commentList;
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
			ps = con.prepareStatement(SELECT_SQL);
			rs = ps.executeQuery();
			//��ȡ��¼����
			rs.last();
			pageall = rs.getRow();
			 //������ҳ��
			pageall = (pageall+intpagesize-1)/intpagesize;
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
		}
		return pageall;
	}
}