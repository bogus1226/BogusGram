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
	<link rel="stylesheet" href="/static/css/postStyle.css" type="text/css">
<title>메인화면</title>
</head>
<body>
	<div id="wrap">
		<header class="d-flex">
			<div class="search pt-2">
				<div class="input-group col-8  p-0 mt-4">
					<input type="text" class="form-control" placeholder="사용자 검색">
					<div class="input-group-append">
						<button class="searchBtn btn" type="button"><img alt="돋보기모양 아이콘" width="20" src="/static/image/search.png"></button>
					</div>
				</div>
			</div>
			
			<div class="logo d-flex justify-content-center align-items-center">
				<a href="/post/mainpage/view"><b>BogusGram</b></a>
			</div>
			
			<div class="logInOut d-flex justify-content-end align-items-center pt-3">
				<a class="login" href="/user/signin/view">로그인/회원가입</a>
			</div>
		</header>
		
		<section class="main-contents d-flex">
			<nav class="navBtn">
				<a href="#" class="btn btn-sm col-3">Profile</a><br>
				<a href="#" class="btn btn-sm col-3 mt-2">Fallow</a><br>
				<a href="#" class="btn btn-sm col-3 mt-2">Comment</a>
			</nav>
			<section class="contents">
				<div class="postInputBox border border-warning">
					<textarea rows="3" placeholder="내용을 입력해주세요" class="form-control"></textarea>
					<div class="d-flex justify-content-between">	
						<div class="d-flex align-items-center">
							<img alt="사진기모양 아이콘" width="35" src="/static/image/photo.png" class="mt-1 ml-2">
							<div class="ml-1 mt-1 small text-secondary"><b>이미지 첨부(선택)</b></div>
						</div>
						<div class="d-flex align-items-center">
							<button type="button" class="uploadBtn btn btn-sm mr-2">upload</button>
						</div>
					</div>
				</div>
				
				<div class="postInfoBox">
					<div class="postInfoBoxHeader mt-3 d-flex align-items-center justify-content-between">
						<div class="nickname ml-2"><b>bogus</b></div>
						<button type="button" class="btn"><img height="23" alt="4개의선이있는 아이콘" src="/static/image/four_line.png"></button>
					</div>
					
					<div class="postInfo">
						<div class="postImageBox">
							<div class="postImage mb-1">
								<img alt="슬픈표정 아이콘" src="/static/image/notphoto.png">
							</div>
							<div class="d-flex justify-content-end align-items-center">
								<button type="button" class="btn btn-sm likeBtn"><img height="20" alt="하트 아이콘" src="/static/image/love.png"></button>
								<div class="mt-1 small"><b>11개</b></div>
							</div>
							<div class="postInfoContent">bogus 동그라미를 그려봤어요. 심심해요놀아주세요. 이러고 살아요.</div>
							<div class="comment">
								<div class="comment-header d-flex align-items-center justify-content-between">
									<div class="ml-2"><b>comment</b></div>
									<button type="button" class="commentSellectBtn btn btn-sm"><img height="20" alt="위쪽화살표 아이콘" src="/static/image/up.png"></button>
								</div>
								<div class="commentInfo mt-2">
									<div class="small mt-1"><b>bogus</b> 내가 놀아줄게 나와라</div>
									<div class="small mt-1"><b>groot</b> 아이 엠 그루트</div>
									<div class="d-flex justify-content-center">
										<div class="input-group col-10 mt-3">
											<input type="text" class="form-control" placeholder="내용을 입력해주세요">
											<div class="input-group-append">
												<button class="commentBtn btn" type="button">게시</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
			</section>
		</section>
		<footer>
			<hr>
			<div class="text-center"><b>Copyright © BogusGram 2023</b></div>
		</footer>
	
	</div>
	
</body>
</html>