<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="errorpage.jsp" %>
<%@page import="com.bo.jsp.ReadLine"%>
<jsp:useBean id="time" scope="page" class="com.bo.util.DateDemo"/>
<jsp:useBean id="readline" scope="page" class="com.bo.jsp.ReadLine"/>
<jsp:useBean id="connora" scope="page" class="com.bo.jdbc.connection.OraConn"/>
<jsp:include page="check_time.html" flush="true" />
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
	
	if(null!="<%=request.getParameter("time_seg")%>")
	{
		for(var n = 0; n < window.form1.time_seg.options.length; n++)
		{
			if(window.form1.time_seg.options[n].value=="<%=(String)request.getParameter("time_seg")%>")
		  {
		    window.form1.time_seg.options[n].selected = true;
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
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: ����; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">��·:</td>
    <td><select name="line_id" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: ����; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">
	  <option value="01">�����ͨ1����</option>
      <option value="02">�����ͨ2����</option>
      <option value="03">�����ͨ3����</option>
      <option value="04">�����ͨ4����</option>
      <option value="05">�����ͨ5����</option>
      <option value="06">�����ͨ6����</option>
      <option value="07">�����ͨ7����</option>
      <option value="08">�����ͨ8����</option>
      <option value="09">�����ͨ9����</option>
      <option value="10">�����ͨ10����</option>
      <option value="11">�����ͨ11����</option>
    </select></td>
    <td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: ����; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">��ѯ����:</td>
<td><input type=text name="start_date" value="<%=start_date%>" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: ����; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblClick="CalendarWebControl.show(this,false,this.value);"></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: ����; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">ʱ��:</td>
<td><select name="time_seg" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 60px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: ����; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblClick=";">
	<option value="1440">ȫ��</option>
	<option value="720">12Сʱ</option>
	<option value="360">6Сʱ</option>
	<option value="180">3Сʱ</option>
	<option value="120">2Сʱ</option>
	<option value="60">1Сʱ</option>
	<option value="30">30����</option>
	<option value="15">15����</option>
	<option value="10">10����</option>
	<option value="5">5����</option>
	</select></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: ����; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">��ʼʱ��:</td>
<td><select name="start_time" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 60px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: ����; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblClick=";">
	<option value="">ȫ��</option>
	<%for(int i=0;i<24;i++){%>
	<option value=<%=i%>><%=i%></option>
	<%}%>
	</select></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: ����; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">����ʱ��:</td>
<td><select name="end_time"  style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 60px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: ����; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblClick=";">
	<option value="">ȫ��</option>
	<%for(int i=0;i<24;i++){%>
	<option value=<%=i%>><%=i%></option>
	<%}%>
	</select></td>


</tr>
</table>
</td>
<td><input type=button value=��ѯ  onclick="button_submit();" style="FONT-SIZE: 13px; WIDTH: 40px; COLOR: mediumblue; FONT-FAMILY: ����; HEIGHT: 22px; BACKGROUND-COLOR: wheat"></td>
</table>
<input type=hidden name=report_name value="<%=(String)request.getParameter("report_name")%>">
<input type=hidden name=param_type value="<%=(String)request.getParameter("param_type")%>">
<input type=hidden name=report_name_cn value="<%=(String)request.getAttribute("report_name_cn")%>">
</form>
</body>
</html>