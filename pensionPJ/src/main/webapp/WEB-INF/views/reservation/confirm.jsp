<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<script src="/resources/js/basic/jQuery-2.1.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/reservation/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
//가격에 콤마찍는 함수 
function numberWithCommas(x) {
	$('#info').children('td').each(function(){
		var x = $(this).text();
		var y = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$(this).text(y);

	});
}
//예약 번호 생성하는 함수 
function reserNoCreate(fullDate,room_name){
	var reserNo = $('input[name="reserNo"]').val();
	var room_name =$('input[name="room_name"]').val();
	$('input[name="reserNo"]').val();
	//-문자열 없애기
	var result=reserNo.replace(/-/g,'');

	console.log(result);
	if(room_name =="데이지(복층)"){
		$('input[name="reserNo"]').val(result+"1");
	}else if(room_name =="릴리(복층)"){
		$('input[name="reserNo"]').val(result+"2");
	}else if(room_name =="아이비"){
		$('input[name="reserNo"]').val(result+"3");
	}else{
		$('input[name="reserNo"]').val(result+"4");
	}
}
$(document).ready(function(){
	//reserNo생성하는 부분
	var fulldate = $('input[name="fullDate"]').val();
	var room_name =$('input[name="room_name"]').val();
	reserNoCreate(fulldate,room_name);
	
	//콤마찍는 부분
	$('#info').children('td').each(function(){
		var x = $(this).text();
		numberWithCommas(x)
		return x;
	});
	//form 처리 하는 부분 
	$('.btn').on('click',function(){
		var prm = document.prm;
		$('#prm').attr('action','/reservation/lastInsert');
		prm.submit();
		// iframe 나가고 controller처리
		window.top.location.href = "/reservation/reservation_main";
	});
	var full = $('input[name="fullDate"]').val();
	console.log(typeof(full));

});
</script>
</head>
<body>
<div class="header wRap">
   <h1>J.P펜션</h1>
   <div class="Right">
     <a href="/reservation/reservation_main"><img src="/resources/img/reservation/top1on.gif" alt="예약하기"></a> <!-- //이미지파일이름...on.gif -->
     <a href="/reservation/reservation_guide"><img src="/resources/img/reservation/top2.gif" alt="예약안내"></a> <!-- /pen/img/top2on.gif -->
     <a href="/reservation/confirm"><img src="/resources/img/reservation/top3.gif" alt="예약확인"></a> <!-- /pen/img/top3on.gif -->
   </div>
</div>
<!-- Sub Title -->
<div class="sTitle wRap">
	<div class="Left">
		<em>Reservation</em>
		<h2>예약확인</h2>
	</div>
	<div class="tab1 Right">
		<ol>
			<li>일자선택</li>
			<li>객실선택</li>
			<li><img src="/resources/img/reservation/proc1_03.gif" alt="정보입력"></li>
			<li>예약완료</li>
		</ol>
	</div>
</div>
<!-- //Sub Title -->
<form name="prm" id="prm" method="post">
	<input type="hidden" name="reser_select" value="${reserVO.reser_select}">
	<input type="hidden" name="fullDate" value="<fmt:formatDate value="${reserVO.r_fullDate}" pattern="yyyy-MM-dd" />">
	<input type="hidden" name="lastFullDate" value="<fmt:formatDate value="${reserVO.r_lastFullDate}" pattern="yyyy-MM-dd" />">
	<input type="hidden" name="total_pay" value="${reserVO.total_pay}">
	<input type="hidden" name="room_name" value="${reserVO.room_name}">
	<input type="hidden" name="inwon_check" value="${reserVO.inwon_check}">
	<input type="hidden" name="user_id" value="${login.user_id}">
	<input type="hidden" name="entance_time" value="${reserVO.entance_time}">
	<input type="hidden" name="user_name" value="${login.user_name}">
	<input type="hidden" name ="reserNo" value="<fmt:formatDate value="${reserVO.r_fullDate}" pattern="yyyy-M-d"/>">
	<input type='hidden' name="reser_select" value="${reserVO.reser_select }">
<!-- Contents -->   
	<div class="conT">
		<h3>예약정보입력</h3>
		<table border="0" cellpadding="0" cellspacing="1" class="wideT sortL">
			<caption>예약정보 확인 및 입력</caption>
			<tr>
				<th width="20%" scope="row">숙박기간</th>
				<td>
					<fmt:formatDate value="${reserVO.r_fullDate}" pattern="yyyy-MM-dd" />~
					<fmt:formatDate value="${reserVO.r_lastFullDate}" pattern="yyyy-MM-dd" />
				</td>
			</tr>
			<tr id="info">
				<th scope="row">결제금액</th>
				<td class="red"><strong><em>￦${reserVO.total_pay}</em></strong></td>
			</tr>
			<tr>
				<th scope="row">객실명</th>
				<td>${reserVO.room_name}</td>
			</tr>
			<tr>
				<th scope="row">객실 인원</th>
				<td>${reserVO.inwon_check}명</td>
			</tr>
			<tr>
				<th scope="row">id</th>
				<td>${login.user_id}</td>
			</tr>
			<tr>
				<th scope="row">휴대폰</th>
				<td>${login.user_phone}</td>
			</tr>
			<tr>
				<th scope="row">이메일</th>
				<td>${login.user_email}</td>
			</tr>
			<tr>
				<th scope="row">입실예정시간</th>
				<td>${reserVO.entance_time}</td>
			</tr>
			<tr>
				<th scope="row">전달사항</th>
				<td><textarea rows="3" name="reser_content" readonly>${reserVO.reser_content}</textarea></td>
			</tr>
			<tr>
				<th scope="row">결제수단</th>
				<td><input type="text" name="payment" value="무동장입급"></td>
			</tr>
			<tr>
				<th scope="row">입금하실은행</th>
				<td>농협 203027-51-050385 염인선</td>
			</tr>
			<tr>
				<th scope="row">입금자명</th>
				<td>${login.user_name}</td>
			</tr>
		</table>
	</div>
    
<p class="btn"><input type="image" src="/resources/img/reservation/btn.png" alt="예약하기">&nbsp; 
<img src="/resources/img/reservation/bt_pre.gif" alt="이전단계" onclick="backPage();" style="cursor:pointer"></p>
  <!-- //객실예약 -->
</form>
<!-- //Contents --> 
  
</body>
</html>