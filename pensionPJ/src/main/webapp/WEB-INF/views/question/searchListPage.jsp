<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script>
	var result='${msg}';
	
	if(result='success'){
		alert('입력이 정사적으로 처리 되었습니다.');
	}
	//select버튼 값 유지하기 
	function perPageNum(){
		var p = '${pageMaker.cri.perPageNum}'
		$('select[name="change_perPage"]').val(p).prop("selected",true);
	}
</script>
<script>
	//검색했을때 page를 다시 1로 돌려여 하기때문에 makeQuery의 page에 1을 대입시켜놓음  
	$(document).ready(function(){
		$('#shim').on('click',function(){
			self.location="/question/searchListPage"
			+ '${pageMaker.makeQuery(1)}'
			+ "&searchType="
			+ $('select[name="searchType"]').val()
			+ "&keyword=" +encodeURIComponent($('#keywordInput').val());
		});
		//prePageNum변경하기 
		$('select[name="change_perPage"]').on("change",function(){
			var change =$(this).val()
			self.location ="/question/searchListPage?"
				+ 'page=1&'
				+ 'perPageNum='+change+''
				+ "&searchType="
				+ $('select[name="searchType"]').val()
				+ "&keyword=" +encodeURIComponent($('#keywordInput').val());
		});
	perPageNum();
	});
</script>
<section class="sub_con sub02" id="scene1">

<div class="title">
        <h2>community</h2>
        <h3>질문과답변</h3>
        <h4>무창포 J.P펜션의 바다의 향기를 느껴보세요. </h4>
        <p class="tit_line"></p>
    </div>
    <div class="sub_txt box"><script language="javascript" src="/resources/js/module/ajax.js"></script>
<script src="/resources/js/module/common2.js"></script>
<script src="/resources/js/module/board.js"></script>
<link rel="stylesheet" href="/resources/css/question/default.css"/>	
<div class="zz_new_list">
<!-- <form name="search" method="get" action="/question/searchListPage"> -->
<%-- <input type="hidden" name="page" value="${cri.page}">
	<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
	<input type="hidden" name="searchType" value="${cri.searchType}">
	<input type="hidden" name="keyword" value="${cri.keyword}"> --%>
	<input type="hidden" name ="replycnt" id= 'replycnt' value="${questionVO.replycnt }">
	<input type="hidden" name= "page" id="page" value="${pageMaker.cri.page}">
	<input type="hidden" name="perPageNum" id="perPageNum" value="${pageMaker.cri.perPageNum}">
	<div class="zz_new_list_header">
    	<ul class="zz_search_box">
    		<li>
    			<select name="change_perPage" id="change_perPage">
    				<option value="10">10개씩보기</option>
    				<option value="20">20개씩보기</option>
    				<option value="30">30개씩보기</option>
    			</select>
    		</li>
        	<li>
            	<select name="searchType">
                    <option value="n"
                    	<c:out value ="${cri.searchType == null?'selected':''}"/>>---
                    </option>
                    <option value="t"
                    	<c:out value ="${cri.searchType eq 't'?'selected':''}"/>>제목
                    </option>
                    <option value="c"
                    	<c:out value ="${cri.searchType eq 'c'?'selected':''}"/>>내용
                     </option>
                    <option value="w"
                    	<c:out value ="${cri.searchType eq 'w'?'selected':''}"/>>작성자
                    </option>
                    <option value="tc"
                    	<c:out value ="${cri.searchType eq 'tc'?'selected':''}"/>>제목 또는 내용
                     </option>
                    <option value="cw"
                    	<c:out value ="${cri.searchType eq 'cw'?'selected':''}"/>>내용 또는 작성자
                    </option>
                    <option value="tcw"
                    	<c:out value ="${cri.searchType eq 'tcw'?'selected':''}"/>>모든조건
                    </option>
                </select>
            </li>
            <!-- <li><input type="text" name="sword" id="textfield"></li> -->
            <li><input type="text" name="keyword" id="keywordInput" value="${cri.keyword}"></li>
            <li><img src="/resources/img/question/search.gif" id="shim" style="cursor:pointer"></a></li>
        </ul>
    </div>
<!-- </form> -->
    <div class="zz_new_list contenter">
    	<table border="0" cellspacing="0" cellpadding="0" width="100%" class="zz_new_d table">
          <tr>
            <th scope="col" width="60">번호</th>
            <th scope="col">제목</th>
            <th scope="col" width="100">답변여부</th>
            <th scope="col" width="100">작성자</th>
            <th scope="col" width="100">작성일</th>
            <th scope="col" width="100">조회수</th>
          </tr>
          <c:forEach items="${list}" var="questionVO">
          <tr>
            <td>${questionVO.qno}</td>
            <!-- uri에 페이지 정보를 유지할수 있도록 함  -->
            <td>
            <c:choose>
            <c:when test="${questionVO.secret=='y'}">
            <a href="/question/passwordCheck${pageMaker.makeSearchQuery(pageMaker.cri.page)}&qno=${questionVO.qno}">${questionVO.title}</a>
            </c:when>
            <c:otherwise>
            <a href="/question/readPage${pageMaker.makeSearchQuery(pageMaker.cri.page)}&qno=${questionVO.qno}">${questionVO.title}</a>
            </c:otherwise>
            </c:choose>
            <strong>[${questionVO.replycnt}]</strong>
            <!-- 비밀글에 대한 처리 시작 -->
            <c:if test="${questionVO.secret =='y'}">
            <font color='red'><img src='/resources/img/question/icon_secret.gif' border='0' align='absmiddle'></font>
            </c:if>
            <!-- 비밀글 처리 끝  -->
            </td>
          	<!-- 댓글이 달리면 답변완료 활성화 시킴 -->
					<td>
						<c:if test="${questionVO.replycnt ne 0 }">
							<p class='flag_but1'>답변완료</p>
						</c:if>
						<c:if test ="${questionVO.replycnt eq 0 }">
							<p class='flag_but'>대기중</p>
						</c:if>			
					</td>
            <td>${questionVO.user_id}</td>
            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${questionVO.regdate}"/></td>
            <td>${questionVO.viewcnt}</td>
           </tr>
         </c:forEach>
        
    </table>
    </div>
    <div class="zz_new_list bottom">
        <div class="zz_new_list pageing">

				 <table cellpadding="0" cellspacing="0" border="0" align="center">
                <tr>
                    <td>
                    	<c:if test="${pageMaker.prev}">
                    		<a href ="/question/searchListPage${pageMaker.makeSearchQuery(pageMaker.startPage-1)}"><img src=/resources/img/question/prev.gif class='prev'></a>
                    	</c:if>
                    	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                     		<ul>
                     			<!-- href 매핑을 listPage에서 searchListPage로 바꿈  -->
                     			<li
                     				<c:out value="${pageMaker.cri.page == idx?'class=on':''}"/>>
                     				<a href="/question/searchListPage${pageMaker.makeSearchQuery(idx)}">${idx}</a>
                     			</li>
                     		</ul>
                     		</c:forEach>
                     		
                     	<c:if test="${pageMaker.next && pageMaker.endPage >0}">
                     		<a href="/question/searchListPage${pageMaker.makeSearchQuery(pageMaker.endPage+1)}"><img src=/resources/img/question/next.gif class='next'></a>
                     	</c:if>	
              		</td>
                </tr>
            </table>
            
                        
        </div>
        <div class="zz_new_list but"><a href='/question/register' class='write'>글쓰기</a></div>
    </div>
    
</div>
</div>	

</section>
<%@ include file="../include/footer.jsp" %>