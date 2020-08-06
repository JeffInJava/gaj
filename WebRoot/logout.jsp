<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0041)<%=request.getContextPath()%>/tree.jsp -->
<%@page pageEncoding="GBK"%>
<HTML><HEAD>
<STYLE type=text/css>.style24 {
	COLOR: #f3f7f3
}
</STYLE>
<%
  if(session.getValue("user_id")!=null&&session.getValue("user_pwd")!=null)
	{
		session.setAttribute("user_id",null);
		session.setAttribute("user_pwd",null);
		response.sendRedirect("login.jsp");
	}
%>
<META http-equiv=Content-Type content="text/html; charset=GB2312">
<META content="MSHTML 6.00.2800.1515" name=GENERATOR></HEAD>
<BODY oncontextmenu="return false">
</BODY>
</HTML>
