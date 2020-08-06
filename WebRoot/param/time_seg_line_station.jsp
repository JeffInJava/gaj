<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="errorpage.jsp" %>
<jsp:useBean id="connora" scope="page" class="com.bo.jdbc.connection.OraConn"/>
<jsp:useBean id="time" scope="page" class="com.bo.util.DateDemo"/>
<jsp:include page="check_time.html" flush="true" />
<jsp:include page="time.txt" flush="true" />
<jsp:include page="select_line_station_d.jsp" flush="true"/>
<script language="javascript">
	
	function check_time_seg(){
		if(window.form1.time_seg.value=="1"){
			alert("ʱ��β���Ϊ-------");
			window.form1.time_seg.options[0].selected=true;
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
}

</script>
<html>
<body onload="init();se();">
<%
//����
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
	System.out.println(start_date);
	//ʱ��
	String start_time=(String)request.getParameter("start_time");
	String start_time_session=(String)session.getAttribute("start_time");
if(start_time==null){
		if(start_time_session==null){
		start_time=time.getToday()+"000000";
		}else{
		start_time=(String)session.getAttribute("start_time");
		}
	}
	if(!start_time.equals(start_time_session)){
	session.setAttribute("start_time",start_time);
	}
	System.out.println(start_time);
	
String end_time=(String)request.getParameter("end_time");
	String end_time_session=(String)session.getAttribute("end_time");
if(end_time==null){
		if(end_time_session==null){
		end_time=time.getToday()+"235959";
		}else{
		end_time=(String)session.getAttribute("end_time");
		}
	}
	if(!end_time.equals(end_time_session)){
	session.setAttribute("end_time",end_time);
	}
	System.out.println(end_time);
%>
<form name="form1" method="post" action="<%=request.getContextPath()%>/report_page.jsp">
<table>
<td><table border="1">
<tr><!--��һ��-->
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: ����; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">�����·:</td>
<td><select name="line_select_o" onchange="select_o()" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: ����; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></select></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: ����; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">������·:</td>
<td><select name="line_select_d" onchange="select_d()" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: ����; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></select></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: ����; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">��ѯʱ��: </td>
<td><input type=text name="start_date" value="<%=start_date%>" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: ����; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblclick="CalendarWebControl.show(this,false,this.value);"></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: ����; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">ʱ���: </td>
<td><select name="time_seg" onchange="check_time_seg();" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: ����; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">
    	<option value=1440>ȫ��</option>
    	<option  value=720>12 Сʱ</option>
    	<option  value=360>&nbsp6 Сʱ</option>
    	<option  value=180>&nbsp3 Сʱ</option>
    	<option  value=120>&nbsp2 Сʱ</option>
    	<option   value=60>&nbsp1 Сʱ</option>
    	<option   value=1>-------</option>
    	<option   value=45>45 ����</option>
    	<option   value=30>30 ����</option>
    	<option   value=15>15 ����</option>
    	<option   value=10>10 ����</option>
    	<option    value=5>&nbsp5 ����</option>	
</td>
</tr>
<tr><!--�ڶ���-->
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: ����; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">��ڳ�վ:</td>
<td><select name="station_select_o" onchange="select_o()"
	 style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: ����; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></select></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: ����; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">���ڳ�վ:</td>
<td><select name="station_select_d" onchange="select_d()" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: ����; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></select></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: ����; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">ʱ���:�� </td>
<td><input type=text name="start_time" value="<%=start_time%>" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: ����; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblclick="CalendarWebControl.show(this,false,this.value);"></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: ����; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">���� </td>
<td><input type=text name="end_time" value="<%=end_time%>"  style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: ����; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblclick="CalendarWebControl.show(this,false,this.value);"></td>

</tr>
</table>
</td>
<!-- onclick="button_submit();" -->
<td><input type=button value="��ѯ" onclick="button_submit();" style="FONT-SIZE: 13px; WIDTH: 40px; COLOR: mediumblue; FONT-FAMILY: ����; HEIGHT: 22px; BACKGROUND-COLOR: wheat"></td>
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