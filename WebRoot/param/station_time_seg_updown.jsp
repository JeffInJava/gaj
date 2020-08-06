<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="errorpage.jsp" %>
<%@page import="com.bo.jsp.ReadLine"%>
<jsp:useBean id="time" scope="page" class="com.bo.util.DateDemo"/>
<jsp:useBean id="readline" scope="page" class="com.bo.jsp.ReadLine"/>
<jsp:useBean id="connora" scope="page" class="com.bo.jdbc.connection.OraConn"/>
<jsp:include page="check_time.html" flush="true" />
<script>
function se()
{
	if(null!="<%=request.getParameter("station_id")%>")
	{
		for(var n = 0; n < window.form1.station_id.options.length; n++)
		{
			if(window.form1.station_id.options[n].value=="<%=(String)request.getParameter("station_id")%>")
		  {
		    window.form1.station_id.options[n].selected = true;
		  }
		}
	}
	
	if(null!="<%=request.getParameter("time_seg_tmp")%>")
	{
		for(var n = 0; n < window.form1.time_seg_tmp.options.length; n++)
		{
			if(window.form1.time_seg_tmp.options[n].value=="<%=(String)request.getParameter("time_seg_tmp")%>")
		  {
		    window.form1.time_seg_tmp.options[n].selected = true;
		  }
		}
	}
	
		if(null!="<%=request.getParameter("start_time_tmp")%>")
	{
		for(var n = 0; n < window.form1.start_time_tmp.options.length; n++)
		{
			if(window.form1.start_time_tmp.options[n].value=="<%=(String)request.getParameter("start_time_tmp")%>")
		  {
		    window.form1.start_time_tmp.options[n].selected = true;
		  }
		}
	}
	
	if(null!="<%=request.getParameter("end_time_tmp")%>")
	{
		for(var n = 0; n < window.form1.end_time_tmp.options.length; n++)
		{
			if(window.form1.end_time_tmp.options[n].value=="<%=(String)request.getParameter("end_time_tmp")%>")
		  {
		    window.form1.end_time_tmp.options[n].selected = true;
		  }
		}
	}
	
	if(null!="<%=request.getParameter("up_down")%>")
	{
		for(var n = 0; n < window.form1.up_down.options.length; n++)
		{
			if(window.form1.up_down.options[n].value=="<%=(String)request.getParameter("up_down")%>")
		  {
		    window.form1.up_down.options[n].selected = true;
		  }
		}
	}
}
</script>
<html>
<jsp:include page="time.txt" flush="true" />
<body onload="se();">
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
<form method=post id="form1" action="<%=request.getContextPath()%>/report_page.jsp">
<table>
<td><table border="1">
<tr>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">换乘站:</td>
    <td><select name="station_id" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">  
      <option value="0844">黄兴路</option>
      <option value="0843">江浦路</option>
      <option value="0840">曲阳路</option>
      <option value="0641">巨峰路</option>
      <option value="0640">五莲路</option>
      <option value="0639">博兴路</option>
    </select></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">查询日期:</td>
<td><input type=text name="start_date" value="<%=start_date%>" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblClick="CalendarWebControl.show(this,false,this.value);"></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">时长:</td>
<td><select name="time_seg_tmp" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 60px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblClick=";">
	<option value="1440">全天</option>
	<option value="720">12小时</option>
	<option value="360">6小时</option>
	<option value="180">3小时</option>
	<option value="120">2小时</option>
	<option value="60">1小时</option>
	<option value="30">30分钟</option>
	<option value="15">15分钟</option>
	<option value="10">10分钟</option>
	<option value="5">5分钟</option>
	</select></td>
</tr>
<tr>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">开始时段:</td>
<td><select name="start_time_tmp" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 60px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblClick=";">
	<option value="">全天</option>
	<%for(int i=0;i<24;i++){%>
	<option value=<%=i%>><%=i%></option>
	<%}%>
	</select></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">结束时段:</td>
<td><select name="end_time_tmp"  style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 60px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblClick=";">
	<option value="">全天</option>
	<%for(int i=0;i<24;i++){%>
	<option value=<%=i%>><%=i%></option>
	<%}%>
	</select></td>
	<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">上下行:</td>
<td><select name="up_down" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 60px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px;WIDTH: 90px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblClick=";">
	<option value="0">上行(内圈)</option>
	<option value="1">下行(外圈)</option>
	</select></td>
</tr>
</table>
</td>
<td><input type=button value=查询  onclick="button_submit();" style="FONT-SIZE: 13px; WIDTH: 40px; COLOR: mediumblue; FONT-FAMILY: 宋体; HEIGHT: 22px; BACKGROUND-COLOR: wheat"></td>
</table>
<input type=hidden name=report_name value="<%=(String)request.getParameter("report_name")%>">
<input type=hidden name=param_type value="<%=(String)request.getParameter("param_type")%>">
<input type=hidden name=report_name_cn value="<%=(String)request.getAttribute("report_name_cn")%>">
</form>
</body>
</html>
