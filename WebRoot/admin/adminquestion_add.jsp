<%@ page contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
  String adminid = (String)session.getAttribute("currentLoginAdminId");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>增加题目</title>
	<link rel="stylesheet" type="text/css" href="../css/design.css">
</head>
<script language="JavaScript">
function isRight(f)
{
  if(f.question_content.value == "")
  {
     alert("题目不能为空!");
	 return false;
   }
   else if(f.question_content.value.length>300)
   {
     alert("题目长度不能大于300!");
	 return false;
   }
  else if(f.answercontent_1.value == ""||f.score_1.value == "")
  {
      alert("选项A不能为空!");
	  return false;
  }	
 else if(f.answercontent_2.value == ""||f.score_2.value == "")
  {
      alert("选项B不能为空!");
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
<form method="post" action="AdminAddQuestion" onSubmit="return isRight(this);">
	 <table align="center" width="700px" class="datagridstyle" id="DataGrid1" cellSpacing=0 cellPadding=3 border=0>
        <tr class="datagridhead">
			<td colspan="2" align="center"><B>测试题信息:（带'*'的内容必填）</B></td>
			<td></td><td></td>
		</tr>
        <tr >
  			<td>题目:</td>
  			<td align="center"><textarea name="question_content" cols="30" rows="9"></textarea>&nbsp;*</td>
  			<td></td>
 		</tr>
 		<tr class="datagrid1212">
 			<td>答 案:</td><td align="center">内容</td><td>分值</td>
		</tr>
		<tr class="datagrid1212">
			<td>选项A:</td>
			<td align="center"><input type="text" name="answercontent_1"/></td>
			<td><input type="text"  size="2" name="score_1"/>*</td>
 	 	</tr> 
 	 	<tr>
			<td>选项B:</td>
			<td align="center"><input type="text" name="answercontent_2"/></td>
			<td><input type="text"  size="2" name="score_2"/>*</td>
 	 	</tr>
 	 	<tr>
			<td>选项C:</td>
			<td align="center"><input type="text" name="answercontent_3"/></td>
			<td><input type="text"  size="2" name="score_3"/></td>
 	 	</tr> 
 	 	<tr>
			<td>选项D:</td>
			<td align="center"><input type="text" name="answercontent_4"/></td>
			<td><input type="text"  size="2" name="score_4"/></td>
 	 	</tr> 
 	 	<tr>
			<td>选项E:</td>
			<td align="center"><input type="text" name="answercontent_5"/></td>
			<td><input type="text"  size="2" name="score_5"/></td>
 	 	</tr> 
 	 	<tr>
			<td>选项F:</td>
			<td align="center"><input type="text" name="answercontent_6"/></td>
			<td><input type="text"  size="2" name="score_6"/></td>
 	 	</tr>
		<tr class="datagrid1212">
 			<td colspan="2" align="center">
  				<input type="submit" value="增加"/>&nbsp;&nbsp;&nbsp;
  				<input type="reset" value="重置"/>&nbsp;&nbsp;&nbsp;
  				<input type="button" value="返回" onClick="history.go(-1)"/>
 			</td>
 			<td></td><td></td>
		</tr>
	</table>
<%
	}
%>
</form>
</body>
</html>
