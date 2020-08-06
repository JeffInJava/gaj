<%@ page contentType="text/html;charset=GBK" language="java" errorPage="" %>
<%@ taglib uri="/WEB-INF/runqianReport4.tld" prefix="report" %>
<%@ page import="java.util.*"%>
<jsp:include page="check_time.html" flush="true" />
<jsp:include page="time.txt" flush="true" />
<META http-equiv=Refresh content="60"> 
<%
//页面每隔60秒自动刷新一遍      
request.setCharacterEncoding("GBK");
%>  
<%
String start_date_1=request.getParameter("start_date_1");;
String start_date_2=request.getParameter("start_date_2");;
if(start_date_1==null)
{
start_date_1="20101015";
}
if(start_date_2==null)
{
start_date_2="20101016";
}
String paramsString="start_date_1="+start_date_1+";start_date_2="+start_date_2;
String urlString="http://localhost:8081/qf_report_new/report_page.jsp?report_name=halfhour_flux&param_type=start_date_1_2&report_name_cn=全日分时客流对比&"+"start_date_1="+start_date_1+"&start_date_2="+start_date_2;
//System.out.println("paramsString="+paramsString);
//System.out.println("urlString="+urlString);
%>
<html>
<title>
全日分时客流对比
</title>
<BODY oncontextmenu="return false">
<form method=post id="form1" action="<%=request.getContextPath()%>/report_page.jsp">
     查询日期1：
<input type=text name="start_date_1" value="<%=start_date_1%>" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-

SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; 

BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblclick="CalendarWebControl.show

(this,false,this.value);">
     查询日期2： 
<input type=text name="start_date_2" value="<%=start_date_2%>" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-

SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; 

BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" ondblclick="CalendarWebControl.show

(this,false,this.value);">
 <input type="submit" name="submit" value="查询">

<input type=hidden name=report_name value="<%=(String)request.getParameter("report_name")%>">
<input type=hidden name=param_type value="<%=(String)request.getParameter("param_type")%>">
<input type=hidden name=report_name_cn value="<%=(String)request.getAttribute("report_name_cn")%>">
</form>
</body>
</html>
