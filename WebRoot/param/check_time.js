<script language="javascript">
function check_time_format(targetDate){
	if(targetDate!=""){
			var Datereg=/^\d{4}\d{2}\d{2}$/;
		  if((!targetDate.match(Datereg))){
		     alert("Ĭ�����ڵĸ�ʽ����ȷ��\t\n\nĬ�Ͽɽ��ܸ�ʽΪ:\n1������������������(����20060101) \n2��(��)");
		     return false;
			}
	}
	var thisYear=parseInt(targetDate.substring(0,4));
	if(thisYear<2000 || thisYear>2099){
			alert("�������ݴ���!");
			return false;
			}
			
	if(targetDate.charAt(6)=='0'){
		var thisDay=parseInt(targetDate.substring(7,8));
	}else{
		var thisDay=parseInt(targetDate.substring(6,8));
	}
	
	if(targetDate.charAt(4)=='0'){
		var thisMonth=parseInt(targetDate.substring(5,6))-1;
	}else{
		var thisMonth=parseInt(targetDate.substring(4,6))-1;
	}
	if(thisMonth<0 || thisMonth>11){
			alert("������·ݴ���!");
			return false;
			}
	var nextMonth=thisMonth+1;
	var oneDay = 1000 * 60 * 60 * 24;
	var thisMonth2 = new Date(thisYear, thisMonth, 1);
	var nextMonth2 = new Date(thisYear,nextMonth, 1);

	var len = Math.ceil((nextMonth2.getTime() - thisMonth2.getTime())/oneDay);

			if(thisDay==0 || thisDay>len){
			alert("��������ڴ���!");
			return false;
			}

	return true;
}
function button_submit2(){
			var targetDate=form1.start_date.value;
			if(!check_time_format(targetDate)){
				return;
			}
		form1.submit();
}
</script>