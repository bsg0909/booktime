<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage/userInfo.css">
<%@include file="../../inc/top.jsp" %>  
<%@include file="../includeMy.jsp" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$('.form-check-input').prop('indeterminate', true);
	
	function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                
                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("newaddress").value = roadAddr;
                document.getElementById("parseladdress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'none';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open()
	}
	
	function btnId(){ //아이디 중복확인
		var userid=frm1.userid.value;
		window.open("<c:url value='/user/chkId.do?userid="+userid+"'/>","",
			"width=500px, height=200px, scrollbars=yes, resizable=yes");
	}
	
	$(document).ready(function(){
		$("#email3").hide();
		
		$("#email2").change(function(){
			if($("#email2").val()=='etc'){
				$("#email3").show();
			}else{
				$("#email3").hide();
			}
		});
		
		var y="Y";
		
		var addressError=document.getElementById("addressError");
		
		$(".submit").click(function(event){
			if($("#parseladdress").val().length<1){
				addressError.innerHTML='지번주소 입력시 [더보기]란을 클릭해 선택해주십시오.';
				addressError.style.display ='block';
			}
		});
	});
	
	
</script>

<form name="frm" method="post" action="<c:url value=''/>">
	<div class="info">
		<p id="all">개인정보 수정</p>
		<p id="sub"><img src="<c:url value='/resources/images/icons/arrow.png'/>">
		고객님의 주소와 연락처 등 개인정보를 수정할 수 있습니다.</p>
		<p id="sub"><img src="<c:url value='/resources/images/icons/arrow.png'/>">
		이메일은 한번 더 확인하시어,  다양한 이벤트정보를 제공해 드리는 SMS, 메일서비스 혜택을 받으시기 바랍니다.</p>
		<hr><hr>
		<div id="editform">
			<p class="p1">나의 정보 관리</p>
			<fieldset id="userid">
				<label>아이디</label>
				<input type="text" readonly="readonly" value="nohyelin96">
			</fieldset>
			
			<fieldset id="name">
				<label>성명</label>
				<input type="text" readonly="readonly" value="노혜린">
			</fieldset>
			
			<fieldset id="birth">
				<label>생년월일</label>
				<input type="text" readonly="readonly" vlaue="1996-04-10">
			</fieldset>
			
			<fieldset id="gender">
				<label>성별</label>
				<input type="text" value="여성" required>
			</fieldset>
			
			<fieldset>
				<label>전화번호</label>
				<select name="hp1" id="h1" class="" required>
			    	<option selected>010</option>
			        <option>011</option>
			    </select> - 
			    <input name="hp2" type="text" class="" id="h2" required> - 
			    <input name="hp3" type="text" class="" id="h3" required>
			</fieldset>
			
			<fieldset id="address">
				<label>주소</label>
				<input name="zipcode" type="text" class="" id="zipcode" required>
		      	<button type="button" class="btn" onclick="sample4_execDaumPostcode()">우편번호 찾기</button><br>
		      	
		      	<input name="newaddress" type="text" class="" id="newaddress" required><br>
		      	
		      	<input name="parseladdress" type="text" class="" id="parseladdress" required>
		      	<span id="addressError" style="color:red;font-size: 0.8em;"></span>
		      	<span id="guide" style="color:#999;display:none"></span><br>
		      	
		      	<input name="addressdetail" type="text" class="" id="addressdetail" required>
		      <input type="text" id="extraAddress" style="display: none;">
			</fieldset>
			
			<fieldset id="email">
				<label>E-mail</label>
				<input type="text" name="email1" id="email1" required value="nohyelin96"> @
				<select name="email2" id="email2" required >
		        	<option value="">선택하세요</option>
		        	<option value="naver.com">naver.com</option>
		        	<option value="etc">직접입력</option>
      			</select>
      			<input name="email3" type="text" id="email3">
			</fieldset>
			<fieldset>
				<label><img src="<c:url value='/resources/images/icons/check.png'/>">비밀번호 확인</label>
				<input type="password" name="pwd" id="pwd">
			</fieldset>
			<button type="submit" id="btn1">나의정보 수정</button>
		</div>
		
		<div id="pwdChk">
			<p id="p2">비밀번호 수정</p>
			<fieldset id="editPWD1">
				<label><img src="<c:url value='/resources/images/icons/check.png'/>">기존 비밀번호</label>
				<input type="password" id="originPwd">
			</fieldset>
			
			<fieldset id="editPWD2">
				<label><img src="<c:url value='/resources/images/icons/check.png'/>">새 비밀번호</label>
				<input type="password" id="newPwd">
			</fieldset>
			
			<fieldset id="editPWD3">
				<label><img src="<c:url value='/resources/images/icons/check.png'/>">새 비밀번호 확인</label>
				<input type="password" id="newPwdOk">
			</fieldset>
			<fieldset id="causion">
				<p id="sub"><strong>주의하세요!</strong>
			아이디와 같은 비밀번호나 주민등록번호, 생일, 학번, 전화번호 등 개인정보와 관련된 숫자나 연속된 숫자,
			통일 반복된 숫자 등 다른 사람이 쉽게 알아 낼 수 있는 비밀번호는 사용하지 않도록 주의하여 주시기 바랍니다.</p>
			</fieldset>
			<button type="submit" id="btn2">비밀번호 변경</button>
		</div>
	</div>
</form>

<%@include file="../../inc/bottom.jsp" %>