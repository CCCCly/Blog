<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage=""%> 
<%@ page import="zw.User.UserData" %>
<%@ page import="zw.Article.Article" %>
<%@ page import="zw.Article.Comment" %>
<%@ page import="zw.Article.ShowArticle" %>
<%
  String currentuserid = null;
  if((String)session.getAttribute("currentLoginUserId")!=null)
  {
    currentuserid = (String)session.getAttribute("currentLoginUserId");
  }
  String id = request.getParameter("id");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加文章</title>
</head>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>  
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/ueditor.all.min.js"> </script>  
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>  
<script type="text/javascript">
var ue = UE.getEditor('content');
</script>
<body>
	<form action="SendArticleDAO?currentuserid=<%=currentuserid%>" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>文章标题</td><td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>文章内容</td><td><textarea name="content" id="content" style="width: 800px; height: 400px; margin: 0 auto;"></textarea></td>
			</tr>
			<tr>
				<td><input type="submit" value="发表"></td>
			</tr>
		</table>
	</form>
</body>
</html>