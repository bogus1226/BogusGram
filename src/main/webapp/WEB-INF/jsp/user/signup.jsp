<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>	
	<link rel="stylesheet" href="/static/css/userStyle.css" type="text/css">
<title>회원가입</title>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/user/include/header.jsp"/>
		<section class="join-box d-flex justify-content-center">
			<div class="col-10 mt-3">
				<input type="text" placeholder="아이디" class="form-control mt-4" id="loginIdInput">
				<button type="button" class="btn btn-block mt-2" id="isDuplicateBtn">중복확인</button>
				<input type="text" placeholder="성명" class="form-control mt-3" id="nameInput">
				<input type="text" placeholder="닉네임" class="form-control mt-3" id="nicknameInput">
				<input type="password" placeholder="비밀번호" class="form-control mt-3" id="passwordInput">
				<input type="password" placeholder="비밀번호 확인" class="form-control mt-3" id="passwordConfirmInput">
				<button type="button" id="joinBtn" class="btn btn-block mt-3">가입하기</button>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/user/include/footer.jsp"/>
	</div>

	<script>
		$(document).ready(function(){
				
			$("#isDuplicateBtn").on("click", function(){
				let loginId = $("#loginIdInput").val();
				
				if(loginId == "") {
					alert("아이디를 입력해주세요");
					return;
				}
				
				$.ajax({
					type:"get"
					, url:"/user/isDuplicate"
					, data:{"loginId":loginId}
					, success:function(data){
						if(data.is_duplicate) {
							alert("중복된 아이디가 있습니다");
						} else {
							alert("사용가능한 아이디입니다");
						}
					}
					, error:function(){
						alert("중복확인 에러");
					}
					
				});
			});

			$("#joinBtn").on("click", function(){
				let loginId = $("#loginIdInput").val();
				let name = $("#nameInput").val();
				let nickname = $("#nicknameInput").val();
				let password = $("#passwordInput").val();
				let passwordConfirm = $("#passwordConfirmInput").val();
				
				if(loginId == "") {
					alert("아이디를 입력해주세요");
					return;
				}
				
				if(name == "") {
					alert("성명을 입력해주세요");
					return;
				}
				
				if(nickname == "") {
					alert("닉네임을 입력해주세요");
					return;
				}
				
				if(password == "") {
					alert("비밀번호를 입력해주세요");
					return;
				}
				
				if(passwordConfirm == "") {
					alert("비밀번호 확인을 입력해주세요");
					return;
				}
				
				if(password != passwordConfirm) {
					alert("비밀번호가 일치하지 않습니다")
					return;
				}
				
				$.ajax({
					type:"get"
					, url:"/user/isDuplicate"
					, data:{"loginId":loginId}
					, success:function(data){
						if(data.is_duplicate) {
							alert("중복된 아이디가 있습니다");	
						} else {
							$.ajax({
								type:"post"
								, url:"/user/signinup"
								, data:{"loginId":loginId, "name":name, "nickname":nickname, "password":password}
								, success:function(data){
									if(data.result == "success") {
										location.href = "/user/signin/view";	
									} else {
										alert("회원가입 실패");
									}
								}
								, error:function(){
									alert("회원가입 에러");
								}
							});
						}
					}
					, error:function(){
						alert("아이디 자동중복확인 에러");
					}
					
				});
				
				
			});
			
		});
	</script>
</body>
</html>