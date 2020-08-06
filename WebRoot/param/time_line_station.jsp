<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="errorpage.jsp" %>
<jsp:useBean id="connora" scope="page" class="com.bo.jdbc.connection.OraConn"/>
<jsp:useBean id="time" scope="page" class="com.bo.util.DateDemo"/>
<jsp:include page="check_time.html" flush="true" />
<jsp:include page="time.txt" flush="true" />
<jsp:include page="select_line_station.jsp" flush="true"/>
<html>
<script>
function se()
{
	if(null!="<%=request.getParameter("line_select")%>")
	{
		for(var n = 0; n < window.form1.line_select.options.length; n++)
		{
			if(window.form1.line_select.options[n].value=="<%=(String)request.getParameter("line_select")%>")
		  {
		    window.form1.line_select.options[n].selected = true;
		    select();
		  }
		}
	}
	
	if(null!="<%=request.getParameter("station_select")%>")
	{
		for(var n = 0; n < window.form1.station_select.options.length; n++)
		{
			if(window.form1.station_select.options[n].value=="<%=(String)request.getParameter("station_select")%>")
		  {
		    window.form1.station_select.options[n].selected = true;
		  }
		}
	}
}
</script>
<html>
<body onload="init();se();">
<%
	String start_date=(String)request.getParameter("start_date");
	String start_date_session=(String)session.getAttribute("start_date");
	if(start_date==null){
		if(start_date_session==null){
		start_date=time.getToday();
	}else{
		start_date=(String)session.getAttribute("start_date");
		}
	}
	if(!start_date.equals(start_date_session)){
	session.setAttribute("start_date",start_date);
	}
%>
<form name="form1" method="post" action="<%=request.getContextPath()%>/report_page.jsp">
<table>
<td><table border="1">
<tr>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">线路代码:</td>
<td><select name="line_select" onchange="select()" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></select></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">车站代码:</td>
<td><select name="station_select" onchange="select()" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></select></td>
</tr>
<tr>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">开始日期: </td>
<td><input type=text name="start_date" value="<%=start_date%>" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblclick="CalendarWebControl.show(this,false,this.value);"></td>
</tr>
</table>
</td>
<td><input type="button" value="查询" onclick="button_submit();" style="FONT-SIZE: 13px; WIDTH: 40px; COLOR: mediumblue; FONT-FAMILY: 宋体; HEIGHT: 22px; BACKGROUND-COLOR: wheat"></td>
</table>
<input type=hidden name="line_id">
<input type=hidden name="station_id">
<input type=hidden name=report_name value="<%=(String)request.getParameter("report_name")%>">
<input type=hidden name=param_type value="<%=(String)request.getParameter("param_type")%>">
<input type=hidden name=report_name_cn value="<%=(String)request.getAttribute("report_name_cn")%>">
</form>
</body>
</html>