<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="errorpage.jsp" %>
<%@page import="com.bo.jsp.ReadLine"%>
<jsp:useBean id="connora" scope="page" class="com.bo.jdbc.connection.OraConn"/>
<jsp:useBean id="time" scope="page" class="com.bo.util.DateDemo"/>
<script>
function se()
{
	if(null!="<%=request.getParameter("line_id")%>")
	{
		for(var n = 0; n < window.form1.line_id.options.length; n++)
		{
			if(window.form1.line_id.options[n].value=="<%=(String)request.getParameter("line_id")%>")
		  {
		    window.form1.line_id.options[n].selected = true;
		  }
		}
	}
	
	if(null!="<%=request.getParameter("day")%>")
	{
		for(var n = 0; n < window.form1.day.options.length; n++)
		{
			if(window.form1.day.options[n].value=="<%=(String)request.getParameter("day")%>")
		  {
		    window.form1.day.options[n].selected = true;
		  }
		}
	}
	if(null!="<%=request.getParameter("holiday")%>")
	{
		for(var n = 0; n < window.form1.holiday.options.length; n++)
		{
			if(window.form1.holiday.options[n].value=="<%=(String)request.getParameter("holiday")%>")
		  {
		    window.form1.holiday.options[n].selected = true;
		  }
		}
	}
	
	if(null!="<%=request.getParameter("start_time")%>")
	{
		for(var n = 0; n < window.form1.start_time.options.length; n++)
		{
			if(window.form1.start_time.options[n].value=="<%=(String)request.getParameter("start_time")%>")
		  {
		    window.form1.start_time.options[n].selected = true;
		  }
		}
	}
	
	if(null!="<%=request.getParameter("end_time")%>")
	{
		for(var n = 0; n < window.form1.end_time.options.length; n++)
		{
			if(window.form1.end_time.options[n].value=="<%=(String)request.getParameter("end_time")%>")
		  {
		    window.form1.end_time.options[n].selected = true;
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
//前期
String start_date=(String)request.getParameter("start_date");
String start_date_session1=(String)session.getAttribute("start_date");
	if(start_date==null){
		if(start_date_session1==null){
		start_date=time.getToday();
	}else{
		start_date=(String)session.getAttribute("start_date");
		}
	}
	if(!start_date.equals(start_date_session1)){
	session.setAttribute("start_date",start_date);
	}
String end_date=(String)request.getParameter("end_date");
String end_date_session1=(String)session.getAttribute("end_date");
	if(end_date==null){
		if(end_date_session1==null){
		end_date=time.getToday();
	}else{
		end_date=(String)session.getAttribute("end_date");
		}
	}
	if(!end_date.equals(end_date_session1)){
	session.setAttribute("end_date",end_date);
	}	
%>
<form method=post id="form1" action="<%=request.getContextPath()%>/report_page.jsp">
<table>
<td><table border="1">
<tr>

<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">开始日期: </td>
<td><input type=text name="start_date" value="<%=start_date%>" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblclick="CalendarWebControl.show(this,false,this.value);"></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">日期类型:</td>
<td><select name="day" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">
  <option value=1>双休日</option>
  <option value=0>工作日</option>
  <option value=8>全部</option>
</select></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">开始时间: </td>
<td><select name="start_time" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 60px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblClick=";">
	<option value=>全天</option>
	<%for(int i=0;i<24;i++){%>
	<option value=<%=i%>><%=i%></option>
	<%}%>
	</select></td>
<td><select name="up_down" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">
<option value=0>上行</option>
<option value=1>下行</option>
</select></td>
</tr>
<tr>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">结束日期: </td>
<td><input type=text name="end_date" value="<%=end_date%>" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblclick="CalendarWebControl.show(this,false,this.value);"></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">节假日:</td>
<td><select name="holiday" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">
  <option value=>无限制</option>
  <option value=5>五一</option>
</select></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">结束时间: </td>
<td><select name="end_time"  style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 60px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblclick=";">
  <option value=>全天</option>
  <%for(int i=0;i<24;i++){%>
  <option value=<%=i%>><%=i%></option>
  <%}%>
</select></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">线路代码:</td>
	<td><select name="line_id" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">
			<option value="01">轨道交通一号线</option>
			<option value="02">轨道交通二号线</option>
			<option value="03">轨道交通三号线</option>
			<option value="04">轨道交通四号线</option>
			<option value="05">轨道交通五号线</option>
			</select>
</td>
</tr>
</table>
</td>
<td><input type=submit value=查询 style="FONT-SIZE: 13px; WIDTH: 40px; COLOR: mediumblue; FONT-FAMILY: 宋体; HEIGHT: 22px; BACKGROUND-COLOR: wheat"></td>
</table>
<input type=hidden name=report_name value="<%=(String)request.getParameter("report_name")%>">
<input type=hidden name=param_type value="<%=(String)request.getParameter("param_type")%>">
<input type=hidden name=report_name_cn value="<%=(String)request.getAttribute("report_name_cn")%>">
</form>

</body>
</html>
