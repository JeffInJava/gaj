<%@ page contentType="text/html;charset=GBK" pageEncoding="GBK" language="java" errorPage="" %>
<%@ taglib uri="/WEB-INF/runqianReport4.tld" prefix="report" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="dateDemo" scope="page" class="com.bo.util.DateDemo"/>
<html>
<%
	request.setCharacterEncoding("GBK");
	request.setAttribute("report_name_cn",(String)request.getParameter("report_name_cn"));
	String titleString=new String(request.getParameter("report_name_cn").getBytes("gb2312"),"GBK");
%>
<title>
<%=titleString%>
</title>
<body oncontextmenu="return false">

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
	String sqlpre="select stmt_day,line_id,station_id,start_time,end_time,enter_times,exit_times,change_times from tbl_metro_fluxnew_";
	String sql=dateDemo.getSQL(sqlpre,start_date,end_date,line_id,station_id);
	params=params+"macal="+sql;
	}else if(report_name.equals("METRO_FLUX_TOTAL")){
		String line_id=(String)request.getParameter("line_id");
		String start_date=(String)request.getParameter("start_date");
		String end_date=(String)request.getParameter("end_date");
		String sqlpre="select stmt_day,line_id,station_id,sum(enter_times) enter_times,sum(exit_times) exit_times ,sum(change_times) change_times from tbl_metro_fluxnew_";
		String sql=dateDemo.getSQL_group_by(sqlpre,start_date,end_date,line_id);
		params=params+"macal="+sql;
		
	}else if(report_name.equals("seg_query")){
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if(report_name.equals("WINRGR_DAY_1")){
		String line_id=(String)request.getParameter("line_id");
		String station_id=(String)request.getParameter("station_id");
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+"select * from tbl_metro_windtl_1_"+start_date + " where (trim(line_id)='"+line_id+"' or '"+line_id + "' is null) and (trim(station_id)='"+station_id+"' or '"+station_id + "' is null)";
	}else if(report_name.equals("WINRGR_DAY_2")){
		String line_id=(String)request.getParameter("line_id");
		String station_id=(String)request.getParameter("station_id");
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+"select * from tbl_metro_windtl_2_"+start_date + " where (trim(line_id)='"+line_id+"' or '"+line_id + "' is null) and (trim(station_id)='"+station_id+"' or '"+station_id + "' is null)";
	}else if(report_name.equals("WINRGR_DAY_3")){
		String line_id=(String)request.getParameter("line_id");
		String station_id=(String)request.getParameter("station_id");
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+"select * from tbl_metro_windtl_3_"+start_date + " where (trim(line_id)='"+line_id+"' or '"+line_id + "' is null) and (trim(station_id)='"+station_id+"' or '"+station_id + "' is null)";
	}else if(report_name.equals("METRO_WINRGR_DAY_4")){
		String line_id=(String)request.getParameter("line_id");
		String station_id=(String)request.getParameter("station_id");
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+"select * from tbl_metro_windtl_4_"+start_date + " where (trim(line_id)='"+line_id+"' or '"+line_id + "' is null) and (trim(station_id)='"+station_id+"' or '"+station_id + "' is null)";
	}else if(report_name.equals("METRO_WINRGR_DAY_5")){
		String line_id=(String)request.getParameter("line_id");
		String station_id=(String)request.getParameter("station_id");
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+"select * from tbl_metro_windtl_5_"+start_date + " where (trim(line_id)='"+line_id+"' or '"+line_id + "' is null) and (trim(station_id)='"+station_id+"' or '"+station_id + "' is null)";
	}else if(report_name.equals("METRO_WINRGR_DAY_6")){
		String line_id=(String)request.getParameter("line_id");
		String station_id=(String)request.getParameter("station_id");
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+"select * from tbl_metro_windtl_6_"+start_date + " where (trim(line_id)='"+line_id+"' or '"+line_id + "' is null) and (trim(station_id)='"+station_id+"' or '"+station_id + "' is null)";
	}else if(report_name.equals("METRO_ODFLUX_DAY")){
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if(report_name.equals("en_stic_ex_all")){
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if(report_name.equals("odall")){
		//od客流
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if(report_name.equals("afc_fluxnew")){
		//各线路小时客流
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if(report_name.equals("afc_fluxnew_time")){
		//各线路分时客流
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if(report_name.equals("afc_fluxnew_high")){
		//各线路高峰小时客流
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if((report_name.equals("sjt_sell")) && ("01".equals((String)request.getParameter("line_id"))) ){
		//
		report_name="sjt_sell_line1";
	}else if((report_name.equals("sjt_sell")) && ("02".equals((String)request.getParameter("line_id"))) ){
		//
		report_name="sjt_sell_line2";
	}else if((report_name.equals("sjt_sell")) && ("03".equals((String)request.getParameter("line_id"))) ){
		//
		report_name="sjt_sell_line3";
	}else if((report_name.equals("sell_income")) && ("01".equals((String)request.getParameter("line_id"))) ){
		//1-2
		report_name="sell_income_line1";
	}else if((report_name.equals("sell_income")) && ("02".equals((String)request.getParameter("line_id"))) ){
		//1-2
		report_name="sell_income_line2";
	}else if((report_name.equals("sell_income")) && ("03".equals((String)request.getParameter("line_id"))) ){
		//1-2
		report_name="sell_income_line3";
	}else if((report_name.equals("sptc_line_dayrpt_sum")) && ("01".equals((String)request.getParameter("line_id"))) ){
		//3
		report_name="sptc_line_dayrpt_sum_line1";
	}else if((report_name.equals("sjt_line_dayrpt_sum")) && ("01".equals((String)request.getParameter("line_id"))) ){
		//4
		report_name="sjt_line_dayrpt_sum_line1";
	}else if((report_name.equals("sptc_center_dayrpt_sum")) && ("01".equals((String)request.getParameter("line_id"))) ){
		//5
		report_name="sptc_center_dayrpt_sum_line1";
	}else if((report_name.equals("sjt_center_dayrpt_sum")) && ("01".equals((String)request.getParameter("line_id"))) ){
		//6
		report_name="sjt_center_dayrpt_sum_line1";
	}else if((report_name.equals("sptc_line_compare_diff")) && ("01".equals((String)request.getParameter("line_id"))) ){
		//7
		report_name="sptc_line_compare_diff_line1";
	}else if((report_name.equals("sjt_line_compare_diff")) && ("01".equals((String)request.getParameter("line_id"))) ){
		//8
		report_name="sjt_line_compare_diff_line1";
	}else if((report_name.equals("station_ex_flux_day")) && ("01".equals((String)request.getParameter("line_id"))) ){
		//15
		report_name="station_ex_flux_day_line1";
	}else if((report_name.equals("station_ex_flux_day")) && ("03".equals((String)request.getParameter("line_id"))) ){
		//15
		report_name="station_ex_flux_day_line3";
	}else if((report_name.equals("en_ex_flux_day_line")) && ("01".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发1号线
		report_name="en_ex_flux_day_line1";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
		
	}else if((report_name.equals("en_ex_flux_day_line")) && ("02".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发2号线
		report_name="en_ex_flux_day_line2";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
		
	}else if((report_name.equals("en_ex_flux_day_line")) && ("03".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发3号线
		report_name="en_ex_flux_day_line3";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
		
	}else if((report_name.equals("en_ex_flux_day_line")) && ("04".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发4号线
		report_name="en_ex_flux_day_line4";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
		
	}else if((report_name.equals("en_ex_flux_day_line")) && ("05".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发5号线
		report_name="en_ex_flux_day_line5";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if((report_name.equals("en_ex_flux_day_line")) && ("06".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发6号线
		report_name="en_ex_flux_day_line6";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if((report_name.equals("en_ex_flux_day_line")) && ("07".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发7号线
		report_name="en_ex_flux_day_line7";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if((report_name.equals("en_ex_flux_day_line")) && ("08".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发8号线
		report_name="en_ex_flux_day_line8";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if((report_name.equals("en_ex_flux_day_line")) && ("09".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发9号线
		report_name="en_ex_flux_day_line9";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if((report_name.equals("en_ex_flux_day_line")) && ("10".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发10号线
		report_name="en_ex_flux_day_line10";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if((report_name.equals("en_ex_flux_day_line")) && ("11".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发11号线
		report_name="en_ex_flux_day_line11";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if((report_name.equals("flux_day_line")) && ("01".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发1号线
		report_name="flux_day_line1";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
		
	}else if((report_name.equals("flux_day_line")) && ("02".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发2号线
		report_name="flux_day_line2";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
		
	}else if((report_name.equals("flux_day_line")) && ("03".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发3号线
		report_name="flux_day_line3";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
		
	}else if((report_name.equals("flux_day_line")) && ("04".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发4号线
		report_name="flux_day_line4";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
		
	}else if((report_name.equals("flux_day_line")) && ("05".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发5号线
		report_name="flux_day_line5";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if((report_name.equals("flux_day_line")) && ("06".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发6号线
		report_name="flux_day_line6";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if((report_name.equals("flux_day_line")) && ("07".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发7号线
		report_name="flux_day_line7";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if((report_name.equals("flux_day_line")) && ("08".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发8号线
		report_name="flux_day_line8";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if((report_name.equals("flux_day_line")) && ("09".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发9号线
		report_name="flux_day_line9";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if((report_name.equals("flux_day_line")) && ("10".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发10号线
		report_name="flux_day_line10";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if((report_name.equals("flux_day_line")) && ("11".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发11号线
		report_name="flux_day_line11";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if((report_name.equals("en_ex_flux_day_en_line")) && ("01".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发1号线
		report_name="en_ex_flux_day_en_line1";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
		
	}else if((report_name.equals("en_ex_flux_day_en_line")) && ("02".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发2号线
		report_name="en_ex_flux_day_en_line2";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
		
	}else if((report_name.equals("en_ex_flux_day_en_line")) && ("03".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发3号线
		report_name="en_ex_flux_day_en_line3";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
		
	}else if((report_name.equals("en_ex_flux_day_en_line")) && ("04".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发4号线
		report_name="en_ex_flux_day_en_line4";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
		
	}else if((report_name.equals("en_ex_flux_day_en_line")) && ("05".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发5号线
		report_name="en_ex_flux_day_en_line5";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if((report_name.equals("en_ex_flux_day_en_line")) && ("06".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发6号线
		report_name="en_ex_flux_day_en_line6";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if((report_name.equals("en_ex_flux_day_en_line")) && ("07".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发7号线
		report_name="en_ex_flux_day_en_line7";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if((report_name.equals("en_ex_flux_day_en_line")) && ("08".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发8号线
		report_name="en_ex_flux_day_en_line8";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if((report_name.equals("en_ex_flux_day_en_line")) && ("09".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发9号线
		report_name="en_ex_flux_day_en_line9";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if((report_name.equals("en_ex_flux_day_en_line")) && ("10".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发10号线
		report_name="en_ex_flux_day_en_line10";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if((report_name.equals("en_ex_flux_day_en_line")) && ("10".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发10号线
		report_name="en_ex_flux_day_en_line10";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if((report_name.equals("en_ex_flux_day_en_line")) && ("11".equals((String)request.getParameter("line_id"))) ){
		//13给宏赋值发11号线
		report_name="en_ex_flux_day_en_line11";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if(report_name.equals("en_ex_flux_day_owner0001")){
		//13给宏赋值zhengxian
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if(report_name.equals("od_fluxnew_hour") ){
		//先择15分钟断面客流
		if(((String)request.getParameter("time_seg")).equals("1")){
		report_name="od_fluxnew_mi";
		}
	}else if(report_name.equals("line_change_flux2")){
		//换乘客流分析表
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
		
				
	}else if(report_name.equals("net_test")){
		//联系网测试
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if(report_name.equals("traffic_card_fav")){
		//交通轨道联乘优惠统计表
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}
	
	else if(report_name.equals("station_change") ){
		//车站换乘
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if(report_name.equals("afc_line5") ){
		//
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if(report_name.equals("line_hour_flux") ){
		//
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if(report_name.equals("sptc_filling")&& ("00".equals((String)request.getParameter("line_id")))){
		//
		report_name="sptc_filling_other";
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if(report_name.equals("sptc_filling") ){
		//
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if(report_name.equals("stic_filling")&& ("00".equals((String)request.getParameter("line_id")))){
		//
		report_name="stic_filling_other";
	}else if(report_name.equals("stic_filling") ){
		//		
	}else if((report_name.equals("od_max_fluxnew")) &&("1".equals((String)request.getParameter("up_down")))  ){
		//断面下行
		report_name="od_max_fluxnew_down";
	}else if((report_name.equals("od_max_fluxnew")) &&("0".equals((String)request.getParameter("up_down")))  ){
		//断面下行
		report_name="od_max_fluxnew_up";
	}else if((report_name.equals("od_fluxnew")) && ("04".equals((String)request.getParameter("line_id"))) &&("0".equals((String)request.getParameter("up_down")))  ){
		//四号上行
		report_name="od_fluxnew_up_04";
	}else if((report_name.equals("od_fluxnew")) && ("04".equals((String)request.getParameter("line_id"))) &&("1".equals((String)request.getParameter("up_down")))  ){
		//四号下行
		report_name="od_fluxnew_down_04";
	}else if((report_name.equals("od_fluxnew")) && ("06".equals((String)request.getParameter("line_id"))) &&("0".equals((String)request.getParameter("up_down")))  ){
		//6上行
		report_name="od_fluxnew_up_68";
	}else if((report_name.equals("od_fluxnew")) && ("06".equals((String)request.getParameter("line_id"))) &&("1".equals((String)request.getParameter("up_down")))  ){
		//6下行
		report_name="od_fluxnew_down_68";
	}else if((report_name.equals("od_fluxnew")) && ("08".equals((String)request.getParameter("line_id"))) &&("0".equals((String)request.getParameter("up_down")))  ){
		//8上行
		report_name="od_fluxnew_up_68";
	}else if((report_name.equals("od_fluxnew")) && ("08".equals((String)request.getParameter("line_id"))) &&("1".equals((String)request.getParameter("up_down")))  ){
		//8下行
		report_name="od_fluxnew_down_68";
	}else if((report_name.equals("od_fluxnew")) &&("0".equals((String)request.getParameter("up_down")))  ){
		//上行
		report_name="od_fluxnew_up";
	}else if((report_name.equals("od_fluxnew")) &&("1".equals((String)request.getParameter("up_down")))  ){
		//下行
		report_name="od_fluxnew_down";

	}else if((report_name.equals("od_fluxnew_68")) &&("0".equals((String)request.getParameter("up_down")))  ){
		//指定车站上行
		report_name="od_fluxnew_up_68_sum";
	}else if((report_name.equals("od_fluxnew_68")) &&("1".equals((String)request.getParameter("up_down")))  ){
		//指定车站下行
		report_name="od_fluxnew_down_68_sum";

	}else if((report_name.equals("data_store_1"))){
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if((report_name.equals("yingjipiao"))){
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if((report_name.equals("danchengpiaoCJHSS"))){
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if(report_name.equals("jnp_od_flux")){
		//纪念票进站流量统计表
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if(report_name.equals("line_change_flux2_type")){
		
	}else if((report_name.equals("sptc_bom_compare_diff")) && ("0".equals((String)request.getParameter("select"))) ){
		//计时计次卡
		report_name="sptc_bom_compare_diff_jsjc";
	}else if((report_name.equals("sptc_bom_compare_diff")) && ("1".equals((String)request.getParameter("select"))) ){
		//计时计费卡
		report_name="sptc_bom_compare_diff_jsjf";
	}else if((report_name.equals("sptc_bom_compare_diff")) && ("2".equals((String)request.getParameter("select"))) ){
		//普通卡
		report_name="sptc_bom_compare_diff_pt";
	}	else if((report_name.equals("sptc_compare_diff")) && ("0".equals((String)request.getParameter("select"))) ){
		//计时计次卡
		report_name="sptc_compare_diff_jsjck";
	}else if((report_name.equals("sptc_compare_diff")) && ("1".equals((String)request.getParameter("select"))) ){
		//计时计费卡
		report_name="sptc_compare_diff_jsjfk";
	}else if((report_name.equals("sptc_compare_diff")) && ("2".equals((String)request.getParameter("select"))) ){
		//公交卡
		report_name="sptc_compare_diff_gjk";
	}	else if((report_name.equals("sjt_use2")) && ("0".equals((String)request.getParameter("select"))) ){
		//单程票
		report_name="sjt_use2_dcp";
	}else if((report_name.equals("sjt_use2")) && ("1".equals((String)request.getParameter("select"))) ){
		//储值票
		report_name="sjt_use2_czp";
	}else if((report_name.equals("sjt_use2")) && ("2".equals((String)request.getParameter("select"))) ){
		//计次票
		report_name="sjt_use2_jcp";
	}else if((report_name.equals("line_owner_income")) && ("0".equals((String)request.getParameter("select"))) ){
		//原收益
		report_name="line_owner_income_old";
	}else if((report_name.equals("line_owner_income")) && ("1".equals((String)request.getParameter("select"))) ){
		//储值
		report_name="line_owner_income_cz";
	}else if((report_name.equals("line_owner_income")) && ("2".equals((String)request.getParameter("select"))) ){
		//计次
		report_name="line_owner_income_jc";
	}else if((report_name.equals("owner_income_no_handle")) && ("0".equals((String)request.getParameter("select"))) ){
		//原收益
		report_name="owner_income_no_handle_old";
	}else if((report_name.equals("owner_income_no_handle")) && ("1".equals((String)request.getParameter("select"))) ){
		//储值
		report_name="owner_income_no_handle_cz";
	}else if((report_name.equals("owner_income_no_handle")) && ("2".equals((String)request.getParameter("select"))) ){
		//计次
		report_name="owner_income_no_handle_jc";
	}else if((report_name.equals("owner_income_trans_mon")) && ("0".equals((String)request.getParameter("select"))) ){
		//原收益
		report_name="owner_income_trans_mon";
	}else if((report_name.equals("owner_income_trans_mon")) && ("1".equals((String)request.getParameter("select"))) ){
		//储值
		report_name="owner_income_trans_mon_cz";
	}else if((report_name.equals("owner_income_trans_mon")) && ("2".equals((String)request.getParameter("select"))) ){
		//计次
		report_name="owner_income_trans_mon_jc";
	}else if((report_name.equals("owner_income_no_handle_list")) && ("0".equals((String)request.getParameter("select"))) ){
		//原收益
		report_name="owner_income_no_handle_list";
	}else if((report_name.equals("owner_income_no_handle_list")) && ("1".equals((String)request.getParameter("select"))) ){
		//储值
		report_name="owner_income_no_handle_list_cz";
	}else if((report_name.equals("owner_income_no_handle_list")) && ("2".equals((String)request.getParameter("select"))) ){
		//计次
		report_name="owner_income_no_handle_list_jc";
	}else if((report_name.equals("sptc_package_dubb_bom")) && ("2".equals((String)request.getParameter("select"))) ){
		//普通卡
		report_name="sptc_package_dubb_bom";
	}	else if((report_name.equals("sptc_package_dubb_bom")) && ("0".equals((String)request.getParameter("select"))) ){
		//计次卡
		report_name="sptc_package_dubb_bom_jck";
	}else if((report_name.equals("sptc_package_dubb_bom")) && ("1".equals((String)request.getParameter("select"))) ){
		//计费卡
		report_name="sptc_package_dubb_bom_jfk";
	}else if((report_name.equals("sptc_fep_stlb_bom")) && ("2".equals((String)request.getParameter("select"))) ){
		//普通卡
		report_name="sptc_fep_stlb_bom";
	}else if((report_name.equals("sptc_fep_stlb_bom")) && ("0".equals((String)request.getParameter("select"))) ){
		//计次卡
		report_name="sptc_fep_stlb_bom_jck";
	}else if((report_name.equals("sptc_fep_stlb_bom")) && ("1".equals((String)request.getParameter("select"))) ){
		//计费卡
		report_name="sptc_fep_stlb_bom_jfk";
	}else if((report_name.equals("sptc_margin_money")) && ("2".equals((String)request.getParameter("select"))) ){
		//普通卡
		report_name="sptc_margin_money_gjk";
	}else if((report_name.equals("sptc_margin_money")) && ("0".equals((String)request.getParameter("select"))) ){
		//计次卡
		report_name="sptc_margin_money_jck";
	}else if((report_name.equals("sptc_margin_money")) && ("1".equals((String)request.getParameter("select"))) ){
		//计费卡
		report_name="sptc_margin_money_jfk";
	}else if((report_name.equals("wait_qf_acc")) && ("0".equals((String)request.getParameter("select"))) ){
		//计次卡
		report_name="wait_qf_acc";
	}else if((report_name.equals("wait_qf_acc")) && ("1".equals((String)request.getParameter("select"))) ){
		//计费卡
		report_name="wait_qf_acc_new";
	}else if(report_name.equals("lrk_line_query")){
		//lrk线路
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if(report_name.equals("lrk_station_query")){
		//lrk车站
		String start_date=(String)request.getParameter("start_date");
		params=params+"macal="+start_date;
	}else if((report_name.equals("day_balance")) && ("0".equals((String)request.getParameter("line_id"))) ){
		report_name="day_balance";
	}else if((report_name.equals("day_balance")) && ("1".equals((String)request.getParameter("line_id"))) ){
		report_name="day_balance_56";
	}
%>
<jsp:include page="<%="param/"+(String)request.getParameter("param_type")+".jsp"%>" flush="true" />
<report:html name="report_page" reportFileName="<%=report_name+".raq"%>"
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
	params="<%=params%>"
	saveAsName="<%=(String)request.getParameter("report_name")%>"
/>
</body>
</html>