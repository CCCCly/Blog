<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="zw.User.GetUserData" %>
<%@ page import="zw.User.UserData" %>
<%
  String currentuserid = "";
  if((String)session.getAttribute("currentLoginUserId")!=null)
  {
    currentuserid = (String)session.getAttribute("currentLoginUserId");
  }
  
  String id = request.getParameter("id");
  
  GetUserData getuserdata = new GetUserData();
  UserData userdata = getuserdata.getCurrentUserData(id); 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <title><%=id %> 的注销主页</title>
   <link rel="stylesheet" type="text/css" href="css/toolbar.css">
</head>
<script language="javascript">
function CancelUser(f)
{
   if(f.password.value == "")
   {
      alert("请输入确认密码！");
	  return false;
   }
   else
   {
      return true;
   }
}
</script>
  <body>
  <%
   if(currentuserid.equals(id))
   {
  %>
  <table align="center" width="760px" class="datagridstyle" id="modifymsg" cellSpacing=0 cellPadding=3 border=0>
   <tr height="20px">
   </tr>
  </table>
  <form action="CancelUserAction?id=<%=currentuserid%>" method="post" name="ModifyBData" onSubmit="return CancelUser(this);" >
   <table align="center" width="760px" class="datagridstyle" id="DataGrid1" cellSpacing=0 cellPadding=3 border=0>
    <tr class="datagridhead">
      <td align="center" colspan="2">注销账户</td>
    </tr>
    <tr class="datagrid1212">
	  <td align="center" colspan="2" >
	  	请输入密码:<input type="password" name="password" value=""/>(注销账户需要密码确认)
	  </td>
	</tr>
	<tr class="datagrid1212">
	</tr>
	<tr>
     <td align="center" colspan="2">
	   <input type="submit" value="注销" onClick="return confirm('是否确定要注销?');"/>
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