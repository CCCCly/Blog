package zw.Article;
public class Comment 
{
	private int id;
	public void setId(int id)
	{
		this.id = id;
	}
	public int getId()
	{
		return this.id;
	}
	private int article_no;
	public void setArticle_no(int article_no)
	{
		this.article_no = article_no;
	}
	public int getArticle_no()
	{
		return this.article_no;
	}
	private String user_id;
	public void setUser_id(String user_id)
	{
		this.user_id = user_id;
	}
	public String getUser_id()
	{
		return this.user_id;
	}
	private String content;
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getContent()
	{
		return this.content;
	}
	
	private String insert_time;
	public void setInsert_time(String insert_time)
	{
		this.insert_time = insert_time;
	}
	public String getInsert_time()
	{
		return this.insert_time;
	}
}
