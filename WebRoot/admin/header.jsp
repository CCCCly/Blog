<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage=""%>
<%
  String adminid = (String)session.getAttribute("currentLoginAdminId");
%>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <title>管理员主页</title>
 <link rel="stylesheet" type="text/css" href="../css/toolbar.css"> 
</head>
<body>
    <div id="headImage">
        <img src="../image/IMG_0393.jpg" width="960px" height="130px" alt="性格测试网站后台管理平台">
    </div>
    <div id="Head">
      <div id="HeadTop"> 
        <div id="welcome">
       <ul><li><p align="right">欢迎你 管理员 <a href="logout.jsp">退出</a></p></li></ul>
     	</div>     
     </div>
   </div>
   <div id="ChannelMenu">
     <ul>
       <li>
         <a href="../index.jsp" target="_blank">首页&nbsp;&nbsp;</a>
       </li>
       <li>
         <a href="adminuser.jsp" target="_top"  id="CurrentLink">用户管理&nbsp;&nbsp;</a>
       </li>      
       <li>
         <a href="adminarticle.jsp" target="_top" id="CurrentLink">文章管理&nbsp;&nbsp;</a>
	   </li>
    </ul>
  </div>
  </body>
</html>
