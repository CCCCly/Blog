package zw.User;
import java.sql.*;
import zw.Datalink.DataLink;
import zw.User.UserData;
public class GetUserData 
{
	public UserData getCurrentUserData(String id)
	{
		UserData userdata = new UserData();		
		try
		{
			DataLink datalink = new DataLink();
			Connection conn = datalink.getConnection();
			Statement stmt=conn.createStatement();
			ResultSet RS=null;
			RS = stmt.executeQuery("select * from Registered_User where User_Id = '" + id + "'");
			if(RS.next())
			{
				userdata.setId(RS.getString("User_Id"));
			    userdata.setPassword(RS.getString("User_Password"));
			    userdata.setSex(RS.getString("User_Sex"));
			    userdata.setAge(RS.getString("User_Age"));
			    userdata.setName(RS.getString("User_Name"));
			    userdata.setBirthday(RS.getString("User_Birth"));
			    userdata.setEmail(RS.getString("User_Email"));
			    userdata.setRegistertime(RS.getString("Register_Time"));
			}
			RS.close();
			stmt.close();
			conn.close();
		}
		catch(SQLException e)
		{
			System.out.print(e.getMessage());
			return null;
		}
		return userdata;
	}
}
