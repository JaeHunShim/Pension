<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../include/header.jsp" %>
<section class="sub_con sub02" id="scene1">

<div class="title">
        <h2>community</h2>
        <h3>질문과답변</h3>
        <h4>무창포 J.P펜션의 바다의 향기를 느껴보세요. </h4>
        <p class="tit_line"></p>
    </div>
    <div class="sub_txt box">
		<script src='/resources/js/writeJs/HuskyEZCreator.js' charset='utf-8'></script>
		<script src='/resources/js/question/common2.js'></script>
		<script src='/resources/js/question/board.js'></script>
		<script src='/resources/js/question/ajax.js'></script>
		<link rel='stylesheet' href='/resources/css/question/default.css'/>
		
	<!-- <form name="del_f" method="post" action="/question/password" onSubmit="return chkBoardDeleteForm(this);"> -->
	<!-- <form action="/question/read" method="post"> -->
	<form action="/question/readPage" method="get">	
<div class="zz_new_delete">
	<ul class="zz_new_delete_inp">
    	<li>
        	            비밀번호
                    </li>
        <li><input type="password" name="password"></li>
        <li><input type="text" name="qno"value="${qno}"></li>
        <li><input type="text" name="page" value="${cri.page}"></li>
        <li><input type="text" name="perPageNum" value="${cri.perPageNum}"></li>
    
    </ul>
    
    <ul class="zz_new_delete_but">
    	<li><input type="image" name="submit" border="0" class="auth_ok"></li>
        <li><a href="javascript:history.go('-1')" class="cancle">취소</a></li>
    </ul>
</div>

</form>
<!-- 비밀번호 입력 폼 -->
 

    </div>	

</section>    
<%@ include file="../include/footer.jsp" %>