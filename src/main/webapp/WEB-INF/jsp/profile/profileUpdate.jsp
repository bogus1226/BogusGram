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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	<link rel="stylesheet" href="/static/css/postStyle.css" type="text/css">
<title>프로필 수정</title>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/post/include/header.jsp"/>
		<div id="profileUpdateBox" class="d-flex justify-content-center">
			<div class="col-10">
				<input type="text" class="form-control mt-4" placeholder="이름" value="${userInfo.name}">
				<input type="text" class="form-control mt-2" placeholder="닉네임" value="${userInfo.nick_name}">
				<i id="imageIcon" class="bi bi-card-image image-icon-size ml-2"></i>
				<input id="fileInput" type="file" class="ml-2 mt-1 d-none">
				<div class="updateClickBtn d-flex justify-content-between">
					<a type="button" class="btn commentBtn" href="/profile/view?userId=${userInfo.id}">취소</a>
					<button type="button" class="btn commentBtn">확인</button>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
	$(document).ready(function(){
		$("#imageIcon").on("click", function(){
			$("#fileInput").click();
		});	
		
	});
</script>
</html>