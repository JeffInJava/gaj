<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="errorpage.jsp" %>
<jsp:useBean id="time" scope="page" class="com.bo.util.DateDemo"/>
<jsp:include page="check_time.html" flush="true" />
<script>
function se(){
		if("null"!="<%=request.getParameter("main_ver")%>")
		{
			window.form1.main_ver.value="<%=(String)request.getParameter("main_ver")%>"
		}
}

function check_main_ver(){
			var main_ver_v=window.form1.main_ver.value;		
			if(main_ver_v!=""){
					var Datereg=/^\d{1}*$/;
				  if((!main_ver_v.match(Datereg))){
				     alert("����汾�Ÿ�ʽ���ԣ���ȷ�ĸ�ʽΪ����");
				     return false;
					}else{
						return true;
					}
			}else{
				alert("�汾�Ų���Ϊ��");
				 return false;
			}
	}
	
	
	
	function check_cardid(){
			var cardid_v=window.form1.cardid.value;		
			if(cardid_v!=""){
					var Datereg=/^\d{10,11}$/;
				  if((!cardid_v.match(Datereg))){
				     alert("����Ʊ/���Ÿ�ʽ���ԣ���ȷ�ĸ�ʽΪ10λ����");
				     return false;
					}else{
						return true;
					}
			}
			return true;
	}
	
	
	function check_submit()
	{		
		if(check_cardid()==true & check_main_ver()==true){
			window.form1.submit();
		}
	}
</script>	
	
<html>

<jsp:include page="time.txt" flush="true" />
<body onLoad="se();">
<form method=post id="form1" action="<%=request.getContextPath()%>/report_page.jsp">
<table>
<td><table border="1">
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: ����; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">���汾��: </td>
<td><input type=text name="main_ver" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: ����; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: ����; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">Ʊ/����: </td>
<td><input type=text name="cardid"  style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: ����; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: ����; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">����������: </td>
<td><select name="blackcardtype"  style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: ����; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">
	<option value="">������</option>
	<option value="0">���ܾ�(����ȼ�1)</option>
	<option value="1">���ڳ�վʱ�ܾ�(����ȼ�1)</option>
	<option value="2">�ڽ�,��վʱ�ܾ�(����ȼ�1)</option>
	<option value="3">���ܾ�(����ȼ�2)</option>
	<option value="4">���ڳ�վʱ�ܾ�(����ȼ�2)</option>
	<option value="5">�ڽ�,��վʱ�ܾ�(����ȼ�2)</option>
	</select>
</td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: ����; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">��������: </td>
<td><select name="action" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: ����; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">
			<option value="">������</option>
			<option value="0">����</option>
			<option value="1">ɾ��</option>
			<option value="2">�޸�</option>
			<option value="3">ԭ�汾��Ǩ</option>
	</select></td>


</table></td>
<td><input type=button value=��ѯ onclick="check_submit();" style="FONT-SIZE: 13px; WIDTH: 40px; COLOR: mediumblue; FONT-FAMILY: ����; HEIGHT: 22px; BACKGROUND-COLOR: wheat"></td>
</table>
<input type=hidden name=report_name value="<%=(String)request.getParameter("report_name")%>">
<input type=hidden name=param_type value="<%=(String)request.getParameter("param_type")%>">
<input type=hidden name=report_name_cn value="<%=(String)request.getAttribute("report_name_cn")%>">
</form>
</body>
</html>
