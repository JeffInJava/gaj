function button_submit(){
	var defaultDate=form1.start_date.value;
	alert(defaultDate);
	var Datereg=/^\d{4}\d{1,2}\d{2}$/;
    if((!defaultDate.match(Datereg))){
     alert("默认日期的格式不正确！\t\n\n默认可接受格式为:\n1、yyyymmdd \n2、(空)");
     return;
		}
		var thisYear=parseInt(defaultDate.substring(0,4));
		var thisDay=parseInt(defaultDate.substring(6,8));
		var thisMonth=parseInt(defaultDate.substring(4,6));
		alert("日"+thisDay);
		alert("月"+thisMonth);
		
		var nextMonth=thisMonth+1;
		var oneDay = 1000 * 60 * 60 * 24;
  	var thisMonth = new Date(thisYear, thisMonth, 1);
   	var nextMonth = new Date(thisYear,nextMonth, 1);
   	var len = Math.ceil((nextMonth.getTime() - thisMonth.getTime())/oneDay);
		alert(len);
		if(thisDay==0 || thisDay>len){
			alert("输入的日期错误!");
			return;
		}
	form1.submit();
}