<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage=""%> 
<%@ page import="zw.Article.MessageShow" %>
<%@ page import="zw.Article.Article" %>
<%@ page import="zw.Article.getArticle" %>
<%@ page import="zw.User.*" %>
<%  
  String id = request.getParameter("id");
  if(id!=null)
  {
  	session.setAttribute("currentLoginUserId",id);
  }
  session.setAttribute("score",0);
  String strpage = request.getParameter("page");
  int intpage = 1;
  int intpagecount = 1;
  if(strpage == null||strpage == "")
  {
     strpage = "1";
  }
  intpage = java.lang.Integer.parseInt(strpage);
  MessageShow showMsg = new MessageShow();
  List<Article> messageItems = showMsg.getMessage(intpage);
  Iterator<Article> messItems = messageItems.iterator();
  intpagecount = showMsg.getPageSize();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>BLOG index by CLY</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href="css/index_div.css" rel="stylesheet" type="text/css" />
  </head>
  
<body>
<div id="all">
  <div id="top">
    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"  width="900" height="200">
      <param name="movie" value="image/top1.jpg">
      <param name="quality" value="high">
      <embed src="image/top1.jpg" width="900" height="200"></embed>
    </object>
  </div>
  <div id="menu">
  </div>
 <div id="publication"> 
 <div id="messageshow">
   <table width="100%" class="datagridstyle" id="DataGrid1" cellSpacing=0 cellPadding=3 border=0>
  	<tr class="datagridhead12">
   		<td>&nbsp;</td><td>主题</td><td>发布者</td><td>发布时间</td>
    </tr> 
 		<%
         int lili = 0;
         for(int i=1;messItems.hasNext();i++)
         {
           Article msgDetail = (Article)messItems.next();
           if(i%2==0)
           {
        %>
        <tr class="datagrid1212">
          <td>
            <a href="article.jsp?serial=<%=msgDetail.getArticle_no()%>&&id=<%=id %>" target="_top" title="查看文章"><%=i %></a>
          </td>
          <td>
            <a href="article.jsp?serial=<%=msgDetail.getArticle_no()%>&&id=<%=id %>" target="_top" title="查看文章"><%=msgDetail.getTitle() %></a>
          </td>
          <td>
            <%=msgDetail.getSpeaker()%>            
          </td>
          <td>
            <%=msgDetail.getSent_time()%>
          </td>
        </tr>
        <%
           }
           else
           { 
        %>
        <tr>
          <td>
            <a href="article.jsp?serial=<%=msgDetail.getArticle_no()%>&&id=<%=id %>" target="_top" title="查看文章"><%=i %></a>
          </td>
          <td>
            <a href="article.jsp?serial=<%=msgDetail.getArticle_no()%>&&id=<%=id %>" target="_top" title="查看文章"><%=msgDetail.getTitle() %></a>
          </td>
          <td>
           <%=msgDetail.getSpeaker()%>           
          </td>
          <td>
            <%=msgDetail.getSent_time()%>
          </td>
        </tr>
        <%
           } 
         }
        %>
  </table>
</div>
 <div id="pagechange">
	第<%=intpage%>页&nbsp;&nbsp;共<%=intpagecount%>页&nbsp;
 	<%
 		if(intpage>1)
 		{
 	%>
     <a href="index.jsp?page=<%=intpage-1%>">上一页</a>
	<%
		}
	%>&nbsp;&nbsp;
	<%
		if(intpage<intpagecount)
  		{
  	%>
     <a href="index.jsp?page=<%=intpage+1%>">下一页</a>
    <%
        }
    %>   
  </div>
</div>

<div id="login">
<script language="javascript">
function isLoginOK(f)
{
  if(f.login_id.value=="")
  {
     alert("登录ID不能为空!");
	 return false;
   }
   else if(f.password.value.length>20)
   {
      alert("密码长度必须是20以内的数字或字母!");
	  return false;
   }
   else
   {  
   	  return true;  
   }
}
</script> 
<form method="post" name="loginform" id="loginformid" action="Login" onSubmit="return isLoginOK(this);">
<table align="center" width="100%" height="100%" id="DataGrid1" cellSpacing=0 cellPadding=3 border=0>
  <tr class="datagridhead">
    <td colspan="2" align="center">用户登录 </td>
    <td></td>
  </tr>
  <tr height="20px">
   <td></td>
   <td></td>
  </tr>
  <tr class="datagrid1212">
   <td align="center"><img src="image/name.gif"/>用户:</td>
   <td><input type="text" name="login_id" height="25" /></td>
  </tr>
  <tr height="20px">
   <td></td>
   <td></td>
  </tr>
  <tr class="datagrid1212">
   <td align="center"><img src="image/mm.gif"/>密码:</td>
   <td><input type="password" name="password" height="25" /></td>
  </tr>
  <tr>
   <td colspan="2" align="center">
   	<input type="submit" value="登录"/>&nbsp;&nbsp;
   	<a href="register.jsp" target="_top">注册</a>&nbsp;&nbsp;
   	<a href="admin/login.jsp" target="_top">管理员登录</a>   
   </td>
   <td></td>
  </tr>
</table>
</form>
</div>

<div id="friendlink">
    <p>友情链接</p>
     <ul>
     	<li><a href="http://www.nuaa.edu.cn" target="_blank">南京航空航天大学</a></li>
     	<li><a href="https://github.com/CCCCly" target="_blank">Liyichen_github</a></li>
     </ul>
</div>

<div id="footer">
   <p align="center">&nbsp;</p>
		<a>联系作者    chenliyi@nuaa.edu.cn</a>
   <p align="center">Copyright @ Liyi Chen</p>
</div>
</div>   
</body>
</html>
