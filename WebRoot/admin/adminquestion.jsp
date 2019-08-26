<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage=""%> 
<%@ page import="zw.Admin.QuestionMessage" %>
<%@ page import="zw.TestQuestion.Question" %>
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
  QuestionMessage questionmessage = new QuestionMessage();
  List<Question> questionItems = questionmessage.getAllQuestionMessage(intpage);
  Iterator<Question> questionIter = questionItems.iterator();
  intpagecount = questionmessage.getPageSize();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>adminquestion.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../css/toolbar.css">
  </head>
  <script language="javascript">
	function isDelete()
	{
              if(confirm("是否删除该题目?"))
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
<p>全部题目</p>
<br><br><a href="adminquestion_add.jsp">增加题目</a>
    <table align="center" width="960px" class="datagridstyle" id="DataGrid1" cellSpacing=0 cellPadding=3 border=0>
     <tr class="datagridhead">
      <td>题号</td>
      <td>题目 </td>
     </tr>
     <%
     if(adminid!=null)
     {
       int i = 0;
       while(questionIter.hasNext())
       {
          i++;          
          Question question = (Question)questionIter.next();
     %>
	     <tr class="datagrid1212">
	      <td><%=i%></td>
	      <td><%=question.getQuestion_Content() %></td>
	      <td><a href="questionmodify.jsp?questionid=<%=question.getQuestion_Id()%>">修改</a></td>
		  <td><a href="AdminDeleteQuestion?questionid=<%=question.getQuestion_Id()%>" onClick="return isDelete();">删除</a></td>
      <%
      	} 
      %>
    	</tr>
   </table>   
<br>
<br>
<div id="pagechange">
	第<%=intpage%>页&nbsp;&nbsp;共<%=intpagecount%>页&nbsp;
 	<%
 		if(intpage>1)
 		{
 	%>
     <a href="adminquestion.jsp?page=<%=intpage-1%>">上一页</a>
	<%
		}
	%>&nbsp;&nbsp;
	<%
		if(intpage<intpagecount)
  		{
  	%>
     <a href="adminquestion.jsp?page=<%=intpage+1%>">下一页</a>
    <%
     	} 
     }
    %>
  </div>
  </body>
</html>
