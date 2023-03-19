<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<title>로그인</title>
</head>
<body>
	
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/user/include/header.jsp"/>
		
		<section class="login-box d-flex justify-content-center">
			<div class="col-10 mt-3">
				<input type="text" placeholder="아이디" class="form-control mt-4" id="loginIdInput">
				<input type="password" placeholder="비밀번호" class="form-control mt-3" id="passwordInput">
				<div class="d-flex justify-content-between">
					<a id="signupBtn" class="btn mt-3" href="/user/signup/view">회원가입</a>
					<button type="button" class="btn mt-3" id="loginBtn">로그인</button>
				</div>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/user/include/footer.jsp"/>
	</div>

	<script>
		$(document).ready(function(){
			
			$("#loginBtn").on("click", function(){
				let loginId = $("#loginIdInput").val();
				let password = $("#passwordInput").val();
				
				if(loginId == "") {
					alert("아이디를 입력해주세요");
					return;
				}
				
				if(password == "") {
					alert("비밀번호를 입력해주세요");
					return;
				}
				
				$.ajax({
					type:"post"
					, url:"/user/signin"
					, data:{"loginId":loginId, "password":password}
					, success:function(data){
						if(data.result) {
							alert("로그인 성공")
						} else if(!data.idResult) {
							alert("일치하는 아이디가 없습니다\n아이디를 확인해주세요");
						} else if(data.idResult) {
							alert("비밀번호가 틀렸습니다\n비밀번호를 확인해주세요")
						} else {
							alert("로그인 실패");
						}
						
					}
					, error:function(){
						alert("로그인 에러");
					}
					
				});
				
			});
		});
	</script>
</body>
</html>