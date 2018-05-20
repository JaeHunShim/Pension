<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/reservation/style.css" />
<!-- <script src="/resources/js/reservation/script.js"></script> -->
<script>

	
	var date = new Date();
	var toY = date.getFullYear(); //현재 년도 가져오기
	var toM = date.getMonth(); //현재 달가지고오기
	var toD = date.getDate(); //현재 날짜 가지고오기 	
	var lastArr =[31,28,31,30,31,30,31,31,30,31,30,31]; // 월마다 마지막 일자
	
	var y;
	var m;
	var d;

/* 이제 달력 만드는 곳*/
function getCalendar(m,y,x){
	
	var currentDate = new Date(y,m,x); // 현재 년, 현재 달의  1일의 요일을 구함
	console.log("y와 m을 받아와서 현재 시간뽑기"+ currentDate);
	console.log('m과 y의 값:' + m,y);
	var theWeek = currentDate.getDay(); // 월화수목금토일 구하기 (1,2,3,4,5,6,7로 출력됨)
	
	if(y%4 && y%100 !=0 || y%400 ==0){ //윤년계산
		var lastDate =lastArr[1]=29;
	}else{
		var lastDate = lastArr[1]=28;
	}
	var lastDate= lastArr[m]; //현재 월의 마지막 일
	    
	var row = Math.ceil((theWeek+lastDate)/7); //달력에 필요한 행의 갯수 
	
	var calendar ="";

	var dNum =1; //달력에 표기되는 일 초기값 
	for(var i =1; i<=row; i++){ // 행만들기
		calendar +="<tr>";
		for(var k=1;k<=7; k++){ //열만들기
			//월 1일 이전과 월 마지막일 이휴는 모두 빈칸처리 
			if(i===1 && k <= theWeek || dNum>lastDate){
				calendar += "<td>&nbsp;</td>";
			}else{
				calendar +="<td class='schedule'>"
					+"<stong class ='date'>" +dNum+"</strong>"
					+"<ul class='schedule RW'>"
					+"<li class='close'><a href='#' class='modal'>+우앙+</a></li>"
					+"<li class='open'><a href='#' class='modal'>+우앙+</a></li>"
					+"<li class='close'><a href='#' class='modal'>+우앙+</a></li>"
					+"</ul>"
					+"</td>";
				dNum++;
			
			}		
				
		}
			calendar +="</tr>";
	}
	$("#calendarBody").append(calendar);
}
$(document).ready(function(){
	/* $("#calendarBody").append(calendar); */
		var m = toM;
		var y = toY;
		var x= 1;
		getCalendar(m,y,x);
		var da = "<span id='y'>&nbsp;"+y+"</span><span>년</span><span id='m'>"+(m+1)+"</span><span>월</span>&nbsp;";
	$('#prev').append(da);
	
	//전 개월로 가는 부분 
	$('#prev').on('click',function(){
		$("#calendarBody").empty();
		var cm =$('#m').text();
		var cy =$('#y').text();
		
		m= cm-2;
		y = cy;
		x=1;
		$('#m').text(m+1);
		$('#y').text(y);
		getCalendar(m,y,x);
	});
});

</script>
<title>예약현황</title>
</head>
<body>

<div id="calendar">
	<p class="title">
		<a id="prev" style="cursor:pointer;"><img src="/resources/img/reservation/b_prev.gif" alt="이전" /></a>
		<!-- &nbsp;<span id="y">y년</span> <span id="m">d월</span>&nbsp; -->
		<a id="next" style="cursor:pointer;"><img src="/resources/img/reservation/b_next.gif" alt="다음" /></a>
	</p>
	<table>
		<col class="col01"></col>
		<col class="col02"></col>
		<col class="col03"></col>
		<col class="col04"></col>
		<col class="col05"></col>
		<col class="col06"></col>
		<col class="col07"></col>
		<tr>
			<td class="section red">일요일</td>
			<td class="section">월요일</td>
			<td class="section">화요일</td>
			<td class="section">수요일</td>
			<td class="section">목요일</td>
			<td class="section">금요일</td>
			<td class="section">토요일</td>
		</tr>
		<tbody id="calendarBody">
		
		</tbody>
	</table>
	<p class="explain">달력에서 원하는 일자를 클릭한 후 예약접수 및 예약확인/취소를 할 수 있습니다</p>
	<?php if($is_admin){ ?>
	<p class="button">
		<a href="<?php echo $g4['bbs_path']; ?>/board.php?bo_table=<?php echo $bo_table; ?>&type=true" onfocus="this.blur();"><img src="/resources/img/reservation/b_list.gif" alt="목록보기" /></a>
	</p>
	<?php } ?>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>