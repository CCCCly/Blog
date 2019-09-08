<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,java.util.*" errorPage=""%>
<%@ page import="cly.User.UserData" %>
<%@ page import="cly.Article.Comment" %>
<%@ page import="cly.Article.getComment" %>
<%@ page import="cly.Admin.UserMessage" %>
<%
  String adminid = (String)session.getAttribute("currentLoginAdminId");
  String strpage = request.getParameter("page");
  int intpage = 1;
  int intpagecount = 1;
  String id = request.getParameter("id");

  if(strpage == null||strpage == ""){
     strpage = "1";
  }
  intpage = java.lang.Integer.parseInt(strpage);
  
  getComment getCom = new getComment();
  List<Comment> items = getCom.getAuditMessage();
  Iterator<Comment> CommentItems = items.iterator();
  intpagecount = getCom.getAuditPageSize();
  

  
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>article manage page</title>
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
    <table height="10px">
          <tr>
           <td></td>
          </tr>
    </table>
         
<hr/>

<table align="center" width="960px" class="datagridstyle" id="DataGrid1" cellSpacing=0 cellPadding=3 border=0>
  <tr class="datagridhead">
   <td>评论数</td>
   <td>内容</td>
   <td>发表者</td>
   <td>发表时间</td>
 </tr> 
  		<%
         int lili = 0;
         for(int i=1;CommentItems.hasNext();i++)
         {
           Comment cmt = (Comment)CommentItems.next();
        %>
        <tr class="datagrid1212">
          <td>
            <%=i %>
          </td>
          <td>
            <%=cmt.getContent() %>
          </td>
          <td>
               <%=cmt.getUser_id() %>
          </td>
          <td>
            <%=cmt.getInsert_time() %>
          </td>
          <td>
		        <a href="AuditComDAO?currentid=<%=id%>&&comment_no=<%=cmt.getId()%>" onClick="return confirm('是否要通过该评论?');">
	        		   通过</a>
   		  </td>
        </tr>
        <%
         }
        %>
</table>
<br>
<br>
第<%=intpage%>页&nbsp;&nbsp;共<%=intpagecount%>页&nbsp;&nbsp;
  <%
 	if(intpage>1)
 	{
  %>
     <a href="adminarticle.jsp?id=<%=id %>&&page=<%=intpage-1%>">上一页</a>
  <%
    }
  %>&nbsp;&nbsp;
  <%
   if(intpage<intpagecount)
   {
  %>
     <a href="adminartcile.jsp?id=<%=id %>&&page=<%=intpage+1%>">下一页</a>
  <%
   }
  %>
  </body>
</html>