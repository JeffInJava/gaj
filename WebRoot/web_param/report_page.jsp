<%@ page contentType="text/html;charset=gbk" language="java" errorPage="" %>
<%@ taglib uri="/WEB-INF/runqianReport.tld" prefix="report" %>
<%@ page import="java.util.*"%>
<jsp:useBean id="dateDemo" scope="page" class="com.bo.util.DateDemo"/>
<html>
<%
	request.setCharacterEncoding("gbk");
	request.setAttribute("report_name_cn",(String)request.getParameter("report_name_cn"));
%>
<title>
<%=(String)request.getAttribute("report_name_cn")%>
</title>
<body oncontextmenu="return true">

<%
	
	Enumeration  names=request.getParameterNames();
		String params="";
		String report_name="";
		String param_type="";
		for (;names.hasMoreElements();){
			String parametername=(String)names.nextElement();
			if(parametername.equals("report_name")){
				report_name=(String)request.getParameter(parametername);
			}else if(parametername.equals("param_type")){
				param_type=(String)request.getParameter(parametername);
			}else{
				params=params+parametername+"="+(String)request.getParameter(parametername)+";";
			}
		}

	if (report_name.equals("time_flux")){
	String line_id=(String)request.getParameter("line_id");
	String station_id=(String)request.getParameter("station_id");
	String start_date=(String)request.getParameter("start_date");
	String end_date=(String)request.getParameter("end_date");
	String sqlpre="select stmt_day,line_id,station_id,start_time,end_time,enter_times,exit_times,change_times from tbl_metro_flux_total_";
	String sql=dateDemo.getSQL(sqlpre,start_date,end_date,line_id,station_id);
	params=params+"macal="+sql;
	}else if(report_name.equals("METRO_FLUX_TOTAL")){
		String line_id=(String)request.getParameter("line_id");
		String start_date=(String)request.getParameter("start_date");
		System.out.println(start_date);
		String end_date=(String)request.getParameter("end_date");
		System.out.println(end_date);
		String sqlpre="select stmt_day,line_id,station_id,sum(enter_times) enter_times,sum(exit_times) exit_times ,sum(change_times) change_times from tbl_metro_flux_total_";
		String sql=dateDemo.getSQL_group_by(sqlpre,start_date,end_date,line_id);
		params=params+"macal="+sql;
	}
%>
<jsp:include page="<%=(String)request.getParameter("param_type")+".jsp"%>" flush="true" />
<report:html name="report_page" reportFileName="<%=(String)request.getParameter("report_name")+".raq"%>"
	funcBarLocation="boTh"
	needPageMark="yes" 
	functionBarColor="#fff5ee"
	funcBarFontSize="9pt"
	funcBarFontColor="blue"
	separator="&nbsp;&nbsp;"
	needSaveAsExcel="yes"
	needSaveAsPdf="yes"
	needPrint="yes"
	pageMarkLabel="“≥∫≈{currpage}/{totalPage}"
	printLabel="¥Ú”°"
	displayNoLinkPageMark="yes"
	params="<%=params%>"
	saveAsName="<%=(String)request.getParameter("report_name")%>"
/>
</body>
</html>


