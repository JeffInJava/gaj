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
      <%-- <P>　　　　　<IMG height=7 src="img/top_nav_bar.gif" width=12>	<A href="javascript:toPage('equip_change.jsp');"><%=i++%>--车站设备编号与系统内设备号转换报表</A></P></TD></TR> --%>
      <P>　　　　　<IMG height=7 src="img/top_nav_bar.gif" width=12>	<A href="javascript:toPage('para.jsp?report_name=equip_change&amp;param_type=station_sys_equip_change&amp;report_name_cn=车站设备编号与系统内设备号转换报表');"><%=i++%>--车站设备编号与系统内设备号转换报表</A></P></TD></TR>

  <TR>
    <TD bgColor=#ffffff height=5>
      <P>　　　　　<IMG height=7 src="img/top_nav_bar.gif" width=12>	<A href="javascript:toPage('equip_user_situation.jsp');"><%=i++%>--闸机中票卡使用情况明细报表</A></P></TD></TR>


  <TR>
    <TD bgColor=#ffffff height=5>
      <P>　　　　　<IMG height=7 src="img/top_nav_bar.gif" width=12>	<A href="javascript:toPage('para.jsp?report_name=query_ticket&amp;param_type=time_time_ty_card&amp;report_name_cn=票卡查询');"><%=i++%>--票卡查询</A></P></TD></TR>

  <TR>
    <TD bgColor=#ffffff height=5>
      <P>　　　　　<IMG height=7 src="img/top_nav_bar.gif" width=12>	<A href="javascript:toPage('para.jsp?report_name=equip_change_afcc&amp;param_type=equip_id&amp;report_name_cn=系统内设备号与车站设备编号转换报表');"><%=i++%>--系统内设备号与车站设备编号转换报表</A></P></TD></TR>

  <TR>
    <TD bgColor=#ffffff height=5>
      <P>　　　　　<IMG height=7 src="img/top_nav_bar.gif" width=12>	<A href="javascript:toPage('query_cardid.jsp');"><%=i++%>--进出站记录模糊查询表</A></P></TD></TR>

<TR>
    <TD bgColor=#ffffff height=5>
      <P>　　　　　<IMG height=7 src="img/top_nav_bar.gif" width=12>	<A href="javascript:toPage('equip_user_situation1.jsp');"><%=i++%>--闸机中工作证使用情况明细报表</A></P></TD></TR>

<TR>
    
    <TD bgColor=#ffffff height=5>
      
      <P>　　　　　<IMG height=7 src="img/top_nav_bar.gif" width=12>	<A href="javascript:toPage('station_user_situation.jsp');"><%=i++%>--车站进出站明细表</A></P></TD></TR>

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