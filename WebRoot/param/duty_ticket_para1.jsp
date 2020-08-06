<%@ page contentType="text/html;charset=GBK" %>
<BODY oncontextmenu="return false">
<TABLE>
  <TBODY>
  <TR>
    <TD>
      <FORM id=duty_ticket_para action=/report/setReportParams method=post>
      <SCRIPT language=javascript 
      src="para.files/com.runqian.base.util[1]"></SCRIPT>

      <TABLE style="WIDTH: 448px; BORDER-COLLAPSE: collapse" cellSpacing=0 
      cellPadding=0>
        <COLGROUP>
        <COL id=duty_ticket_para_col1 style="WIDTH: 85px"></COL>
        <COL id=duty_ticket_para_col2 style="WIDTH: 72px"></COL>
        <COL id=duty_ticket_para_col3 style="WIDTH: 69px"></COL>
        <COL id=duty_ticket_para_col4 style="WIDTH: 72px"></COL>
        <COL id=duty_ticket_para_col5 style="WIDTH: 69px"></COL>
        <COL id=duty_ticket_para_col6 style="WIDTH: 72px"></COL></COLGROUP>
        <TBODY>
        <TR 
        style="BORDER-RIGHT: #000000 1px; BORDER-TOP: #000000 1px; PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" 
        height=20>
          <TD 
          style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">票号码：</TD>
          <TD><INPUT id=ticketid 
            onblur="if( ! _checkDataType( '1', value ) ) this.focus();" 
            style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 72px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" 
            name=ticketid> </TD>
          <TD 
          style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px solid; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">员工号码：</TD>
          <TD><INPUT id=workerid 
            onblur="if( ! _checkDataType( '1', value ) ) this.focus();" 
            style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 72px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" 
            name=workerid> </TD>
          <TD 
          style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px solid; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">票状态：</TD>
          <TD><INPUT id=card_state 
            onblur="if( ! _checkDataType( '1', value ) ) this.focus();" 
            style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 72px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" 
            name=card_state> </TD></TR>
        <TR 
        style="BORDER-RIGHT: #000000 1px; BORDER-TOP: #000000 1px; PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 6px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" 
        height=6>
          <TD 
          style="BORDER-RIGHT: #000000 1px; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></TD>
          <TD 
          style="BORDER-RIGHT: #000000 1px; BORDER-TOP: #000000 1px solid; PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px solid; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></TD>
          <TD 
          style="BORDER-RIGHT: #000000 1px; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></TD>
          <TD 
          style="BORDER-RIGHT: #000000 1px; BORDER-TOP: #000000 1px solid; PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px solid; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></TD>
          <TD 
          style="BORDER-RIGHT: #000000 1px; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></TD>
          <TD 
          style="BORDER-RIGHT: #000000 1px; BORDER-TOP: #000000 1px solid; PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px solid; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none"></TD></TR>
        <TR 
        style="BORDER-RIGHT: #000000 1px; BORDER-TOP: #000000 1px; PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" 
        height=20>
          <TD 
          style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">免费线路：</TD>
          <TD><SELECT id=validline 
            style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 72px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" 
            name=validline value=""> <OPTION value=02 selected>02</OPTION> 
              <OPTION value=01>01</OPTION> <OPTION 
value=03>03</OPTION></SELECT></TD>
          <TD 
          style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px solid; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">免费站点：</TD>
          <TD><INPUT id=validstation 
            onblur="if( ! _checkDataType( '1', value ) ) this.focus();" 
            style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 72px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" 
            name=validstation> </TD>
          <TD 
          style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px; PADDING-LEFT: 3px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; BORDER-LEFT: #000000 1px solid; COLOR: #000000; BORDER-BOTTOM: #000000 1px; FONT-STYLE: normal; FONT-FAMILY: 宋体; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none">免费状态：</TD>
          <TD><SELECT id=free_type 
            style="PADDING-LEFT: 0px; FONT-WEIGHT: normal; FONT-SIZE: 12px; VERTICAL-ALIGN: middle; WIDTH: 72px; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: 宋体; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: left; TEXT-DECORATION: none" 
            name=free_type value=""> <OPTION value=0 selected>全免费</OPTION> 
              <OPTION value=1>线路免费</OPTION> <OPTION value=2>车站免费</OPTION> 
              <OPTION value=3>无限制</OPTION></SELECT></TD></TR></TBODY></TABLE>
      <SCRIPT language=javascript>
	function duty_ticket_para_checkValid() {
		return true;
	}
</SCRIPT>
      <INPUT type=hidden value=/report_page.jsp name=resultPage> </FORM></TD>
    <TD><A 
href="javascript:_submit(duty_ticket_para)">查询</A></TD></TR></TBODY></TABLE></BODY></HTML>
