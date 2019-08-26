<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="zw.TestQuestion.Question" %>
<%@ page import="zw.TestQuestion.Answer" %>
<%@ page import="zw.TestQuestion.ShowQuestion" %>
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
  String questionid = request.getParameter("questionid");
  if(questionid == null||questionid == "")
  {
     questionid = "1";
  }
  int question_id = Integer.parseInt(questionid); 
  ShowQuestion showQue = new ShowQuestion();
  Question que = showQue.getQuestionByNo(question_id);
  List<Answer> AnswerItems = showQue.getAnswerByQuestion_id(question_id);
  Iterator<Answer> answerItems = AnswerItems.iterator();
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
     <td></td><td></td>
    </tr>
  </table>
  <form action="ModifyQuestionAction?questionid=<%=questionid%>" method="post" name="ModifyBData">
   <table align="center" width="760px" class="datagridstyle" id="DataGrid1" cellSpacing=0 cellPadding=3 border=0>
    <tr class="datagridhead">
      <td align="center" colspan="2">修改测试题</td>
      <td></td>
	  <td></td>
    </tr>
    <tr>
	  <td>题号: <%=que.getQuestion_Id()%></td>
	  <td></td>
	  <td></td>
	</tr>
	<tr class="datagrid1212">
	  <td>题目：</td>
	  <td align="center"><textarea name="questioncontent" cols="30" rows="9"><%=que.getQuestion_Content()%></textarea></td>
	  <td></td>
	</tr>
	<tr class="datagridhead">
	<td>答案</td><td align="center">内容</td><td>分数</td>
	</tr>
	    <%
         for(int i=1;answerItems.hasNext();i++)
         {
           Answer answer = (Answer)answerItems.next();
        %>
	    <tr class="datagrid1212">
	      <td>选项<%=answer.getAnswer_Option()%>:</td>
			<td align="center">
			<% 
				String j=String.valueOf(i);
				String answercontent="answercontent_"+j;
				String score="score_"+j;
			%>
			<input type="text"  name="<%=answercontent%>" value="<%=answer.getAnswer_Content()%>"/>
			</td>
			<td><input type="text"  size="2" name="<%=score%>" value="<%=answer.getAnswer_Score()%>"/></td>
	    </tr>
	    <%
	     } 
	    %>
    <tr>
     <td align="center" colspan="2">
	   <input type="submit" value="保存修改" />
	 </td>
	 <td></td><td></td>
    </tr>
  </table>
 </form>
<%
  }
%>
</body>
</html>
