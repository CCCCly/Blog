<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage=""%> 
<%
  String adminid = (String)session.getAttribute("currentLoginAdminId");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>manage page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../css/toolbar.css">
  </head>
  <body>
    <jsp:include flush="true" page="header.jsp">
      <jsp:param name="username" value="<%=adminid %>" />
    </jsp:include>
  </body>
</html>
