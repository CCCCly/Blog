<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage=""%>
<%@ page import="cly.User.UserData" %>
<%@ page import="cly.Article.Article" %>
<%@ page import="cly.Article.getArticle" %>
<%
  String dealforummsg = (String)session.getAttribute("dealforummsg");
  if(dealforummsg==null)
  {
    dealforummsg = "";
  }
  else
  {
    session.removeAttribute("dealforummsg");
  }
  
  String currentuserid = "";
  if((String)session.getAttribute("currentLoginUserId")!=null)
  {
    currentuserid = (String)session.getAttribute("currentLoginUserId");
  }
  String id = request.getParameter("id");
  getArticle getArt = new getArticle();
  List<Article> items = getArt.getArticleMessage(id);
  Iterator<Article> artItems = items.iterator();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">	 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=id %> 的文章</title>
<link rel="stylesheet" type="text/css" href="css/toolbar.css">
</head>

<body>
   <jsp:include flush="true" page="header.jsp">
      <jsp:param name="id" value="<%=id %>" />
   </jsp:include>
   
  <%
  	if(currentuserid.equals(id)&&!("".equals(currentuserid)))
  	{
  %>
  <div id="clear">
    <a href="article_send.jsp?id=<%=currentuserid %>"><img src="image/icon_appeararticle.gif" border="0" alt="发表新文章"></a>
  </div>
<br>
<br>
	<table align="center" height="10px">
	 <tr>
	  <td><b><%=dealforummsg %></b></td>
	 </tr>
	</table>     
<hr/> 
	<table align="center" width="960px" class="datagridstyle" id="DataGrid1" cellSpacing=0 cellPadding=3 border=0>
	  <tr class="datagridhead">
	   <td>文章数</td><td>主题</td><td>发表者</td><td>发表时间</td>
	  </tr> 
	  <%
	  	for(int i=1;artItems.hasNext();i++)
	    {
	    	Article art = (Article)artItems.next();
	  %>
	  <tr class="datagrid1212">
	  	<td>
			<%=i %>
	    </td>
	    <td>
	        <a href="article.jsp?id=<%=id %>&&serial=<%=art.getArticle_no() %>"><%=art.getTitle() %></a>
	    </td>
	    <td>
	        <%=art.getSpeaker() %>
	    </td>
	    <td><%=art.getSent_time() %></td>
	  <% 
	    }
	  %>
	  </tr>
	</table>
<br>
  <%
 	} 
  %>
   <div id="lastfoot">
     <jsp:include flush="false" page="footer.jsp"></jsp:include>
   </div>
</body>
</html>
