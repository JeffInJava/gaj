<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/WEB-INF/runqianReport.tld" prefix="report" %>
<%@ page import="com.runqian.report.usermodel.*" %>
<%@ page import="com.runqian.report.graph.*" %>
<%@ page import="com.runqian.base.graph.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="dateDemo" scope="page" class="com.bo.util.DateDemo"/>
<html>
<head>
<title>图表</title>
</head>
<body oncontextmenu="return false">
<%
	Enumeration  names=request.getParameterNames();
		String params="";
		String report_name="";
		String param_type="";
		String count="";
		String first="";
		for (;names.hasMoreElements();){
			String parametername=(String)names.nextElement();
			if(parametername.equals("report_name")){
				report_name=(String)request.getParameter(parametername);
			}else if(parametername.equals("param_type")){
				param_type=(String)request.getParameter(parametername);
			}else if(parametername.equals("count")){
				count=(String)request.getParameter(parametername);
			}else if(parametername.equals("first")){
				first=(String)request.getParameter(parametername);
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
	}else if(report_name.equals("METRO_FLUX_TOTAL_today_char")){
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
		
	}
		
	String type = request.getParameter( "type" );
	type="2";
	if( type == null || type.equals( "1" ) ) type = String.valueOf(GraphInt.GT_COL3DOBJ);
	else if( type.equals( "2" ) ) type = String.valueOf( GraphInt.GT_LINE);
	else if( type.equals( "3" ) ) type = String.valueOf( GraphInt.GT_COL );
	else if( type.equals( "4" ) ) type = String.valueOf( GraphInt.GT_LINE3DOBJ);
	else if( type.equals( "5" ) ) type = String.valueOf( GraphInt.GT_BAR );
	else if( type.equals( "6" ) ) type = String.valueOf( GraphInt.GT_BAR3DOBJ);
	ReportDefine rd = Report.getReportDefine( (String)request.getParameter("report_name")+".raq", application );
	if("METRO_FLUX_TOTAL_today_char".equals(report_name)){
	first="2";
	}
	for(int i=0;i<Integer.parseInt(count);i++){
	GraphProperty gp = rd.getGraphProperty( Integer.parseInt(first)+i, 1 );
	if( gp != null ) {
		gp.setPropertyValue( GraphProperty.GRAPH_TYPE, type );
	}
	rd.setGraphProperty( Integer.parseInt(first)+i, 1, gp );
	}
	request.setAttribute( "graphType", rd );
	try{
	%>

<report:html name="report1" srcType="defineBean" beanName="graphType"
	needPageMark="no" 
	params="<%=params%>"
/>
<%}catch(Exception e)
{out.println("该日期段有误,请重新输入");}%>
</body>
</html>