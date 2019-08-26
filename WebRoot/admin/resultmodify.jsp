<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="zw.Result.Result" %>
<%@ page import="zw.Result.ShowResult" %>
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
  String adminid = (String)session.getAttribute("currentLoginAdminId");
  String start = request.getParameter("start");
  String end = request.getParameter("end");
  if(start == null||start == "")
  {
     end=start="0";
  }
  int score_start = Integer.parseInt(start);
  int score_end = Integer.parseInt(end);   
  ShowResult showRes = new ShowResult();
  Result res = showRes.getResultByScore(score_start);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
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
 <%
   if(adminid!=null)
   {
 %>
  <table align="center" width="760px" class="datagridstyle" id="modifymsg" cellSpacing=0 cellPadding=3 border=0>
    <tr height="20px">
     <td align="center"><b><%=modifymsg %></b></td>
     <td></td>
    </tr>
  </table>
  <form action="ModifyResultAction?start=<%=score_start%>&&end=<%=score_end%>" method="post" name="ModifyBData">
   <table align="center" width="760px" class="datagridstyle" id="DataGrid1" cellSpacing=0 cellPadding=3 border=0>
     <tr class="datagridhead">
      <td align="center" colspan="2">修改评分标准</td>
      <td></td>
     </tr>
    <tr>
	  <td>评分范围:</td>
	  <td>
		<%=res.getScore_Start()%>-<%=res.getScore_End()%>
	  </td>
	</tr>
	<tr class="datagrid1212">
	  <td>内容:</td>
	  <td><textarea name="result_content" cols="40" rows="11"><%=res.getResult_Content()%></textarea></td>
	</tr>
    <tr>
     <td align="center" colspan="2">
	   <input type="submit" value="提交" />
	 </td>
	 <td></td>
    </tr>
  </table>
 </form>
<%
  }
%>
</body>
</html>
