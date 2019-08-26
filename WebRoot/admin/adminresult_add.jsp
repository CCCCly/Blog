<%@ page contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
  String adminid = (String)session.getAttribute("currentLoginAdminId");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>增加测试结果</title>
<link rel="stylesheet" type="text/css" href="../css/toolbar.css">
</head>
<script type="text/javascript">
function isRight(f)
{
  if(f.result_content.value == "")
  {
     alert("结果不能为空!");
	 return false;
   }
   else if(f.result_content.value.length>449)
   {
     alert("结果长度不能大于300!");
	 return false;
   }
   else if(f.start.value == ""||f.end.value == "")
   {
      alert("评分范围不能为空!");
	  return false;
   }	
   else
   { 
     return true;
   } 
}
</script>

<body>
<%
	if(adminid!=null)
	{
%>
<form method="post" action="AdminAddResult" onSubmit="return isRight(this);">
	 <table align="center" width="700px" class="datagridstyle" id="DataGrid1" cellSpacing=0 cellPadding=3 border=0>
        <tr class="datagridhead">
			<td colspan="2" align="center"><B>结果细节:(带'*'的内容必填)</B></td>
			<td></td>
		</tr>
        <tr class="datagrid1212">
  			<td align="center">结果内容:<textarea name="result_content" cols="40" rows="11"></textarea>&nbsp;*</td>
  			<td></td>
 		</tr>
 		<tr class="datagrid1212">
 			<td align="center">评分范围:
 			<input type="text" size="3" name="start"/>&nbsp;-
			<input type="text" size="3" name="end"/>&nbsp;*
 			</td>
 			<td></td>
		</tr>
		<tr class="datagrid1212">
 			<td colspan="2" align="center">
  				<input type="submit" value="增加"/>&nbsp;&nbsp;
  				<input type="reset" value="重置"/>&nbsp;&nbsp;
  				<input type="button" value="返回" onClick="history.go(-1)"/>
 			</td>
 			<td></td>
		</tr>
	</table>
<%
	}
%>
</form>
</body>
</html>
