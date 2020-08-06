// Decompiled by Jad v1.5.7g. Copyright 2000 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/SiliconValley/Bridge/8617/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi 
// Source File Name:   Report_Trans.java
package com.bo.report;
import com.runqian.report.schedule.sdk.ReportTaskInfo;
import com.runqian.report.schedule.sdk.TaskManager;
import com.runqian.report.schedule.sdk.condition.time.OnceIterator;
import com.runqian.report.schedule.sdk.database.DataBaseInfo;
import com.runqian.report.schedule.sdk.report.*;

public class ReportTrans
{

    public ReportTrans()
    {
        TaskManager taskmanager = TaskManager.createTaskManager();
        ReportTaskInfo reporttaskinfo = new ReportTaskInfo(true, new OnceIterator(), null);
        DataBaseInfo databaseinfo = new DataBaseInfo("oracle.jdbc.driver.OracleDriver", "jdbc:oracle:thin:@172.16.11.1:1521:tsdb", "proc", "abc", String.valueOf(1), "GBK");
        String str_line = "select line_id from tbl_metro_line_info";
        String s1 = "20050815";
        String str_date = "select " + s1 + " from dual";
        String s4="01";
        String str_s4="select '" + s4 + "' from dual";
        System.out.println(str_s4);
        ReportGroup reportgroup = new ReportGroup("e:/OutputReport", "Pdf");
        
        Report report1 = new Report(reportgroup, "D:/Tomcat50/webapps/report_1001/reportFiles/metro_ex_flux_day.raq", databaseinfo);
        Param param1 = new Param(databaseinfo, str_line);//线路
        Param param2 = new Param(databaseinfo, str_date);//日期
        
        
        Report report2 = new Report(reportgroup, "D:/Tomcat50/webapps/report_1001/reportFiles/report_trans.raq", databaseinfo);
        Param param3 = new Param(databaseinfo, str_date);//调度日期
        Param param4 =new Param(databaseinfo, str_s4);
        
   //     Report report3 = new Report(reportgroup, "D:/Tomcat50/webapps/report_1001/reportFiles/report_station_rate.raq", databaseinfo);
        
        param1.addArgument("line_id", "line_id");
        param2.addArgument("start_date", s1);
        
        param3.addArgument("report_date", s1);
        param4.addArgument("workerid", s4);
        
        report1.addParam(param1);
        report1.addParam(param2);
       	report2.addParam(param3); 
        report2.addParam(param4);
//        reportgroup.addGeneratedFile("aaa");
        reportgroup.addReport(report1);
        reportgroup.addReport(report2);
        
        reporttaskinfo.addReportGroup(reportgroup);
        taskmanager.addTask(reporttaskinfo);
        taskmanager.startTask(reporttaskinfo);
    }

    public static void main(String args[])
    {
        new ReportTrans();
    }
}