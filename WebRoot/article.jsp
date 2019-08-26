<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage=""%> 
<%@ page import="zw.User.UserData" %>
<%@ page import="zw.Article.Article" %>
<%@ page import="zw.Article.Comment" %>
<%@ page import="zw.Article.ShowArticle" %>
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
  String strserial = request.getParameter("serial");
  int serial = Integer.parseInt(strserial);  //获得文章的系列号
  
  ShowArticle showArt = new ShowArticle();
  Article art = showArt.getArticleByNo(serial);
  List<Comment> CommentItems = showArt.getCommentByArticle_no(serial);
  Iterator<Comment> commentItems = CommentItems.iterator();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title><%=id%> 的文章</title>
	<link rel="stylesheet" type="text/css" href="css/toolbar.css">
</head>
<script language="javascript">
function isOK(f)
{
   else if(f.content.value == "")
  {
     alert("评论内容不能为空!");
	 return false;
   }
   else if(f.content.value.length>100)
  {
     alert("内容不能多于 100字!");
	 return false;
   }
   else{  return true;  }
}
</script>
<body>
  <jsp:include flush="true" page="header.jsp">
      <jsp:param name="id" value="<%=id %>" />
      <jsp:param name="numberpage" value="2" />
  </jsp:include>
  <%
    if(currentuserid.equals(id)&&!("".equals(currentuserid)))
    {
  %>
  <div id="clear">
    <a href="article_send.jsp?id=<%=currentuserid%>"><img src="image/icon_appeararticle.gif" border="0" alt="发表文章"></a>
  </div>
  <%
  	}
  %>
<br><br>
    <table align="center" height="10px">
     <tr><td><b><%=dealforummsg%></b></td></tr>
    </table>
<br>
    <table align="center" width="960px" id="DataGrid1" cellSpacing=0 cellPadding=3 border=0>
      <tr class="datagridhead">
        <td>发表的文章</td>
      </tr>
      <tr>
        <td align='right'>
          <%
          	if(currentuserid.equals(id)&&currentuserid!=null)
          	{
          %>
          
    	    <a href="editarticle.jsp?id=<%=currentuserid%>&&serial=<%=strserial%>" target="_top">编辑</a>&nbsp;&nbsp;
           <a href="DeleteArticleDAO?currentuserid=<%=currentuserid%>&&article_no=<%=strserial%>" onClick="return confirm('是否要删除该文章?');">
             <img src='image/article_delete.gif' border='0' alt='删   除'>删除
           </a>
          <%
           	}
          %>
        </td>
      </tr>
      <tr>
         <td>主题:《<%=art.getTitle()%>》</td>
      </tr>
      <tr class="datagrid1212">
         <td>作者ID:&nbsp;<%=art.getSpeaker()%>&nbsp;&nbsp;时间:&nbsp;<%=art.getSent_time()%>
	     </td>
	  </tr>
	  <tr>
	    <td></td>
	  </tr>
	  <tr>
	      <td><%=art.getContent()%></td>
	  </tr>
	  </table>
	  <br><br><br><br>
	  <table align="center" width="960px"  id="DataGrid1" cellSpacing=0 cellPadding=3 border=0>
       <tr class="datagridhead">
	      <td>评论</td>
	   </tr>
	    <%
	    	for(int i=1;commentItems.hasNext();i++)
	    	{
	        	Comment comment = (Comment)commentItems.next();
	    %>
			    <tr class="datagrid1212">
			      <td>
			     	 &nbsp;&nbsp;&nbsp;回复ID:&nbsp;&nbsp;<%=comment.getUser_id()%>
			      	 &nbsp;&nbsp;&nbsp;回复时间:&nbsp;&nbsp;<%=comment.getInsert_time() %>
			      <%
		          	if(comment.getUser_id().equals(id)&&currentuserid!=null||art.getSpeaker().equals(id)&&currentuserid!=null)
		          	{
		          %>
			      	<a href="DeleteReplyAction?currentuserid=<%=currentuserid %>&&article_no=<%=strserial %>&&id=<%=comment.getId() %>" onClick="return confirm('是否要删除该回复?');">
			          <img src='image/article_delete.gif' border='0' alt='删   除'>删除
			      	</a>
			      <%
			      	}
			      %>
			      </td>
			    </tr>
			    <tr>
			      <td>&nbsp;&nbsp;&nbsp;&nbsp;<%=comment.getContent() %></td>
			    </tr>
			    <tr height="30px">
			      <td>
			      </td>
			    </tr>
	    <%
	    	} 
	    %>
	  </table>
	 
<br>
     <%
        if(currentuserid.equals(id)&&currentuserid!=null)
        {
     %>
	     <form method="post" action="CommentDAO?strserial=<%=strserial %>&&id=<%=id %>" onSubmit="return isOK(this);">
	      <table align="center" width="960px" class="datagridstyle" id="DataGrid1" cellSpacing=0 cellPadding=3 border=0>
	       <tr class="datagridhead">
	         <th><font color='black'>发表评论:</font></th>
	       </tr>
	       <tr>
	         <td>内容:</td>
	       </tr>
	       <tr>
	         <td><textarea name="content" cols="30" rows="5"></textarea></td>
	       </tr>
	       <tr>
	         <td><input type="submit" size="10" value="回  复"/></td>
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
