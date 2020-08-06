<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="errorpage.jsp" %>
<html>
<jsp:include page="select_line_station.jsp" flush="true"/>
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
	
	if(null!="<%=request.getParameter("equip_type")%>")
	{
		for(var n = 0; n < window.form1.equip_type.options.length; n++)
		{
			if(window.form1.equip_type.options[n].value=="<%=(String)request.getParameter("equip_type")%>")
		  {
		    window.form1.equip_type.options[n].selected = true;
		  }
		}
	}
	
	if(null!="<%=request.getParameter("equip_id")%>" && "null"!="<%=request.getParameter("equip_id")%>")
	{
		window.form1.equip_id.value="<%=request.getParameter("equip_id")%>";
	}
}
	
function check_submit()
	{		
		
			form1.submit();
		
	}
</script>
<html>
<body onload="init();se();">
<form id="form1" name="form1" method="post" action="<%=request.getContextPath()%>/report_page.jsp">
<table>
<td><table border="1">
<tr>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">线路:</td>
<td><select name="line_select" onchange="select()" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></select></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">车站:</td>
<td><select name="station_select" onchange="select()" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></select></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">设备类型:</td>
<td>
<select name="equip_type" id="equip_type" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">
	<option value="026">进站闸机</option>
	<option value="021">出站闸机</option>
	<option value="027">双向闸机</option>
	<option value="024">人工售票机(BOM)</option>
	<option value="019">自动售票机(TVM)</option>
	<option value="025">自动充值机(CVM)</option>
</select></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">设备号: </td>
<td><input type=text name="equip_id" id="equip_id" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></td>
</tr>
</table>
</td>
<td><input type="button" value="查询" onclick="check_submit();" style="FONT-SIZE: 13px; WIDTH: 40px; COLOR: mediumblue; FONT-FAMILY: 宋体; HEIGHT: 22px; BACKGROUND-COLOR: wheat"></td>
</table>
<input type=hidden name="line_id">
<input type=hidden name="station_id">
<input type=hidden name=report_name value="<%=(String)request.getParameter("report_name")%>">
<input type=hidden name=param_type value="<%=(String)request.getParameter("param_type")%>">
<input type=hidden name=report_name_cn value="<%=(String)request.getAttribute("report_name_cn")%>">
</form>
</body>
</html>