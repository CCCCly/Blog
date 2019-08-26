<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage=""%>
<%@ page import="zw.User.*" %>

<%
  session.setAttribute("score",0);
  String id = request.getParameter("id");
  GetUserData getuserdata = new GetUserData();
  UserData userdata = getuserdata.getCurrentUserData(id);
%>

<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <title><%=id%> 的主页</title>
 <link rel="stylesheet" type="text/css" href="css/lightbox.css">
</head>

<body>
    <jsp:include flush="true" page="header.jsp">
      <jsp:param name="id" value="<%=id %>" />
    </jsp:include>
    
    <jsp:include flush="false" page="footer.jsp" />    
</body>
</html>
