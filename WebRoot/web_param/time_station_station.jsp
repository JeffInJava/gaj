<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="errorpage.jsp" %>
<jsp:useBean id="connora" scope="page" class="com.bo.jdbc.connection.OraConn"/>
<html>
<jsp:include page="time.txt" flush="true" />
<body oncontextmenu="return false">
<form method=post action="<%=request.getContextPath()%>/web_param/report_page.jsp">
<table>
<td><table border="1">
<tr>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">查询日期: </td>
<td><input type=text name="time" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblclick="CalendarWebControl.show(this,false,this.value);"></td>
</tr>
<tr>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">入口站点:</td>
    <td><select name="in_out_station_id" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">
      <%
      	ResultSet rs=null;
      	String line_id=(String)session.getAttribute("line_id");
    	if (line_id.equals("88888")){
	rs=connora.executeQuery("select distinct station_id,trim(station_nm_cn) station_nm_cn from tbl_metro_station_info order by station_id");
	while(rs.next())
	{
%><option value=<%=rs.getString("station_id")%>><%="*"+ rs.getString("station_id")+"*"%><%=rs.getString("station_nm_cn")%></option><%
	}
}else{
    	rs=connora.executeQuery("select distinct station_id,trim(station_nm_cn) station_nm_cn from tbl_metro_station_info where substr(station_id,1,2)='"+(String)request.getParameter("line_id")+"' order by station_id");
	while(rs.next())
	{
%><option value=<%=rs.getString("station_id")%>><%="*"+ rs.getString("station_id")+"*"%><%=rs.getString("station_nm_cn")%></option><%
	}
}
%>
    </select></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">出口站点:</td>
    <td><select name="out_in_station_id" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">
      	<option value=>全站</option>
      <%
rs=connora.executeQuery("select distinct station_id,station_nm_cn from tbl_metro_station_info");
while(rs.next())
{
%>
      <option value=<%=rs.getString("station_id")%>><%="*"+ rs.getString("station_id")+"*"%><%=rs.getString("station_nm_cn")%></option>
      <%
}
%>
    </select></td>
</tr>
</table>
</td>
<td><input type=submit value=查询 style="FONT-SIZE: 13px; WIDTH: 40px; COLOR: mediumblue; FONT-FAMILY: 宋体; HEIGHT: 22px; BACKGROUND-COLOR: wheat"></td>
</table>
<input type=hidden name=report_name value="<%=(String)request.getParameter("report_name")%>">
<input type=hidden name=line_id value="<%=(String)request.getParameter("line_id")%>">
<input type=hidden name=param_type value="<%=(String)request.getParameter("param_type")%>">
<input type=hidden name=report_name_cn value="<%=(String)request.getAttribute("report_name_cn")%>">
</form>

</body>
</html>
