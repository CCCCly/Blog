<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="cly.User.GetUserData" %>
<%@ page import="cly.User.UserData" %>
<%
   String modifymsg = (String)session.getAttribute("modifymsg");
   if(modifymsg == null)
   {
    	modifymsg = "";
   }
   else
   {
    	session.removeAttribute("modifymsg");
   }
   String id = request.getParameter("id");
   String adminid = (String)session.getAttribute("currentLoginAdminId");
   GetUserData getuserdata = new GetUserData();
   UserData userdata = getuserdata.getCurrentUserData(id);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>'usermodify.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../css/toolbar.css">
  </head>
  <body>
    <jsp:include flush="true" page="header.jsp">
      <jsp:param name="id" value="<%=adminid %>" />
    </jsp:include>
  <table align="center" width="760px" class="datagridstyle" id="modifymsg" cellSpacing=0 cellPadding=3 border=0>
   <tr height="20px">
    <td align="center"><b><%=modifymsg %></b></td>
    <td></td>
   </tr>
  </table>
  
  <form action="AdminModifyUserData?id=<%=id%>&&adminid=<%=adminid %>" method="post" name="ModifyBData" onSubmit="return ModifyUserData(this);">
   <table align="center" width="760px" class="datagridstyle" id="DataGrid1" cellSpacing=0 cellPadding=3 border=0>
     <tr class="datagridhead">
      <td align="center" colspan="2">修改用户信息</td>
      <td></td>
     </tr>
    <tr class="datagrid1212">
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
	    if(userdata.getSex().equals("男")||userdata.getSex().equals(""))
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
	<tr class="datagrid1212">
     <td align="center" colspan="2">
	   <input type="submit" value="提交" onClick="return confirm('确定修改?');" />
	 </td>
	 <td></td>
    </tr>
  </table>
 </form>
  </body>
</html>
