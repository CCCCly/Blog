<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage=""%> 
<%@ page import="zw.Admin.ResultMessage" %>
<%@ page import="zw.Result.Result" %>
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
  ResultMessage resultmessage = new ResultMessage();
  List<Result> questionItems = resultmessage.getAllResultMessage(intpage);
  Iterator<Result> resultIter = questionItems.iterator();
  intpagecount = resultmessage.getPageSize();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>adminresult.jsp' starting page</title>
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
              if(confirm("是否删除该结果?"))
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
<p>全部评分标准</p>
<br><br><a href="adminresult_add.jsp">增加评分标准</a>
    <table height="10px" align="center">
     <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
     </tr>
    </table>
    <table align="center" width="960px" class="datagridstyle" id="DataGrid1" cellSpacing=0 cellPadding=10 border=1>
     <tr class="datagridhead">
      <td>分值范围</td>
      <td>结果</td>
      <td></td>
      <td></td>
     </tr>
     <%
     if(adminid!=null)
     {
       int i = 0;
       while(resultIter.hasNext())
       {
          i++;          
          Result result = (Result)resultIter.next();
     %>
     <tr class="datagrid1212">
      <td><%=result.getScore_Start()%>-<%=result.getScore_End()%></td>
      <td><%=result.getResult_Content() %></td>
      <td><a href="resultmodify.jsp?start=<%=result.getScore_Start()%>&&end=<%=result.getScore_End()%>">修改</a></td>
      <td><a href="AdminDeleteResult?start=<%=result.getScore_Start()%>&&end=<%=result.getScore_End()%>" onClick="return isDelete();">删除</a></td>
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
     <a href="adminresult.jsp?page=<%=intpage-1%>">上一页</a>
	<%
		}
	%>&nbsp;&nbsp;
	<%
		if(intpage<intpagecount)
  		{
  	%>
     <a href="adminresult.jsp?page=<%=intpage+1%>">下一页</a>
    <%
     	} 
     }
    %>
</div>
</body>
</html>
