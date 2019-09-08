<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*" errorPage=""%> 
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="cly.Register.RegisterAction" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>用户注册</title>
	<link rel="stylesheet" type="text/css" href="css/toolbar.css">
</head>

<script type="text/javascript">
function isRight(f)
{
  if(f.id.value == "")
  {
     alert("注册ID不能为空!");
	 return false;
   }
   else if(f.id.value.length>8)
   {
     alert("注册ID长度不能大于8!");
	 return false;
   }
   else if(f.password.value.length>20)
   {
      alert("密码长度必须是20以内的数字或字母!");
	  return false;
   }
  else if(f.password.value != f.repassword.value)
  {
      alert("两次输入的密码不同!");
	  return false;
  }	
  else
  { 
     return true;
  } 
}
</script>

<body>
	<form action="Register" method="post" onSubmit="return isRight(this);" enctype="multipart/form-data">
		 <table align="center" width="700px" class="datagridstyle" id="DataGrid1" cellSpacing=0 cellPadding=3 border=0>
	        <tr class="datagridhead">
				<td colspan="2" align="center"><B>填写个人信息:（带'*'的内容必填）</B></td>
				<td></td>
			</tr>
	        <tr >
	  			<td>ID:</td>
	  			<td><input type="text" name="id"/>(8位以内纯数字)&nbsp;*</td>
	 		</tr>
	 		<tr >
	  			<td>昵称:</td>
	  			<td><input type="text" name="name"/>&nbsp;*</td>
	 		</tr>
	 		<tr class="datagrid1212">
	 			<td>密 码:</td>
	 			<td><input type="password" name="password"/>&nbsp;*</td>
			</tr>
			<tr >
				<td>确认密码:</td>
				<td><input type="password" name="repassword"/>&nbsp;*</td>
	 	 	</tr> 
	   		<tr class="datagrid1212"> 
	  			<td>性别:</td>
	  			<td>
	   				<input type=radio  value="男" name="sex" checked>男 &nbsp;&nbsp;&nbsp;&nbsp; 
	   				<input type=radio value="女" name="sex">女
	  			</td>
			</tr>
			<tr >
				<td>生日:</td>
				<td><input type="text" name="birthday"/>&nbsp;*</td>
	 	 	</tr> 
			<tr class="datagrid1212">
				<td>年龄:</td>    
				<td><input type="text" name="age" height="20"/>&nbsp;*</td>
			</tr> 
			<tr >
				<td>邮箱:</td>
				<td><input type="text" name="email"/>&nbsp;*</td>
	 	 	</tr> 
			<tr class="datagrid1212">
	 			<td colspan="2" align="center">
	  				<input type="submit" value="注册"/>&nbsp;&nbsp;&nbsp;
	  				<input type="reset" value="重置"/>&nbsp;&nbsp;&nbsp;
	  				<input type="button" value="返回" onClick="history.go(-1)"/>
	 			</td>
			</tr>
		</table>
	</form>
<div id="lastfoot">
     <jsp:include flush="false" page="footer.jsp"></jsp:include>
</div>
</body>
</html>
