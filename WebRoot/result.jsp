<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage=""%> 
<%@ page import="zw.User.UserData" %>
<%@ page import="zw.Result.ShowResult" %>
<%@ page import="zw.Result.Result" %>
<%
  String currentuserid = "";
  if((String)session.getAttribute("currentLoginUserId")!=null)
  {
    currentuserid = (String)session.getAttribute("currentLoginUserId");
  }
  int score;
  score=(Integer)session.getAttribute("score");
  String submit = request.getParameter("submit");
  String time = request.getParameter("time");
  if(score==0)
  {
  	String test_score=request.getParameter("test_score");
  	score=  Integer.valueOf(test_score).intValue();;
  }
  if(submit==""||submit==null)
  {
  	submit="0";
  }
  int flag = Integer.parseInt(submit);  
  ShowResult showResult = new ShowResult();
  Result res=showResult.getResultByScore(score);
  String result=res.getResult_Content();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title><%=currentuserid%>的测试结果</title>
	<link rel="stylesheet" type="text/css" href="css/toolbar.css">
</head>
<body>
<br><br>
<br>
    <table align="center" width="960px" id="DataGrid1" cellSpacing=0 cellPadding=3 border=0>
      <tr class="datagridhead">
        <td>您的性格测试结果为:</td>
      </tr>
	  <tr>
	    <td></td>
	  </tr>
	  <tr>
	      <td>&nbsp;&nbsp;&nbsp;&nbsp;<%=result%></td>
	  </tr>
	  <%
	  	if(flag==1)
	  	{
	  %>
	  <tr>
	      <td>测试时间:<%=time%></td>
	  </tr>
	  <%
	  	} 
	  %>
	 </table>
	  <br><br><br><br>
<br>
     <%
      if(!("".equals(currentuserid))&&flag!=1)
      {
     %>
     <form method="post" action="ResultDAO?result=<%=result%>&&id=<%=currentuserid%>&&score=<%=score%>" onSubmit="return isOK(this);">
      <table align="center" width="960px" class="datagridstyle" id="DataGrid1" cellSpacing=0 cellPadding=3 border=0>
       <tr>
         <td align="center"><input type="submit" size="10" value="保存结果"/></td>
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
