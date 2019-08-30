<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage=""%> 
<%@ page import="zw.Admin.UserMessage" %>
<%@ page import="zw.User.UserData" %>
<%
  String adminid = (String)session.getAttribute("currentLoginAdminId");
  String strpage = request.getParameter("page");
  int intpage = 1;
  int intpagecount = 1;
  if(strpage == null||strpage == "")
  {
     strpage = "1";
  }
  intpage = java.lang.Integer.parseInt(strpage);
  UserMessage usermessage = new UserMessage();
  List<UserData> userItems = usermessage.getAllUserMessage(intpage);
  Iterator<UserData> userIter = userItems.iterator();
  intpagecount = usermessage.getPageSize();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>adminuser.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../css/toolbar.css">
  </head>
  <script language="javascript">
	function isCancel()
	{
              if(confirm("是否注销该用户?"))
              {
                return true;
              }
              else
              {
                return false;
              }
    }
    function isActive()
	{
              if(confirm("是否激活该用户?"))
              {
                return true;
              }
              else
              {
                return false;
              }
    }
  </script>
  <body>
    <jsp:include flush="true" page="header.jsp">
      <jsp:param name="id" value="<%=adminid %>" />
    </jsp:include>
    <table height="10px" align="center">
     <tr>
      <td></td>
     </tr>
    </table>
<p>已注册用户</p> 
    <table height="10px" align="center">
     <tr>
      <td></td>
     </tr>
    </table>
    <table align="center" width="960px" class="datagridstyle" id="DataGrid1" cellSpacing=0 cellPadding=3 border=0>
     <tr class="datagridhead">
      <td>ID</td>
      <td>性别</td>
      <td>昵称</td>
      <td>年龄</td>
      <td>生日</td>
      <td>邮箱</td>
      <td>注册时间</td>
     </tr>
     <%
       int i = 0;
       while(userIter.hasNext())
       {
          i++;          
          UserData userdata = (UserData)userIter.next();
      %>
     <tr class="datagrid1212">
      <td>
       <a href="adminarticle.jsp?id=<%=userdata.getId() %>" title="<%=userdata.getId() %>的文章" target="_top"><%=userdata.getId() %></a>
      </td>
      <td><%=userdata.getSex()%></td>
      <td><%=userdata.getName()%></td>
      <td><%=userdata.getAge()%></td>
      <td><%=userdata.getBirthday()%></td>
      <td><%=userdata.getEmail()%></td>
      <td><%=userdata.getRegistertime()%></td>
      <td>
        <a href="usermodify.jsp?id=<%=userdata.getId() %>">修改</a>
      </td>
    </tr>
     <%
        }
     %>   
   </table>   
<br>
<br>
<div id="pagechange">
	第<%=intpage%>页&nbsp;&nbsp;共<%=intpagecount%>页&nbsp;
 	<%
 		if(intpage>1)
 		{
 	%>
     <a href="adminuser.jsp?page=<%=intpage-1%>">上一页</a>
	<%
		}
	%>&nbsp;&nbsp;
	<%
		if(intpage<intpagecount)
  		{
  	%>
     <a href="adminuser.jsp?page=<%=intpage+1%>">下一页</a>
    <%
     	} 
    %>
  </div>
  </body>
</html>
