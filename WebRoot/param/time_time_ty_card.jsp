<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="errorpage.jsp" %>
<jsp:useBean id="time" scope="page" class="com.bo.util.DateDemo"/>
<jsp:include page="check_time.html" flush="true" />
<script>
function se(){
		if(null!="<%=request.getParameter("ticket_type")%>")
			{
				for(var n = 0; n < window.form1.ticket_type.options.length; n++)
				{
					if(window.form1.ticket_type.options[n].value=="<%=(String)request.getParameter("ticket_type")%>")
				  {
					window.form1.ticket_type.options[n].selected = true;
				  }
				}
		}
}

	function check_ticket_type()
	{
			var ticket_type_v=window.form1.ticket_type.value;		
			if(ticket_type_v=='3'){
			alert("��ѡ��Ʊ�����ͣ���ѡ��");
			return false;
			}else{
				return true;
			}
	}
	
	function check_cardid(){
			var cardid_v=window.form1.cardid.value;		
			if(cardid_v!=""){
					var Datereg=/^\d{10}|\d{11}|\d{20}$/;
				  if((!cardid_v.match(Datereg))){
				     alert("����Ʊ/���Ÿ�ʽ���ԣ���ȷ�ĸ�ʽΪ10��11��20λ����");
				     return false;
					}else{
						return true;
					}
			}else{
				alert("Ʊ/���Ų���Ϊ��");
				 return false;
			}
			
	}
	
	
	function check_submit()
	{		
		if(check_cardid()==true & check_ticket_type()==true){
			button_submit();
		}
	}
</script>	
	
<html>

<jsp:include page="time.txt" flush="true" />
<body onLoad="se();">
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
	
String end_date=(String)request.getParameter("end_date");
	String end_date_session=(String)session.getAttribute("end_date");
	if(end_date==null){
		if(end_date_session==null){
		end_date="";
	}else{
		end_date=(String)session.getAttribute("end_date");
		}
	}
	if(!end_date.equals(end_date_session)){
	session.setAttribute("end_date",end_date);
	}
%>
<form method=post id="form1" action="<%=request.getContextPath()%>/report_page.jsp">
<table>
<td><table border="1">
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: ����; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">��ʼ����: </td>
<td><input type=text name="start_date" value="<%=start_date%>" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: ����; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" onclick="CalendarWebControl.show(this,false,this.value);"></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: ����; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">��������: </td>
<td><input type=text name="end_date" value="<%=end_date%>" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: ����; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" onclick="CalendarWebControl.show(this,false,this.value);"></td>
<td><select name="ticket_type" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 160px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: ����; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" onchange="check_ticket_type();">
			<option value=3>��ѡ��Ʊ�����ͣ���ѡ��</option>
			<option value=0>������</option>
			<option value=1>Ʊ����</option>
			<option value=2>�ƶ��ֻ�֧������</option>
			<option value=4>��ά��</option>
	</select></td>
<td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: ����; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">Ʊ/����: </td>
<td><input type=text name="cardid"  style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: ����; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></td>

</table>
</td>
<td><input type=button value=��ѯ onclick="check_submit();" style="FONT-SIZE: 13px; WIDTH: 40px; COLOR: mediumblue; FONT-FAMILY: ����; HEIGHT: 22px; BACKGROUND-COLOR: wheat"></td>
</table>
<input type=hidden name=report_name value="<%=(String)request.getParameter("report_name")%>">
<input type=hidden name=param_type value="<%=(String)request.getParameter("param_type")%>">
<input type=hidden name=report_name_cn value="<%=(String)request.getAttribute("report_name_cn")%>">
</form>
</body>
</html>
