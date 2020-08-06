<%@ page contentType="text/html; charset=GBK" language="java" errorPage="errorpage.jsp" %>
<jsp:useBean id="tree" scope="page" class="com.bo.jsp.Tree"/>

<SCRIPT language=javascript>
<!--
function comefrom(line,station){
	this.line = line; 
	this.station =station;
} 
<%
	String[] line=(String[])session.getAttribute("line");
	String[] line_station=(String[])session.getAttribute("line_station");
	int line_count=0;
	if(line==null){
	 	line=tree.getRoot("select '*'|| line_id || '*' || trim(line_nm_cn) from viw_metro_line_name where start_time<=to_char(sysdate,'yyyymmdd') and end_time>=to_char(sysdate,'yyyymmdd')  order by line_id");
	}
%>
var where = new Array(<%=line_count%>); 
where[0]= new comefrom("全线","全站");
<%
	try{
		if(line_station==null){
			line_count=line.length;
		 	line_station=new String[line_count];
		 	
			String sql="select distinct '*' || station_id || '*' || trim(station_nm_cn),station_id from viw_metro_station_name where to_char(sysdate,'yyyymmdd') between start_time and end_time order by station_id";
			String[] station=tree.getBranch(sql);
			for (int i=0; i<line_count;i++){
				StringBuffer station_list=new StringBuffer();
				for (int j=0; j<station.length;j++){
					if(line[i].substring(1,3).equals(station[j].substring(1,3))){
						station_list.append("|");
						station_list.append(station[j]);
					}
				}
				line_station[i]=station_list.toString();
			}
		}
		
		for (int i=0; i<line.length;i++){
%>
			where[<%=i+1%>]=new comefrom("<%=line[i]%>","<%=line_station[i]%>");
<%
		}
		session.setAttribute("line",line);
		session.setAttribute("line_station",line_station);
	}catch(Exception e){
		e.printStackTrace();
	}
%>

function select() {
	with(document.form1.enter_line_select) {
		var loca2=options[selectedIndex].value;
	 }
		for(i = 0;i < where.length;i ++){
			if (where[i].line == loca2) {
				loca3 = (where[i].station).split("|");
				for(j = 0;j < loca3.length;j++) {
					with(document.form1.enter_station_select) {
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
			document.form1.enter_line_id.value="";
			document.form1.enter_station_id.value="";
		}else{
			document.form1.enter_line_id.value=loca2.substring(1,3);
			document.form1.enter_station_id.value=loca4.substring(1,5);
		}
}

function select_2() {
	with(document.form1.exit_line_select) {
		var loca2=options[selectedIndex].value;
	 }
		for(i = 0;i < where.length;i ++){
			if (where[i].line == loca2) {
				loca3 = (where[i].station).split("|");
				for(j = 0;j < loca3.length;j++) {
					with(document.form1.exit_station_select) {
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
			document.form1.exit_line_id.value="";
			document.form1.exit_station_id.value="";
		}else{
			document.form1.exit_line_id.value=loca2.substring(1,3);
			document.form1.exit_station_id.value=loca4.substring(1,5);
		}
}

function init() {
	with(document.form1.enter_line_select) {
		length = where.length;
		for(k=0;k<where.length;k++) {
			options[k].text = where[k].line;
			options[k].value = where[k].line;
		}
		options[selectedIndex].text = where[0].line;
		options[selectedIndex].value =where[0].line;

	}
	with(document.form1.enter_station_select) {		
		loca3 = (where[0].station).split("|");
		length = loca3.length;
		for(l=0;l<length;l++) {
			options[l].text = loca3[l];
			options[l].value = loca3[l];
		}
		options[selectedIndex].text = loca3[0];
		options[selectedIndex].value =loca3[0];
	}
	
	
	with(document.form1.exit_line_select) {
		length = where.length;
		for(k=0;k<where.length;k++) {
			options[k].text = where[k].line;
			options[k].value = where[k].line;
		}
		options[selectedIndex].text = where[0].line;
		options[selectedIndex].value =where[0].line;

	}
	with(document.form1.exit_station_select) {		
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
