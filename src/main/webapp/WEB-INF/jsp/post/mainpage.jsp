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
<title>메인화면</title>
</head>
<body>
	
	<div id="wrap">
		
		<c:import url="/WEB-INF/jsp/post/include/header.jsp"/>
		
		<section class="main-contents d-flex">
			<nav class="navBtn">
				<a href="#" class="btn btn-sm col-3">Profile</a><br>
				<a href="#" class="btn btn-sm col-3 mt-2">Fallow</a><br>
				<a href="#" class="btn btn-sm col-3 mt-2">Comment</a>
			</nav>
			<section class="contents">
				<div class="postInputBox border border-warning">
					<textarea rows="3" placeholder="내용을 입력해주세요" class="form-control" id="contentInput"></textarea>
					<div class="d-flex justify-content-between">	
						<div class="d-flex align-items-center">
							<input id="fileInput" type="file" class="ml-2 mt-1">
						</div>
						<div class="d-flex align-items-center">
							<button type="button" class="uploadBtn btn btn-sm mr-2" id="uploadBtn">upload</button>
						</div>
					</div>
				</div>
				
				<c:forEach var="post" items="${postList}">
				
					<div class="postInfoBox mt-4">
						<div class="postInfoBoxHeader d-flex align-items-center justify-content-between">
							<div class="nickname ml-2"><b>${user}</b></div>
							<button type="button" class="btn hideBtn" data-hidebtn-check="0"><img height="23" alt="4개의선이있는 아이콘" src="/static/image/four_line.png"></button>
						</div>
						<div class="d-none hideBtns">
							<div class="postBtns d-flex justify-content-end">
								<button type="button" class="btn btn-sm mr-2">숨기기</button>
								<button type="button" class="btn btn-sm mr-2">수정하기</button>
								<button type="button" class="btn btn-sm">삭제하기</button>
							</div>
						</div>
						
						<div class="postInfo">
							<c:choose>
								<c:when test="${not empty post.imagePath}">
									<div class="postImageBox">
										<div class="postImage mb-1">
											<img alt="직접올린 사진" src="${post.imagePath}">
										</div>
										<div class="d-flex justify-content-end align-items-center">
											<i class="bi bi-heart mt-1 mr-2"></i>
											<div class="mt-1 small"><b>11개</b></div>
										</div>
										<div class="postInfoContent">${post.content}</div>
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
								</c:when>
								
								<c:otherwise>
									<div class="postImageBox">
										<div class="postInfoContent mt-2">${post.content}</div>
										<div class="d-flex justify-content-end align-items-center">
											<i class="bi bi-heart mt-1 mr-2"></i>
											<div class="mt-1 small"><b>11개</b></div>
										</div>
										
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
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</c:forEach>
			</section>	
		</section>
		
		<c:import url="/WEB-INF/jsp/post/include/footer.jsp"/>
	</div>
	
	<script>
		$(document).ready(function(){
			
		
		$(".hideBtn").on("click", function(){
			let hideBtnCheck = $(this).data("hidebtn-check");
			
			if(hideBtnCheck == 0) {
				$(".hideBtns").removeClass("d-none");	
				$(this).data("hidebtn-check", "1");
			} else {
				$(".hideBtns").addClass("d-none");	
				$(this).data("hidebtn-check", "0");
			}
		});

		$(".uploadBtn").on("click", function(){
			let content = $("#contentInput").val();
			let file = $("#fileInput")[0];
			
			if(content.trim() == "") {
				alert("내용을 입력해주세요");
				return;
			}
			
			var formData = new FormData();
			formData.append("content",content);
			formData.append("file", file.files[0]);
			
			$.ajax({
				type:"post"
				, url:"/post/create"
				, data:formData
				, enctype:"multipart/form-data" // 파일 업로드 필수
				, processData:false // 파일 업로드 필수
				, contentType:false // 파일 업로드 필수
				, success:function(data){
					if(data.result == "success") {
						location.reload();
					} else {
						alert("게시물 올리기 실패");
					}	
				}
				, error:function(){
					alert("게시물 올리기 에러");
				}
				
			});
		});
			
			
		});
	</script>
	
</body>
</html>