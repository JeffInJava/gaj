<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/runqianReport4.tld" prefix="report" %>

<%@ page import="java.util.*"%>

<%
	StringBuffer param=new StringBuffer();
	Enumeration paramNames = request.getParameterNames();
	if(paramNames!=null){
		while(paramNames.hasMoreElements()){
			String paramName = (String) paramNames.nextElement();
			String paramValue=request.getParameter(paramName);
			if(paramValue!=null){
				//把参数拼成name=value;name2=value2;.....的形式
				param.append(paramName).append("=").append(paramValue).append(";");
System.out.println("paramValue="+paramValue);
			}
		}
	}
%>

<report:param	name="jxcParam"	paramFileName="time_line_station_time_line_station.raq"
/>

<report:html name="report_page" reportFileName="query_cardid.raq"
	funcBarLocation="boTh"
	needPageMark="yes" 
	functionBarColor="#fff5ee"
	funcBarFontSize="9pt"
	funcBarFontColor="blue"
	separator="&nbsp;&nbsp;"
	needSaveAsExcel="yes"
	needSaveAsPdf="yes"
	needPrint="yes"
	pageMarkLabel="页号{currpage}/{totalPage}"
	printLabel="打印"
	displayNoLinkPageMark="yes"
/>
