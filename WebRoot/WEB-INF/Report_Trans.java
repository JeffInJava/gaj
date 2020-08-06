import java.io.*;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.runqian.base.util.*;
import com.runqian.report.schedule.sdk.*;
import com.runqian.report.schedule.ui.*;
import com.runqian.report.schedule.task.*;
import com.runqian.report.schedule.*;
import com.runqian.report.schedule.sdk.condition.custom.*;
import com.runqian.report.schedule.sdk.condition.time.*;
import com.runqian.report.schedule.sdk.io.*;
import com.runqian.report.schedule.sdk.print.*;
import com.runqian.report.schedule.sdk.processor.*;
import com.runqian.report.schedule.sdk.util.ClassManager;
import com.runqian.report.schedule.sdk.database.DataBaseInfo;
import com.runqian.report.schedule.sdk.report.*;
public class Report_Trans{
	public Report_Trans(){
	//创建任务管理器
	TaskManager taskManager= TaskManager.createTaskManager();
    //创建生成报表任务
    ReportTaskInfo taskInfo = new ReportTaskInfo(true,new OnceIterator(), null);
    //创建数据库配置信息
  //  DateBaseInfo dbInfo = new DateBaseInfo();
    DataBaseInfo dbInfo = new DataBaseInfo("oracle.jdbc.driver.OracleDriver","jdbc:oracle:thin:@172.16.11.1:1521:devdb","proc", "abc",String.valueOf(DBTypes.ORACLE),"GBK");
    //报表参数组对应的SQL语句
    String line_id="select line_id from tbl_metro_line_info";
  //  String SQL = "SELECT to_char(sysdate,'yyyymmdd') today from dual";
  	String time="20050811";
  	String sql="select "+ time +" from dual";

    //创建报表组
    ReportGroup reportGroup = new ReportGroup("e:/OutputReport", OutputReportType.PDF);
    

	

    //创建单个报表
    Report report =new Report(reportGroup,"D:/Tomcat50/webapps/report_1001/reportFiles/metro_ex_flux_day.raq",dbInfo);
//    SuffixManager sm=new SuffixManager();
 //   sm.createOutputFileName("e:/OutputReport","D:/Tomcat50/webapps/report_1001/reportFiles/metro_ex_flux_day.raq",);
    
    //创建参数
    Param param1 = new Param(dbInfo,line_id);
    Param param2 = new Param(dbInfo,sql);
    param1.addArgument("line_id","line_id");
    param2.addArgument("start_date",time);

//    Param param2 = new Param(dbInfo, SQL);
//    param2.addArgument("arg2","customer_id");
//    param2.addArgument("arg3","customer_name");

    //将参数添加到报表中
    report.addParam(param1);
    report.addParam(param2);
//    report.addParam(param2);
 
    //将报表添加至报表组中
    reportGroup.addGeneratedFile("aaa");
    reportGroup.addReport(report);
    

    //将报表组添加至报表任务信息中
    taskInfo.addReportGroup(reportGroup);
	/*
    //添加邮件推送器
    //要发送的邮箱地址列表
    List toAddressList = new ArrayList();
    
    //要发送的邮箱地址
    String toAddress="java_engineer@163.com";
    toAddressList.add(toAddress);
    toAddress="freedomlov@yahoo.com.cn";
    toAddressList.add(toAddress);
    //邮件推送器
    MailProcessor processor = new MailProcessor("smtp.163.com", "java_engineer", "freedomfly",
    			"java_engineer@163.com", "report","report demo", toAddressList);
    //添加邮件推送器至报表任务信息
    taskInfo.addProcessor(processor);
    */
  //  FtpProcessor fprocessor= new FtpProcessor("172.16.11.129","czb","123456","/e:/private/czb");
 //   taskInfo.addProcessor(fprocessor);
    //向任务管理器添加任务
    taskManager.addTask(taskInfo);
    
    //启动任务
taskManager.startTask(taskInfo);
	}

public static void main(String[] args){
	new Report_Trans();
}
}
