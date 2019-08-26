<%@page import="org.apache.struts2.components.Else"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage=""%> 
<%@ page import="zw.TestQuestion.Question" %>
<%@ page import="zw.TestQuestion.Answer" %>
<%@ page import="zw.TestQuestion.ShowQuestion" %>
<%
  String currentuserid = "";
  if((String)session.getAttribute("currentLoginUserId")!=null)
  {
    currentuserid = (String)session.getAttribute("currentLoginUserId");
  }
  String questionid = request.getParameter("questionid");
  int questionserial = Integer.parseInt(questionid);  //获得题号
  ShowQuestion showQuestion = new ShowQuestion();
  Question que = showQuestion.getQuestionByNo(questionserial);
  List<Answer> AnswerItems = showQuestion.getAnswerByQuestion_id(que.getQuestion_Id());
  Iterator<Answer> answerItems = AnswerItems.iterator();
  int qmax=Question.getQuestionNUmber();
%>	
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<html>
<head>
    <title>My JSP 'test.jsp' page</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="css/toolbar.css">
</head>
<script language="javascript">
function isOK(f)
{
   else if(f.option.value == "")
  {
     alert("选项不能为空!");
	 return false;
  }
}
</script>
<body>
<br><br>
        
    <table align="center" height="10px">
    </table>
<br>
    <table align="center" width="960px" id="DataGrid1" cellSpacing=0 cellPadding=3 border=0>
      <tr class="datagridhead">
        <td>第<%=questionserial%>题(选定不可修改，请仔细选择)</td>
      </tr>
      <tr><td align='right'></td></tr>
	  <tr><td></td></tr>
	  <tr>
	      <td><%=que.getQuestion_Content()%></td>
	  </tr>
	  </table>
	  <br><br><br><br>
	  <table align="center" width="960px"  id="DataGrid1" cellSpacing=0 cellPadding=3 border=0>
       <tr class="datagridhead"></tr>
	  </table>
<br>
     <form method="post" action="TestDAO?questionid=<%=questionserial%>" onSubmit="return isOK(this);">
      <table align="center" width="960px" class="datagridstyle" id="DataGrid1" cellSpacing=0 cellPadding=3 border=0>
      <%
      	for(int i=1;answerItems.hasNext();i++)
	    {
	          	 Answer answer = (Answer)answerItems.next();
	  %>
	    <tr class="datagrid1212"> 
	    	<td>
	     		<input type=radio value="<%=answer.getAnswer_Score()%>" name="option"><%=answer.getAnswer_Option()%>:<%=answer.getAnswer_Content()%>
	     	</td>
	    </tr>
  	  <%
        }
      %>
	    <tr class="datagrid1212">
 			<td colspan="2" align="center">
 			<%
 			  if(questionserial==qmax)
 			  {
 			%>
 				<input type="submit" value="提交"/>&nbsp;&nbsp;
 			<% 
 			  }
 			%>

  			<%
  			  if(questionserial<qmax)
  			  {
  			%>
  		    	<input type="submit" value="下一题" />
  			<%
  			  } 
  			%>
 			</td>
		</tr>
      </table>    
     </form>
   <div id="lastfoot">
     <jsp:include flush="false" page="footer.jsp"></jsp:include>
   </div>
</body>
</html>

