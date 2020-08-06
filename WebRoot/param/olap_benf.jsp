<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="errorpage.jsp" %>
<%@page import="com.bo.jsp.ReadLine"%>
<jsp:useBean id="connora" scope="page" class="com.bo.jdbc.connection.OraConn"/>
<jsp:useBean id="time" scope="page" class="com.bo.util.DateDemo"/>
<script>
function se()
{
	if(null!="<%=request.getParameter("owner_id")%>")
	{
		for(var n = 0; n < window.form1.owner_id.options.length; n++)
		{
			if(window.form1.owner_id.options[n].value=="<%=(String)request.getParameter("owner_id")%>")
		  {
		    window.form1.owner_id.options[n].selected = true;
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
<html>
<jsp:include page="time.txt" flush="true" />
<body onload="se();">
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
<form method=post id="form1" action="<%=request.getContextPath()%>/report_page.jsp">
<table>
<td><table border="1">
<tr>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">归属方代码:</td>
    <td><select name="owner_id"  style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 150px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">
    <option value=>所有业主</option>
<% ReadLine rl=new ReadLine();
	String benf=(String)session.getAttribute("benf");
	if(benf==null){
		rl.setReadBenf();
		session.setAttribute("benf","benf");
	}
	String[] benfarray=rl.getReadBenf();
	int benfrows=rl.getBenfRows();
    	for (int i=0;i<benfrows;i++){
%><option value=<%=benfarray[i].substring(1,5)%>><%=benfarray[i]%></option><%
	}
	
%>
    </select></td>
    <td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">上期开始日期: </td>
<td><input type=text name="start_date1" value="<%=start_date1%>" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblclick="CalendarWebControl.show(this,false,this.value);"></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">当期开始日期: </td>
<td><input type=text name="start_date2" value="<%=start_date2%>" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblclick="CalendarWebControl.show(this,false,this.value);"></td>
</tr>
<tr>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">比较类型: </td>
<td><select name="q_type" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 150px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">
		<option value=1>年度</option>
		<option value=2>季度</option>
		<option value=3>月份</option>
		<option value=4>星期</option>
		<option value=5>天</option>
		</select>
</td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">上期结束日期: </td>
<td><input type=text name="end_date1" value="<%=end_date1%>" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblclick="CalendarWebControl.show(this,false,this.value);"></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">当期结束日期: </td>
<td><input type=text name="end_date2" value="<%=end_date2%>" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblclick="CalendarWebControl.show(this,false,this.value);"></td>
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
