<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	

<style type="text/css">
*,
*:before,
*:after {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

.container {
    width: 85vw;
    margin: 1rem auto;
}

.bg,
.overlay {
    text-align: center;
}

img,
.overlay {
    transition: .3s all;
    border-radius: 3px;
}

.bg {
    float: left;
    max-width: 100%;
    position: relative;
    margin: .5%;
}

.bg img {
    width: 100%;
    margin-bottom: -4px;
}

.bg .overlay {
    position: absolute;
    top: 0;
    left: 0;
    bottom: 0;
    width: 100%;
    background: rgba(0, 0, 0, 0.2);
    color: #fff;
    opacity: 0;
}

.bg .overlay h2 {
    padding-top: 20%;
    font-family: 'Droid Serif', serif;
}

.bg .overlay p {
    font-family: 'Julius Sans One', sans-serif;
}

.bg:hover .overlay {
    opacity: 1;
}

.bg:hover img {
    -webkit-filter: blur(2px);
    filter: blur(2px);
}

@media screen and (max-width: 1148px) {
    .bg {
        max-width: 48%;
        margin: 1%;
    }
}

@media screen and (max-width: 768px) {
    .bg {
        float: none;
        max-width: 80%;
        margin: 1% auto;
    }
}
</style>

<c:forEach var="list" items="${list2 }">

<div class="col-lg-3 col-sm-6 portfolio-item">
        <div class="card">
<div class="bg">
	          <a href='<c:url value="/book/bookDetail.do?ItemId=${list.isbn}"/>'>
	          <img class="card-img-top" src="${list.cover}" alt="bookcover"></a>
	<!-- 오버레이 애니메이션 링크 추가하기 -->
	<div class="overlay">
		<br><br>
      <h4>${list.managerId}의 추천</h4>
      <br>
      <p>책 제목을 누르면 더 자세한 책 정보를 볼 수 있습니다</p>
    </div>
</div>
        	<div class="card-body" style="height:100px">
	            <p class="card-title">
	              <a href='<c:url value="/book/bookDetail.do?ItemId=${list.isbn}"/>'>
	              	              <!-- 제목이 긴 경우 일부만 보여주기-->
							<c:if test="${fn:length(list.bookName)>25}">
								${fn:substring(list.bookName, 0,25)}...
							</c:if>
							<c:if test="${fn:length(list.bookName)<=25}">
								${list.bookName }
							</c:if>	
	              </a>
	            </p>
	           <!-- 
	            <p class="card-text">
	           ${list.writer}
					지음 | ${list.publisher} <br>
					<fmt:formatNumber value="${list.price}" />
					원
	            </p>
	           -->   
	         </div>
        </div>
      </div>

</c:forEach>