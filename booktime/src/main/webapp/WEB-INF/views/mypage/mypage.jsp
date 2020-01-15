<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css">
<meta charset="UTF-8">
<%@include file="../inc/top.jsp" %>   
  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Welcome
      <small style="color: rgb(0 153 174)"> ${sessionScope.userid }!</small>
    </h1>

    <!-- Content Row -->
    <div class="row">
	 <!-- Sidebar -->
	  <div class="col-lg-3 mb-4">
		<div class="list-group">
			<a id="a1" class="list-group-item list-group-item-action active">주문내역</a>
			<a href="#" class="list-group-item list-group-item-action">주문 조회/변경/취소</a>
			<a href="#" class="list-group-item list-group-item-action">ebook구매 목록</a>
			<a href="#" class="list-group-item list-group-item-action">반품/교환 내역</a>
			  
			<a id="a2" class="list-group-item list-group-item-action active">나의 포인트</a>
			<a href="#" class="list-group-item list-group-item-action">할인쿠폰</a>
			<a href="#" class="list-group-item list-group-item-action">무료배송 쿠폰</a>
			<a href="#" class="list-group-item list-group-item-action">마일리지</a>
			  
			<a id="a3" class="list-group-item list-group-item-action active">관심상품</a>
			<a href="#" class="list-group-item list-group-item-action">WISH LIST</a>
			<a href="#" class="list-group-item list-group-item-action">장바구니</a>
			<a href="#" class="list-group-item list-group-item-action">오늘 본 도서</a>
			  
			<a id="a4" class="list-group-item list-group-item-action active">회원정보</a>
			<a href="#" class="list-group-item list-group-item-action">나의 회원등급</a>
			<a href="#" class="list-group-item list-group-item-action">회원정보 수정/조회</a>
			<a href="#" class="list-group-item list-group-item-action">회원탈퇴</a>
		</div>
	  </div>
	  <!-- 주문내역 (가장 최근 5개)-->
	  <div id="newOrder">
	    <p>최근 주문내역</p>
	    <img alt="쇼핑백 이미지" src="<c:url value='/resources/images/icons/shopBag.png'/>">
	    <button>구경하러 가기</button>
	  </div>
	  <!-- 위시리스트(가장 최근 5개) -->
	  <div id="mywish">
	    <p><img alt="하트 이미지" src="<c:url value='/resources/images/icons/heart.png'/>">MY WISH</p>
	     <img class="box" alt="박스 이미지" src="<c:url value='/resources/images/icons/box.png'/>">
	  </div>
   </div>
<%@include file="../inc/bottom.jsp" %>