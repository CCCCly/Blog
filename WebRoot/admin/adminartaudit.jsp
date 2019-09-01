<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,java.util.*" errorPage=""%>
<%@ page import="zw.User.UserData" %>
<%@ page import="zw.Article.Article" %>
<%@ page import="zw.Article.getArticle" %>
<%@ page import="zw.Admin.UserMessage" %>
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
  
  getArticle getArt = new getArticle();
  List<Article> items = getArt.getAuditMessage();
  Iterator<Article> artItems = items.iterator();
  intpagecount = getArt.getAuditPageSize();
  
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
   <td>文章数</td>
   <td>主题</td>
   <td>发表者</td>
   <td>发表时间</td>
 </tr> 
  		<%
         int lili = 0;
         for(int i=1;artItems.hasNext();i++)
         {
           Article art = (Article)artItems.next();
        %>
        <tr class="datagrid1212">
          <td>
            <%=i %>
          </td>
          <td>
            <a href="adminarticle_action.jsp?id=<%=id %>&&serial=<%=art.getArticle_no() %>"><%=art.getTitle() %></a>
          </td>
          <td>
               <%=art.getSpeaker() %>
          </td>
          <td>
            <%=art.getSent_time() %>
          </td>
          <td>
		        <a href="AuditArtDAO?currentid=<%=id%>&&article_no=<%=art.getArticle_no()%>" onClick="return confirm('是否要通过该文章?');">
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