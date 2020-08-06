<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="errorpage.jsp" %>
<jsp:useBean id="connora" scope="page" class="com.bo.jdbc.connection.OraConn"/>
<jsp:useBean id="time" scope="page" class="com.bo.util.DateDemo"/>
<jsp:include page="check_time.html" flush="true" />
<jsp:include page="time.txt" flush="true" />
<jsp:include page="select_line_station_d.jsp" flush="true"/>
<script language="javascript">

	function check_odis_null_too(){
		var enter_sta_v=window.form1.enter_station_id.value;
		var exit_sta_v=window.form1.exit_station_id.value;
		var line_v="<%=(String)session.getAttribute("line_id")%>"
		if(enter_sta_v == '' || exit_sta_v == ''){
			alert("入口站 和 出口站 不能为空！");
		}else if((enter_sta_v.substr(0,2) !=line_v && exit_sta_v.substr(0,2) !=line_v)&&line_v!="88888"){
		
			alert("入口站 和 出口站 不能都不是本线的站点！");
		}else{
			window.form1.action="graphType.jsp";
			button_submit();
		}
	}
	
function se()
{
	if(null!="<%=request.getParameter("line_select_o")%>")
	{
		var line_select_o_v="<%=(String)request.getParameter("line_select_o")%>";
		for(var n = 0; n < window.form1.line_select_o.options.length; n++)
		{
			if(window.form1.line_select_o.options[n].value.substr(1,2)==line_select_o_v.substr(1,2))
		  {
		    window.form1.line_select_o.options[n].selected = true;
		    select_o();
		  }
		}
	}

	if(null!="<%=request.getParameter("station_select_o")%>")
	{
		var station_select_o_v="<%=(String)request.getParameter("station_select_o")%>";
		for(var n = 0; n < window.form1.station_select_o.options.length; n++)
		{
			if(window.form1.station_select_o.options[n].value.substr(1,4)==station_select_o_v.substr(1,4))
		  {
		  	
		    window.form1.station_select_o.options[n].selected = true;
		    select_o();
		  }
		}
	}
	if(null!="<%=request.getParameter("line_select_d")%>")		  
	{
		var line_select_d_v="<%=(String)request.getParameter("line_select_d")%>";
		for(var n = 0; n < window.form1.line_select_d.options.length; n++)
		{
			if(window.form1.line_select_d.options[n].value.substr(1,2)==line_select_d_v.substr(1,2))
		  {

		    window.form1.line_select_d.options[n].selected = true;
		    select_d();
		  }
		}
	}
	if(null!="<%=request.getParameter("station_select_d")%>")
	{
		var station_select_d_v="<%=(String)request.getParameter("station_select_d")%>";
		for(var n = 0; n < window.form1.station_select_d.options.length; n++)
		{
			if(window.form1.station_select_d.options[n].value.substr(1,4)==station_select_d_v.substr(1,4))
		  {
		  
		    window.form1.station_select_d.options[n].selected = true;
		    select_d();
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
	
		String end_date=(String)request.getParameter("end_date");
	String end_date_session=(String)session.getAttribute("end_date");
	if(end_date==null){
		if(end_date_session==null){
		end_date=time.getToday();
	}else{
		end_date=(String)session.getAttribute("end_date");
		}
	}
if(!end_date.equals(end_date_session)){
	session.setAttribute("end_date",end_date);
	}
%>
<form name="form1" method="post">
<table>
<td><table border="1">
<tr><!--第一行-->
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">入口线路:</td>
<td><select name="line_select_o" onchange="select_o()" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 130px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></select></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">出口线路:</td>
<td><select name="line_select_d" onchange="select_d()" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 130px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></select></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">开始日期: </td>
<td><input type=text name="start_date" value="<%=start_date%>" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 80px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblclick="CalendarWebControl.show(this,false,this.value);"></td>
</tr>
<tr><!--第二行-->
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">入口车站:</td>
<td><select name="station_select_o" onchange="select_o()"
	 style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 130px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></select></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">出口车站:</td>
<td><select name="station_select_d" onchange="select_d()" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 130px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></select></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">结束日期: </td>
<td><input type=text name="end_date" value="<%=end_date%>" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 80px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblclick="CalendarWebControl.show(this,false,this.value);"></td>
</tr>
<tr>
<td><input type=button value="折线" onClick="form1.type.value='1';check_odis_null_too();";style="FONT-SIZE: 12px; WIDTH: 50px; COLOR: mediumblue; FONT-FAMILY: 宋体; HEIGHT: 22px; BACKGROUND-COLOR: wheat"></td>
<td><input type=button value="柱状" onclick="form1.type.value='2';check_odis_null_too();";style="FONT-SIZE: 12px; WIDTH: 50px; COLOR: mediumblue; FONT-FAMILY: 宋体; HEIGHT: 22px; BACKGROUND-COLOR: wheat"></td>
<td><input type=button value="直方" onclick="form1.type.value='3';check_odis_null_too();";style="FONT-SIZE: 12px; WIDTH: 50px; COLOR: mediumblue; FONT-FAMILY: 宋体; HEIGHT: 22px; BACKGROUND-COLOR: wheat"></td>
<td><input type=button value="条状" onclick="form1.type.value='5';check_odis_null_too();";style="FONT-SIZE: 12px; WIDTH: 50px; COLOR: mediumblue; FONT-FAMILY: 宋体; HEIGHT: 22px; BACKGROUND-COLOR: wheat"></td>
<td><input type=button onClick="form1.type.value='4';check_odis_null_too();" value="立体折线";style="FONT-SIZE: 12px; WIDTH: 50px; COLOR: mediumblue; FONT-FAMILY: 宋体; HEIGHT: 22px; BACKGROUND-COLOR: wheat"></td>
<td><input type=button onclick="form1.type.value='6';check_odis_null_too();" value="立体条状";style="FONT-SIZE: 12px; WIDTH: 50px; COLOR: mediumblue; FONT-FAMILY: 宋体; HEIGHT: 22px; BACKGROUND-COLOR: wheat"></td>
</tr>
</table>
</td>
<!--
<td><input type=button value="查询" onclick="check_odis_null_too();" style="FONT-SIZE: 13px; WIDTH: 40px; COLOR: mediumblue; FONT-FAMILY: 宋体; HEIGHT: 22px; BACKGROUND-COLOR: wheat">
	-->
</table>
<input type=hidden name="enter_line_id">
<input type=hidden name="exit_line_id">
<input type=hidden name="enter_station_id" value="<%=(String)request.getParameter("enter_station_id")%>">
<input type=hidden name="exit_station_id" value="<%=(String)request.getParameter("exit_station_id")%>">
<input type=hidden name=report_name value="<%=(String)request.getParameter("report_name")%>">
<input type=hidden name=param_type value="<%=(String)request.getParameter("param_type")%>">
<input type=hidden name=report_name_cn value="<%=(String)request.getAttribute("report_name_cn")%>">
<input type=hidden name="type" value="1">
<input type=hidden name=count value="<%=(String)request.getParameter("count")%>">
<input type=hidden name=first value="<%=(String)request.getParameter("first")%>">
</form>
</body>
</html>