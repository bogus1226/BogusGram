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
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<title>회원가입</title>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/user/include/header.jsp"/>
		<section class="join-box d-flex justify-content-center">
			<div class="col-10 mt-3">
				<input type="text" placeholder="아이디" class="form-control mt-4">
				<button type="button" class="btn btn-block mt-2"><b>중복확인</b></button>
				<input type="text" placeholder="성명" class="form-control mt-3">
				<input type="text" placeholder="닉네임" class="form-control mt-3">
				<input type="text" placeholder="비밀번호" class="form-control mt-3">
				<input type="text" placeholder="비밀번호 확인" class="form-control mt-3">
				<button type="button" class="btn btn-block mt-3"><b>가입하기</b></button>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/user/include/footer.jsp"/>
	</div>

</body>
</html>