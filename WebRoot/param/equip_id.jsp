<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="errorpage.jsp" %>
<script>

	function check_equip_id(){
			var equip_id_v=window.form1.equip_id.value;		
			if(equip_id_v!=""){
					var Datereg=/^\d{10}$/;
				  if((!equip_id_v.match(Datereg))){
				     alert("输入设备号格式不对，正确的格式为10位数字");
				     return false;
					}else{
						return true;
					}
			}else{
				alert("设备号不能为空");
				 return false;
			}
			
	}
	
	
	function check_submit()
	{		
		if(check_equip_id()==true){
			form1.submit();
		}
	}
</script>	
	
<html>
<body>

<form method=post id="form1" action="<%=request.getContextPath()%>/report_page.jsp">
<table>
<td><table border="1">
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">清分设备号: </td>
<td><input type=text name="equip_id"  style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></td>

</table>
</td>
<td><input type=button value=转换 onclick="check_submit();" style="FONT-SIZE: 13px; WIDTH: 40px; COLOR: mediumblue; FONT-FAMILY: 宋体; HEIGHT: 22px; BACKGROUND-COLOR: wheat"></td>
</table>
<input type=hidden name=report_name value="<%=(String)request.getParameter("report_name")%>">
<input type=hidden name=param_type value="<%=(String)request.getParameter("param_type")%>">
<input type=hidden name=report_name_cn value="<%=(String)request.getAttribute("report_name_cn")%>">
</form>
</body>
</html>
