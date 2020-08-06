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
		if(enter_sta_v == '' || exit_sta_v == ''){
			alert("入口站 和 出口站 不能为空！");
		}else{
			button_submit();
		}
	}
	
function se()
{
	if(null!="<%=request.getParameter("line_select_o")%>")
	{
		for(var n = 0; n < window.form1.line_select_o.options.length; n++)
		{
			if(window.form1.line_select_o.options[n].value=="<%=(String)request.getParameter("line_select_o")%>")
		  {
		    window.form1.line_select_o.options[n].selected = true;
		    select_o();
		  }
		}
	}
	
	if(null!="<%=request.getParameter("station_select_o")%>")
	{
		for(var n = 0; n < window.form1.station_select_o.options.length; n++)
		{
			if(window.form1.station_select_o.options[n].value=="<%=(String)request.getParameter("station_select_o")%>")
		  {
		    window.form1.station_select_o.options[n].selected = true;
		    select_o();
		  }
		}
	}
	
	if(null!="<%=request.getParameter("line_select_d")%>")
	{
		for(var n = 0; n < window.form1.line_select_d.options.length; n++)
		{
			if(window.form1.line_select_d.options[n].value=="<%=(String)request.getParameter("line_select_d")%>")
		  {
		    window.form1.line_select_d.options[n].selected = true;
		    select_d();
		  }
		}
	}
	
	if(null!="<%=request.getParameter("station_select_d")%>")
	{
		for(var n = 0; n < window.form1.station_select_d.options.length; n++)
		{
			if(window.form1.station_select_d.options[n].value=="<%=(String)request.getParameter("station_select_d")%>")
		  {
		    window.form1.station_select_d.options[n].selected = true;
		    select_d();
		  }
		}
	}
	
	if(null!="<%=request.getParameter("q_type")%>")
	{
		for(var n = 0; n < window.form1.q_type.options.length; n++)
		{
			if(window.form1.q_type.options[n].value=="<%=(String)request.getParameter("q_type")%>")
		  {
		    window.form1.q_type.options[n].selected = true;
		  }
		}
	}
}

</script>
<%
//前期
String start_date1=(String)request.getParameter("start_date1");
String start_date_session1=(String)session.getAttribute("start_date1");
	if(start_date1==null){
		if(start_date_session1==null){
		start_date1=time.getToday();
	}else{
		start_date1=(String)session.getAttribute("start_date1");
		}
	}
	if(!start_date1.equals(start_date_session1)){
	session.setAttribute("start_date1",start_date1);
	}
String end_date1=(String)request.getParameter("end_date1");
String end_date_session1=(String)session.getAttribute("end_date1");
	if(end_date1==null){
		if(end_date_session1==null){
		end_date1=time.getToday();
	}else{
		end_date1=(String)session.getAttribute("end_date1");
		}
	}
	if(!end_date1.equals(end_date_session1)){
	session.setAttribute("end_date1",end_date1);
	}
	
	//当期：
	String start_date2=(String)request.getParameter("start_date2");
String start_date_session2=(String)session.getAttribute("start_date2");
	if(start_date2==null){
		if(start_date_session2==null){
		start_date2=time.getToday();
	}else{
		start_date2=(String)session.getAttribute("start_date2");
		}
	}
	if(!start_date2.equals(start_date_session2)){
	session.setAttribute("start_date2",start_date2);
	}
String end_date2=(String)request.getParameter("end_date2");
String end_date_session2=(String)session.getAttribute("end_date2");
	if(end_date2==null){
		if(end_date_session2==null){
		end_date2=time.getToday();
	}else{
		end_date2=(String)session.getAttribute("end_date2");
		}
	}
	if(!end_date2.equals(end_date_session2)){
	session.setAttribute("end_date2",end_date2);
	}
	
%>
<html>
<body onload="init();se();">
<form name="form1" method="post" action="<%=request.getContextPath()%>/report_page.jsp">
<table>
<td><table border="1">
<tr><!--第一行-->
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">比较类型: </td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">入口线路:</td>
<td><select name="line_select_o" onchange="select_o()" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 130px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></select></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">出口线路:</td>
<td><select name="line_select_d" onchange="select_d()" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 130px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></select></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">上期开始日期: </td>
<td><input type=text name="start_date1" value="<%=start_date1%>" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 60px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblclick="CalendarWebControl.show(this,false,this.value);"></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">当期开始日期: </td>
<td><input type=text name="start_date2" value="<%=start_date2%>" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 60px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblclick="CalendarWebControl.show(this,false,this.value);"></td>
</tr>
<tr><!--第二行-->
<td><select name="q_type" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 50px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">
		<option value=1>年度</option>
		<option value=2>季度</option>
		<option value=3>月份</option>
		<option value=4>星期</option>
		<option value=5>天</option>
		</select>
</td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">入口车站:</td>
<td><select name="station_select_o" onchange="select_o()"
	 style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 130px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></select></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">出口车站:</td>
<td><select name="station_select_d" onchange="select_d()" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 130px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></select></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">上期结束日期: </td>
<td><input type=text name="end_date1" value="<%=end_date1%>" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 60px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblclick="CalendarWebControl.show(this,false,this.value);"></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">当期结束日期: </td>
<td><input type=text name="end_date2" value="<%=end_date2%>" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 60px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblclick="CalendarWebControl.show(this,false,this.value);"></td>
</tr>
</table>
</td>
<td><input type=submit value="查询"  style="FONT-SIZE: 13px; WIDTH: 40px; COLOR: mediumblue; FONT-FAMILY: 宋体; HEIGHT: 22px; BACKGROUND-COLOR: wheat"></td>
</table>
<input type=hidden name="enter_line_id">
<input type=hidden name="exit_line_id">
<input type=hidden name="enter_station_id">
<input type=hidden name="exit_station_id">
<input type=hidden name=report_name value="<%=(String)request.getParameter("report_name")%>">
<input type=hidden name=param_type value="<%=(String)request.getParameter("param_type")%>">
<input type=hidden name=report_name_cn value="<%=(String)request.getAttribute("report_name_cn")%>">
</form>
</body>
</html>