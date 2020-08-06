<%@ page contentType="text/html; charset=GBK" language="java" errorPage="errorpage.jsp" %>
<jsp:useBean id="tree" scope="page" class="com.bo.jsp.Tree"/>
<%
String[] line=tree.getRoot("select distinct '*'|| line_id || '*' || trim(line_nm_cn) from tbl_metro_line_info");
int line_count=line.length;
System.out.println(line_count);
%>
<SCRIPT language=javascript>
<!--
var where = new Array(<%=line_count%>); 
function comefrom(line,station){
 this.line = line; this.station =station;
} 
where[0]= new comefrom("全线","全站");
<%
for (int i=0; i<line_count;i++){
	String sql="select distinct '*' || station_id || '*' || trim(station_nm_cn) from tbl_metro_station_info where line_id='"+line[i].substring(1,3)+"'";
	String[] station=tree.getBranch(sql);
	int station_count=station.length;
	StringBuffer station_list=new StringBuffer();
	for (int j=0; j<station_count;j++){
		station_list.append("|");
		station_list.append(station[j]);
	}
%>
where[<%=i+1%>]=new comefrom("<%=line[i]%>","<%=station_list.toString()%>")
<%
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
