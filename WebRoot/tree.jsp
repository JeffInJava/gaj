<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0041)<%=request.getContextPath()%>/tree.jsp -->
<HTML><HEAD>
<STYLE type=text/css>.style24 {
	COLOR: #f3f7f3
}
</STYLE>

<META http-equiv=Content-Type content="text/html; charset=GBK">
<META content="MSHTML 6.00.2800.1515" name=GENERATOR></HEAD>
<BODY oncontextmenu="return false">
<%int i=1;%>
<TABLE height=100 cellSpacing=0 cellPadding=0 width="97%" bgColor=#f3f7f3 
border=0>
 <TBODY>
   <TR>
    <TD bgColor=#ffffff height=5>
      <%-- <P>����������<IMG height=7 src="img/top_nav_bar.gif" width=12>	<A href="javascript:toPage('equip_change.jsp');"><%=i++%>--��վ�豸�����ϵͳ���豸��ת������</A></P></TD></TR> --%>
      <P>����������<IMG height=7 src="img/top_nav_bar.gif" width=12>	<A href="javascript:toPage('para.jsp?report_name=equip_change&amp;param_type=station_sys_equip_change&amp;report_name_cn=��վ�豸�����ϵͳ���豸��ת������');"><%=i++%>--��վ�豸�����ϵͳ���豸��ת������</A></P></TD></TR>

  <TR>
    <TD bgColor=#ffffff height=5>
      <P>����������<IMG height=7 src="img/top_nav_bar.gif" width=12>	<A href="javascript:toPage('equip_user_situation.jsp');"><%=i++%>--բ����Ʊ��ʹ�������ϸ����</A></P></TD></TR>


  <TR>
    <TD bgColor=#ffffff height=5>
      <P>����������<IMG height=7 src="img/top_nav_bar.gif" width=12>	<A href="javascript:toPage('para.jsp?report_name=query_ticket&amp;param_type=time_time_ty_card&amp;report_name_cn=Ʊ����ѯ');"><%=i++%>--Ʊ����ѯ</A></P></TD></TR>

  <TR>
    <TD bgColor=#ffffff height=5>
      <P>����������<IMG height=7 src="img/top_nav_bar.gif" width=12>	<A href="javascript:toPage('para.jsp?report_name=equip_change_afcc&amp;param_type=equip_id&amp;report_name_cn=ϵͳ���豸���복վ�豸���ת������');"><%=i++%>--ϵͳ���豸���복վ�豸���ת������</A></P></TD></TR>

  <TR>
    <TD bgColor=#ffffff height=5>
      <P>����������<IMG height=7 src="img/top_nav_bar.gif" width=12>	<A href="javascript:toPage('query_cardid.jsp');"><%=i++%>--����վ��¼ģ����ѯ��</A></P></TD></TR>

<TR>
    <TD bgColor=#ffffff height=5>
      <P>����������<IMG height=7 src="img/top_nav_bar.gif" width=12>	<A href="javascript:toPage('equip_user_situation1.jsp');"><%=i++%>--բ���й���֤ʹ�������ϸ����</A></P></TD></TR>

<TR>
    
    <TD bgColor=#ffffff height=5>
      
      <P>����������<IMG height=7 src="img/top_nav_bar.gif" width=12>	<A href="javascript:toPage('station_user_situation.jsp');"><%=i++%>--��վ����վ��ϸ��</A></P></TD></TR>

<form id="formId" action="home.jsp" method="post" target="_blank" >
			<input type="hidden" name="menuPath" id="menuPath">
		</form>
		<script type="text/javascript">
			function toPage(url){
				document.getElementById("menuPath").value=url;
				document.getElementById("formId").submit();
			}
		</script>
 </TBODY>
</TABLE>
</BODY>
</HTML>