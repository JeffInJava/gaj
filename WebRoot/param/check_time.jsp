function button_submit(){
	var defaultDate=form1.start_date.value;
	alert(defaultDate);
	var Datereg=/^\d{4}\d{1,2}\d{2}$/;
    if((!defaultDate.match(Datereg))){
     alert("Ĭ�����ڵĸ�ʽ����ȷ��\t\n\nĬ�Ͽɽ��ܸ�ʽΪ:\n1��yyyymmdd \n2��(��)");
     return;
		}
		var thisYear=parseInt(defaultDate.substring(0,4));
		var thisDay=parseInt(defaultDate.substring(6,8));
		var thisMonth=parseInt(defaultDate.substring(4,6));
		alert("��"+thisDay);
		alert("��"+thisMonth);
		
		var nextMonth=thisMonth+1;
		var oneDay = 1000 * 60 * 60 * 24;
  	var thisMonth = new Date(thisYear, thisMonth, 1);
   	var nextMonth = new Date(thisYear,nextMonth, 1);
   	var len = Math.ceil((nextMonth.getTime() - thisMonth.getTime())/oneDay);
		alert(len);
		if(thisDay==0 || thisDay>len){
			alert("��������ڴ���!");
			return;
		}
	form1.submit();
}