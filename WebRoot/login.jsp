<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page pageEncoding="GBK"%>
<HTML><HEAD>
<script>
function check(){
var user_id=window.form1.user_id.value;
var user_pwd=window.form1.user_pwd.value;
if("guoanju"==user_id&&"guoanju123"==user_pwd)
{
window.location.href="tree.jsp";
}
else
{
window.open ("errorpage.jsp","","height=100,width=400,top=400,left=500") ;
}
}
</script>
<STYLE type=text/css>.style24 {
	COLOR: #f3f7f3
}
</STYLE>
<META http-equiv=Content-Type content="text/html; charset=GB2312">
<META content="MSHTML 6.00.2800.1515" name=GENERATOR>
</HEAD>
<BODY oncontextmenu="return false">
<form id="form1" method=post action="">
<table width="287" height="58" align="center">
	<tr>
		<td>
			用户名：
		</td>
		<td>
			<input id="user_id" name="user_id" type="text" />
		</td>
	</tr>
	<tr>
		<td>
			密码：
		</td>
		<td>
			<input id="user_pwd" name="user_pwd" type="password" />
		</td>
	</tr>
	<tr>
		<td>
			<input type="button" name="commit" value="登录" onClick="check();"/>
		</td>
		<td>
			<input type="Reset" name="cannel" value="重填"/>
		</td>
	</tr>
</table>
</form>
</BODY>
</HTML>
