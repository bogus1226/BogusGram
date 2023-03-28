<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">	
	<link rel="stylesheet" href="/static/css/profileStyle.css" type="text/css">
<title>프로필</title>
</head>
<body>	

	<div id="wrap">
		<header class="d-flex justify-content-between align-items-end">
			<div class="nickName"><b>bogus</b></div>
			<div class="logo">
				<a href="/post/mainpage/view"><b>BogusGram</b></a>
			</div>
		</header>
		<div class="userInfoBox d-flex mt-1	">
			<div class="profileImageBox">
				<div class="profileImage border"></div>
			</div>
			<div class="buttonBox">
				<button type="button" class="btn btn-block btn-sm"><b>프로필 편집</b></button>
				<button type="button" class="btn btn-block btn-sm"><b>숨긴 목록</b></button>
			</div>
			<div class="countBox d-flex justify-content-center text-center">
				<div class="postInfoBox">
					<h5><b>게시물</b></h5>
					<h5><b>0</b></h5>
				</div>
				<div class="followerInfoBox">
					<h5><b>팔로워</b></h5>
					<h5><b>0</b></h5>
				</div>
				<div class="followingInfoBox">
					<h5><b>팔로잉</b></h5>
					<h5><b>0</b></h5>
				</div>
			</div>
		</div>
		<section class="main-contents bg-success"></section>
	</div>
</body>
</html>