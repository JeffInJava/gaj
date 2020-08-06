<%@ page contentType="text/html;charset=gbk" language="java" errorPage="" %>
<html>
<%
	request.setCharacterEncoding("gbk");
	request.setAttribute("report_name_cn",new String(((String)request.getParameter("report_name_cn")).getBytes("iso-8859-1"),"gbk"));
	session.setAttribute("line_id",(String)request.getParameter("line_id"));
%>
<title><%=(String)request.getAttribute("report_name_cn")%></title>
<body oncontextmenu="return false">
<jsp:include page="<%=(String)request.getParameter("param_type")+".jsp"%>" flush="true" />
</body>
</html>