<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,java.util.*" errorPage=""%> 
<%@ page import="zw.User.UserData" %>
<%@ page import="zw.Article.Article" %>
<%@ page import="zw.Article.Comment" %>
<%@ page import="zw.Article.ShowArticle" %>
<%
  String adminid = (String)session.getAttribute("currentLoginAdminId");
  
  String numberpage = request.getParameter("numberpage");
  if(numberpage == null||numberpage == ""){
    numberpage = "1";
  }
  String id = request.getParameter("id");
  String strserial = request.getParameter("serial");
  int serial = Integer.parseInt(strserial);  //获得文章的系列号
  String strpage = request.getParameter("page");
  if(strpage == null||strpage == "")
  {
     strpage = "1";
  }
  ShowArticle showArt = new ShowArticle();
  Article art = showArt.getArticleByNo(serial);
  List<Comment> CommentItems = showArt.getCommentByArticle_no(serial);
  Iterator<Comment> commentItems = CommentItems.iterator();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'adminarticle_action.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/toolbar.css">
  </head>
  <script language="javascript">
	function isDelete()
	{
              if(confirm("是否删除该文章?"))
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
    <table align="center" width="960px" class="datagridstyle" id="DataGrid1" cellSpacing=0 cellPadding=3 border=0>
     <tr class="datagridhead">
        <td>发表的文章</td>
     </tr>
      <tr>
        <td align='right'>
          <%
          if(adminid!=null)
          {
          %>
           <a href="AdminDeleteArticleDAO?currentid=<%=id %>&&article_no=<%=strserial %>" onClick="return isDelete();">
             <img src='../image/article_delete.gif' border='0' alt='删   除'>&nbsp;删除
           </a>
          <%
          }
          %>
        </td>
      </tr>
      <tr>
         <td>&nbsp;&nbsp;&nbsp;主题:&nbsp;&nbsp;<%=art.getTitle() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
      </tr>
      <tr class="datagrid1212">
         <td>&nbsp;&nbsp;&nbsp;发表者:&nbsp;&nbsp;<%=art.getSpeaker() %>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发表时间:&nbsp;&nbsp;<%=art.getSent_time() %>
	     </td>
	  </tr>
	  <tr>
	    <td></td>
	  </tr>
	    <tr>
	      <td>&nbsp;&nbsp;&nbsp;&nbsp;<%=art.getContent() %></td>
	    </tr>
	  </table>
	  <br><br>
	  <br><br>
	  <table align="center" width="960px" class="datagridstyle" id="DataGrid1" cellSpacing=0 cellPadding=3 border=0>
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
	      &nbsp;&nbsp;&nbsp;回复ID:&nbsp;&nbsp;<%=comment.getUser_id()%>&nbsp;&nbsp;&nbsp;
	      &nbsp;&nbsp;&nbsp;回复时间:&nbsp;&nbsp;<%=comment.getInsert_time() %>
	      <%
          if(adminid!=null)
          {
          %>
	      <a href="AdminDeleteReply?currentid=<%=id %>&&article_no=<%=strserial %>&&id=<%=comment.getId() %>" onClick="return isDelete();">
	          <img src="../image/article_delete.gif" border='0' alt='删   除'>&nbsp;删除
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
  </body>
</html>
