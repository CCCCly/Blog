package zw.Admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import zw.Datalink.DataLink;
import zw.User.UserData;
public class UserMessage 
{
	private List<UserData> userdataItem = new ArrayList<UserData>();
	private int intpagesize = 25;  //一页显示的记录数
	private int intpagecount = 1; //总页数
	private int introwcount = 1; //记录总数
	public List<UserData> getAllUserMessage(int intpage)
	{
		int i = 0;
		String SELECT_SQL = "select * from registered_user";
		try
		{
			DataLink datalink = new DataLink();
			Connection con = datalink.getConnection();
			con.setAutoCommit(true);
			PreparedStatement ps = con.prepareStatement(SELECT_SQL);
			ResultSet rs = null;
			rs = ps.executeQuery();
			if(intpage>getPageSize())
			{
				intpage = getPageSize();
			}
			rs.absolute((intpage-1)*intpagesize+1);		
			i = 0;  
		    while(i<intpagesize&&!rs.isAfterLast())
		    {
		    	UserData alldata = new UserData();
		    	alldata.setId(rs.getString("User_Id"));
		    	alldata.setSex(rs.getString("User_Sex"));
		    	alldata.setAge(rs.getString("User_Age"));
		    	alldata.setName(rs.getString("User_Name"));
		    	alldata.setBirthday(rs.getString("User_Birth"));
		    	alldata.setEmail(rs.getString("User_Email"));
		    	alldata.setRegistertime(rs.getString("Register_Time"));
		    	userdataItem.add(alldata);
		    	rs.next();
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
		return userdataItem;
	}
	
	public int getPageSize()
	{
		String SELECT_SQL1 = "select * from registered_user";
		try
		{
			DataLink datalink = new DataLink();
			Connection con = datalink.getConnection();
			con.setAutoCommit(true);
			PreparedStatement ps = con.prepareStatement(SELECT_SQL1);
			ResultSet rs = null;
			rs = ps.executeQuery();
			rs.last();
			introwcount = rs.getRow();
			 //计算总页数
			intpagecount = (introwcount+intpagesize-1)/intpagesize;
			rs.close();
			ps.close();
			con.close();
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
		}
		return intpagecount;
	}
}
