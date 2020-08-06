<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<%
			String path = request.getContextPath();
			String basePathHttp = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
			String basePathHttps = request.getScheme()+"s://"+request.getServerName()+request.getContextPath()+"/";
			String basePath=basePathHttp;
		%>
		<base href="<%=basePath%>">
		<style type="text/css">
			html,body{
				margin:0;
				padding:0;
				width: 100%;
	    		height: 100%;
				font-family:"Open Sans","Helvetica Neue",Helvetica,Arial,sans-serif"; 
		 		overflow: hidden;
			}
		</style>
	</head>
	<body>
		<iframe name="_iframe" id="iframeCon" src="<%=request.getParameter("menuPath") %>" width="100%" height="100%" frameborder="0" scrolling="auto"></iframe>
	</body>
</html>
