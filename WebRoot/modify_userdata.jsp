<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="cly.User.GetUserData" %>
<%@ page import="cly.User.UserData" %>
<%
  String currentuserid = "";
  if((String)session.getAttribute("currentLoginUserId")!=null)
  {
    currentuserid = (String)session.getAttribute("currentLoginUserId");
  }
  
  String id = request.getParameter("id");
  
  GetUserData getuserdata = new GetUserData();
  UserData userdata = getuserdata.getCurrentUserData(id);
 
  String modifymsg = (String)session.getAttribute("modifymsg");
  if(modifymsg == null)
  {
    modifymsg = "";
  }
  else
  {
    session.removeAttribute("modifymsg");
  }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
     <title><%=id %> 信息管理</title>
     <link rel="stylesheet" type="text/css" href="css/toolbar.css">
  </head>
<script language="javascript">
function ModifyUserData(f)
{
   if(f.tel.value.length!=11)
   {
       alert("电话号码长度为11位！");
	   return false;
   }
   else if(!(f.age.value>=1&&f.age.value<=123))
   {
	   alert("请输入正确的年龄！");
	   return false;
   }
   else
   {
      return true;
   }
}
</script>

<body>

    <jsp:include flush="true" page="header.jsp">
      <jsp:param name="id" value="<%=id %>" />
    </jsp:include>
 
 <%
   if(currentuserid.equals(id))
   {
 %>

  <table align="center" width="760px" class="datagridstyle" id="modifymsg" cellSpacing=0 cellPadding=3 border=0>
   <tr height="20px">
    <td align="center"><b><%=modifymsg %></b></td>
   </tr>
  </table>
  
  <form action="ModifyUserDataAction?id=<%=currentuserid %>" method="post" name="ModifyBData" onSubmit="return ModifyUserData(this);">
   <table align="center" width="760px" class="datagridstyle" id="DataGrid1" cellSpacing=0 cellPadding=3 border=0>
     <tr class="datagridhead">
      <td align="center" colspan="2">用户信息</td>
     </tr>
    <tr>
	  <td>用户ID：</td>
	  <td>
	    <%=userdata.getId()%>
	  </td>
	</tr>
	<tr>
	  <td>密码：</td>
	  <td>
	    <input name="password" type="text" value="<%=userdata.getPassword()%>"/>
	  </td>
	</tr>
	<tr class="datagrid1212">
	  <td> 性别：</td>
	  <td>
	  <%
	    if(userdata.getSex().equals("男"))
	    {
	  %>
        	<input type="radio"  value="男" name="sex" checked/> 男 &nbsp;&nbsp;&nbsp;&nbsp; 
        	<input type="radio" value="女" name="sex"/> 女
      <%
      	} 
        else
        {
      %>
       		<input type="radio"  value="男" name="sex"/> 男 &nbsp;&nbsp;&nbsp;&nbsp; 
        	<input type="radio" value="女" name="sex" checked/> 女
      <%
      	} 
      %>
	  </td>
	</tr>
	<tr class="datagrid1212">
	 <td>昵称：</td>
	 <td>
	  <input name="name" type="text" value="<%=userdata.getName()%>" />
	 </td>
	</tr>
	<tr>
	  <td>年龄：</td>
	  <td>
	    <input name="age" type="text" value="<%=userdata.getAge()%>" />
	  </td>
	</tr>
	<tr class="datagrid1212">
	 <td>生日：</td>
	 <td>
	  <input name="birthday" type="text" value="<%=userdata.getBirthday()%>" />
	 </td>
	</tr>
	<tr>
	  <td>邮箱：</td>
	  <td>
	    <input name="email" type="text" value="<%=userdata.getEmail()%>" />
	  </td>
	</tr>
	<tr>
	  <td>注册时间：</td>
	  <td>
	    <%=userdata.getRegistertime()%>
	  </td>
	</tr>
	<tr>
     <td align="center" colspan="2">
	   <input type="submit" value="提交" />
	 </td>
    </tr>
  </table>
 </form>
 <%
   }
 %>
   <div id="lastfoot">
     <jsp:include flush="false" page="footer.jsp"></jsp:include>
   </div>
</body>
</html>
