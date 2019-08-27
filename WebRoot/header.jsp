<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage=""%>
<%@ page import="zw.User.*" %>
<%
  String currentuserid = "";
  if((String)session.getAttribute("currentLoginUserId")!=null)
  {
    currentuserid = (String)session.getAttribute("currentLoginUserId");
  }
  String id = request.getParameter("id");
  GetUserData User=new GetUserData();
  UserData user=User.getCurrentUserData(currentuserid);
%>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <title>个人主页</title> 
 <link rel="stylesheet" type="text/css" href="css/toolbar.css">
</head>
<body> 
    <div id="headImage">
      <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="960" height="200">
          <param name="movie" value="image/top.jpg">
          <param name="quality" value="high">
          <embed src="image/top.jpg"  width="960" height="200"></embed>
      </object>
    </div>
    
    <div id="Head">
      <div id="HeadTop">
        <div id="welcome">
        	<%
         		if(!id.equals("")&&currentuserid.equals(id))
         		{
         	%>
       				<ul><li><p align="right">欢迎你 <%=id%><a href="logout.jsp">&nbsp;退出&nbsp;</a><a href="cancel.jsp?id=<%=id%>">注销</a></p></li></ul>
       		<%
         		}
         		else 
         		{ 
       		%>
       				<ul><li><p align="right">请先登录</p></li></ul>
       		<%
       			} 
       		%>
       </div>     
     </div>
   </div>
   <div id="ChannelMenu">
     <ul>
     	<li><a href="index.jsp?id=<%=id %>" target="_top" id="CurrentLink"">首页&nbsp;</a></li>
     	<li><a href="articleindex.jsp?id=<%=id %>" target="_top"  id="CurrentLink">文章管理&nbsp;</a></li> 
        <li><a href="modify_userdata.jsp?id=<%=id %>" target="_top" id="CurrentLink">用户信息&nbsp;</a></li>
    </ul>
  </div>
</body>
</html>
