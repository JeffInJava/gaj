<%@ page contentType="text/html; charset=GBK" language="java" errorPage="errorpage.jsp" %>
<%@ page import="java.util.Vector"%>
<%@ page import="com.bo.jsp.Tree"%>

<SCRIPT language=javascript>
<!--
function comefrom(line,station){
this.line = line; this.station =station;
} 
<%
String[] line=(String[])session.getAttribute("line");
String line_count=(String)session.getAttribute("line_count");
Vector station=new Vector();
station=(Vector)session.getAttribute("station");
System.out.println ("start:"+station);
System.out.println (line_count);
if(line_count==null){
	Tree tree=new Tree();
	line=tree.getRoot("select distinct '*'|| line_id || '*' || trim(line_nm_cn) from tbl_metro_line_info");
	session.setAttribute("line",line);
	System.out.println (line);
}
int line_num=line.length;
session.setAttribute("line_count",Integer.toString(line_num));
%>
var where = new Array(<%=line_num%>); 
where[0]= new comefrom("全线","全站");
<%
if (station.isEmpty()){
for (int i=0; i<line_num;i++){
		Tree tree=new Tree();
		String sql="select distinct '*' || station_id || '*' || trim(station_nm_cn) from tbl_metro_station_info where line_id='"+line[i].substring(1,3)+"'";
		String[] station_list=tree.getBranch(sql);
		int station_count=station_list.length;
		StringBuffer station_list_string=new StringBuffer();
		for (int j=0; j<station_count;j++){
			station_list_string.append("|");
			station_list_string.append(station_list[j]);
		}
		station.addElement(station_list_string);
%>
where[<%=i+1%>]=new comefrom("<%=line[i]%>","<%=station.get(i)%>");
<%
	}
System.out.println("init");
session.setAttribute("station",station);
System.out.println("init_ed"+station);
}else{
System.out.println("exit");
station=(Vector)session.getAttribute("station");
System.out.println("exit:"+station);
for (int i=0; i<line_num;i++){
%>where[<%=i+1%>]=new comefrom("<%=line[i]%>","<%=station.get(i)%>");<%
}
}
%>

function select() {
	with(document.MyForm.line_select) {
		var loca2=options[selectedIndex].value;
	 }
		for(i = 0;i < where.length;i ++){
			if (where[i].line == loca2) {
				loca3 = (where[i].station).split("|");
				for(j = 0;j < loca3.length;j++) {
					with(document.MyForm.station_select) {
					length = loca3.length;
						options[j].text = loca3[j]; 
						options[j].value = loca3[j];
						var loca4=options[selectedIndex].value;
					}
				}
			break;
			}
		}
		if(loca2=="全线"){
			document.MyForm.line_id.value="";
			document.MyForm.station_id.value="";
		}else{
			document.MyForm.line_id.value=loca2.substring(1,3);
			document.MyForm.station_id.value=loca4.substring(1,5);
		}
}

function init() {
	with(document.MyForm.line_select) {
		length = where.length;
		for(k=0;k<where.length;k++) {
			options[k].text = where[k].line;
			options[k].value = where[k].line;
		}
		options[selectedIndex].text = where[0].line;
		options[selectedIndex].value =where[0].line;

	}
	with(document.MyForm.station_select) {		
		loca3 = (where[0].station).split("|");
		length = loca3.length;
		for(l=0;l<length;l++) {
			options[l].text = loca3[l];
			options[l].value = loca3[l];
		}
		options[selectedIndex].text = loca3[0];
		options[selectedIndex].value =loca3[0];
	}
}
-->
</SCRIPT>