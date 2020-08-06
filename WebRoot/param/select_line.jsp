<%@ page contentType="text/html; charset=GBK" language="java" errorPage="errorpage.jsp" %>
<jsp:useBean id="tree" scope="page" class="com.bo.jsp.Tree"/>

<SCRIPT language=javascript>
<!--
function comefrom(line){
this.line = line; 
} 
<%
String[] line=(String[])session.getAttribute("line");
int line_count=0;
int line_flag=0;
if(line_flag==0){
 line=tree.getRoot("select '*'|| line_id || '*' || trim(line_nm_cn) from viw_metro_line_name where start_time<=to_char(sysdate,'yyyymmdd') and end_time>=to_char(sysdate,'yyyymmdd')  order by line_id");
  System.out.println(line);
 line_count=line.length;
 System.out.println(line_count);
 System.out.println(line_flag);
}else{
	line_count=line.length;
	System.out.println("exit");
	}
%>
var where = new Array(<%=line_count%>); 
where[0]= new comefrom("È«Ïß");
<%
try{
for (int i=0; i<line_count;i++){
if (line_flag==0){
 System.out.println(line_flag);	
 System.out.println(line[i]);
}
%>where[<%=i+1%>]=new comefrom("<%=line[i]%>");<%
}
session.setAttribute("line",line);
}catch(Exception e){
e.printStackTrace();
}
%>

function select() {

}

function init() {
	with(window.form1.line_id) {
		length = where.length;
		for(k=0;k<where.length;k++) {
			options[k].text = where[k].line;
			options[k].value = where[k].line.substring(1,3);
		}
		options[selectedIndex].text = where[0].line;
		options[selectedIndex].value =where[0].line.substring(1,3);

	}
}
-->
</SCRIPT>
