<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="errorpage.jsp" %>
<%@ taglib uri="/WEB-INF/runqianReport.tld" prefix="report" %>
<%@ page import="com.runqian.report.usermodel.*" %>
<%@ page import="com.runqian.report.graph.*" %>
<%@ page import="com.runqian.base.graph.*" %>
<%@ page import="java.util.*" %>
<%@page import="com.bo.jsp.ReadLine"%>
<jsp:useBean id="time" scope="page" class="com.bo.util.DateDemo"/>
<script>
function se()
{
	if((<%=session.getAttribute("line_id")%>=="88888")&&(null!="<%=request.getParameter("line_id")%>"))
	{
		for(var n = 0; n < window.form1.line_id.options.length; n++)
		{
			if(window.form1.line_id.options[n].value=="<%=(String)request.getParameter("line_id")%>")
		  {
		    window.form1.line_id.options[n].selected = true;
		  }
		}
	}
}
</script>
<html>
<jsp:include page="time.txt" flush="true" />
<body onload="se();" oncontextmenu="return false">
<%
String start_date=(String)request.getParameter("start_date");
	if(start_date==null){
		start_date=time.getToday();
	}
	String end_date=(String)request.getParameter("end_date");
	if(end_date==null){
		end_date="";
	}
%>
<form method=post id="form1" action="graphType.jsp">
<table width="560">
<td width="342"><table border="1">
<tr>
<%

    	String line_id=(String)session.getAttribute("line_id");
    	if (line_id.equals("88888")){
%>
	<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">线路:</td>
    <td><select name="line_id" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">
    	<option value=>全线</option>
<% ReadLine rl=new ReadLine();
	String line=(String)session.getAttribute("line");
	if(line==null){
		rl.setReadLine();
		session.setAttribute("line","line");
	}
	String[] linearray=rl.getReadLine();
	int linerows=rl.getLineRows();
    	for (int i=0;i<linerows;i++){
%><option value=<%=linearray[i].substring(1,3)%>><%=linearray[i]%></option><%
	}
}
%>

    </select></td>
</tr>
<tr>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">开始日期: </td>
<td><input type=text name="start_date" value="<%=start_date%>" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblclick="CalendarWebControl.show(this,false,this.value);"></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">结束日期: </td>
<td><input type=text name="end_date" value="<%=end_date%>" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblclick="CalendarWebControl.show(this,false,this.value);"></td>
</tr>

</table>
</td>
  <td>
    <input type=button value="折线图" onClick="form1.type.value='1';form1.submit()";style="FONT-SIZE: 13px; WIDTH: 30px; COLOR: mediumblue; FONT-FAMILY: 宋体; HEIGHT: 22px; BACKGROUND-COLOR: wheat">
  <br>
    <input type=button value="柱状图" onclick="form1.type.value='2';form1.submit()";style="FONT-SIZE: 13px; WIDTH: 30px; COLOR: mediumblue; FONT-FAMILY: 宋体; HEIGHT: 22px; BACKGROUND-COLOR: wheat">
</td>
  <td >
    <input type=button value="直方图" onclick="form1.type.value='3';form1.submit()";style="FONT-SIZE: 13px; WIDTH: 40px; COLOR: mediumblue; FONT-FAMILY: 宋体; HEIGHT: 22px; BACKGROUND-COLOR: wheat">
    <br>
	<input type=button value="条状图" onclick="form1.type.value='5';form1.submit()";style="FONT-SIZE: 13px; WIDTH: 40px; COLOR: mediumblue; FONT-FAMILY: 宋体; HEIGHT: 22px; BACKGROUND-COLOR: wheat">
</td>
  <td >
    <input type=button onClick="form1.type.value='4';form1.submit()" value="立体折线图";style="FONT-SIZE: 13px; WIDTH: 100px; COLOR: mediumblue; FONT-FAMILY: 宋体; HEIGHT: 22px; BACKGROUND-COLOR: wheat">
	<br>
    <input type=button onclick="form1.type.value='6';form1.submit()" value="立体条状图";style="FONT-SIZE: 13px; WIDTH: 100px; COLOR: mediumblue; FONT-FAMILY: 宋体; HEIGHT: 22px; BACKGROUND-COLOR: wheat">
</td>
</table>
<%
	if (!line_id.equals("88888")){
%>
<input type=hidden name=line_id value="<%=line_id%>">
<%}%>
<input type=hidden name="type" value="1">
<input type=hidden name=report_name value="<%=(String)request.getParameter("report_name")%>">
<input type=hidden name=param_type value="<%=(String)request.getParameter("param_type")%>">
<input type=hidden name=report_name_cn value="<%=(String)request.getAttribute("report_name_cn")%>">
<input type=hidden name=count value="<%=(String)request.getParameter("count")%>">
<input type=hidden name=first value="<%=(String)request.getParameter("first")%>">
</form>

</body>
</html>
