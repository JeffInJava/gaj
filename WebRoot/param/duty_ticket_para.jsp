<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="errorpage.jsp" %>
<jsp:useBean id="connora" scope="page" class="com.bo.jdbc.connection.OraConn"/>
<jsp:useBean id="tree" scope="page" class="com.bo.jsp.Tree"/>
<html>
<script language="javascript">

<%
	String[] line=(String[])session.getAttribute("line");
	String[] line_station=(String[])session.getAttribute("line_station");
	if(line==null){
		line=tree.getRoot("select '*'|| line_id || '*' || trim(line_nm_cn) from viw_metro_line_name where to_char(sysdate,'yyyymmdd') between start_time and end_time order by line_id ");
	}
	int line_count=line.length;
%>

var where = new Array(<%=line_count%>); 
function comefrom(line,station){
 this.line = line; this.station =station;
} 
where[0]= new comefrom("全线","全站");
<%
	if(line_station==null){
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
		session.setAttribute("line",line);
		session.setAttribute("line_station",line_station);
for (int i=0; i<line_count;i++){

%>
where[<%=i+1%>]=new comefrom("<%=line[i]%>","<%=line_station[i]%>")
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


function submit_click(){
	var line=document.MyForm.line_id.value;
	var station=document.MyForm.station_id.value;
	var state=document.MyForm.state.value;
	var validline="";
	var validstation="";
	var l_id=0;
	var s_id=0;
	//默认全查线和站
	document.MyForm.validline.value=0;
	document.MyForm.validstation.value=0;
	//全免
		if(state==0)
		{
			validline="1%";
			validstation="1%";
			document.MyForm.validline.value=validline;
			document.MyForm.validstation.value=validstation;
		}
	//线免
		else if(state==1)
		{
			if(line!=0){
			//线路小于10
					if(line.indexOf("0")==0){
						l_id=line.replace('0',' ').slice(1);
					}else{
						l_id=line;
					}
					//站全值1
					validstation="1%";
					//设线值
					for (i=1;i< l_id;i++){
						validline=validline+"_";
					}
					validline=validline+"1%";
					document.MyForm.validline.value=validline;
					document.MyForm.validstation.value=validstation;
			}
		}else if(state==2){
			if(station!=0){
				//站免.取线
				if(station.indexOf("0")==0){
					l_id=station.substring(1,2);
				}else{
					l_id=station.substring(0,2);
				}
				//站免.取站
				
				if(station.lastIndexOf("0")==2){
					s_id=station.substring(3,4);
				}else{
					s_id=station.substring(2,4);
				}
				
				//线匹配
				for(i=1;i<l_id;i++){
					validline=validline+"_";
				}
				validline=validline+"1%";
				
				//站匹配
				for (i=1;i<s_id;i++){
					validstation=validstation+"_";
				}
				validstation=validstation+"1%";
				document.MyForm.validline.value=validline;
				document.MyForm.validstation.value=validstation;
			}
		}
			document.MyForm.free_type.value=state;
	document.MyForm.submit();
}

function se()
{
	if(null!="<%=request.getParameter("line_select")%>")
	{
		for(var n = 0; n < window.MyForm.line_select.options.length; n++)
		{
			if(window.MyForm.line_select.options[n].value=="<%=(String)request.getParameter("line_select")%>")
		  {
		    window.MyForm.line_select.options[n].selected = true;
		    select();
		  }
		}
	}
	
	if(null!="<%=request.getParameter("station_select")%>")
	{
		for(var n = 0; n < window.MyForm.station_select.options.length; n++)
		{
			if(window.MyForm.station_select.options[n].value=="<%=(String)request.getParameter("station_select")%>")
		  {
		    window.MyForm.station_select.options[n].selected = true;
		  }
		}
	}
}

</script>
<html>
<body onload="init();se();">
<form method=post name="MyForm" action="<%=request.getContextPath()%>/report_page.jsp">
<table>
<td><table border="1">
  <tr>
    <td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">票号码: </td>
    <td><input type=text name="ticketid" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 110px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></td>
    <td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">员工号码:</td>
    <td><input type=text name="workerid" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 110px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></td>
    <td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">票状态:</td>
    <td><input type=text name="card_state" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></td>
  </tr>
  <tr>
    <td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">免费线路:</td>
    <td><select name="line_select" onchange="select()" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 110px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></select></td>
    <td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">免费站点:</td>
    <td><select name="station_select" onchange="select()" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 110px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></select></td>
    <td style="BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">免费状态:</td>
    <td><select name="state" style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 100px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">
    	<option value=3>全部查询</option>
    	<option value=0>全网免费票</option>
    	<option value=1>线路免费票</option>
    	<option value=2>站免费票</option>
    </select></td>
  </tr>
</table>
<td><input type=button value=查询 style="FONT-SIZE: 13px; WIDTH: 40px; COLOR: mediumblue; FONT-FAMILY: 宋体; HEIGHT: 22px; BACKGROUND-COLOR: wheat" onClick="submit_click();"></td>
</td>
</table>
<input type=hidden name=report_name value="<%=(String)request.getParameter("report_name")%>">
<input type=hidden name=param_type value="<%=(String)request.getParameter("param_type")%>">
<input type=hidden name=report_name_cn value="<%=(String)request.getAttribute("report_name_cn")%>">
<input type=hidden name="line_id">
<input type=hidden name="station_id">
<input type=hidden name="validline">
<input type=hidden name="validstation">
<input type=hidden name="free_type">
</form>
</body>