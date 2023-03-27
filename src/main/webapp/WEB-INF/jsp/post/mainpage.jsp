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
			
				<!-- 입력 박스 -->
				<div class="postInputBox border border-warning">
					<textarea rows="3" placeholder="내용을 입력해주세요" class="form-control" id="contentInput"></textarea>
					<div class="d-flex justify-content-between">	
						<div class="file-upload d-flex align-items-center">
							<i id="imageIcon" class="bi bi-card-image image-icon-size ml-2"></i>
							<input id="fileInput" type="file" class="ml-2 mt-1 d-none">
						</div>
						<div class="d-flex align-items-center">
							<button type="button" class="btn btn-sm mr-2 mb-1" id="uploadBtn">upload</button>
						</div>
					</div>
				</div>
				<!-- 입력 박스 -->
				
				<!-- 게시물 리스트 -->
				<c:forEach var="post" items="${postList}">
					
					<div class="postInfoBox mt-4">
						<div class="postInfoBoxHeader d-flex align-items-center justify-content-between">
							<div class="nickname ml-2"><b>${post.nick_name}</b></div>
							<c:if test="${post.userId eq userId}">
								<i class="bi bi-three-dots btn hideBtn" data-hidebtn-check="0" data-hide-postid="${post.id}"></i>
							</c:if>
						</div> 
						<div class="d-none hideBtns${post.id}">
							<div class="postBtns d-flex justify-content-end">
								<button type="button" class="btn btn-sm mr-2 hideButton" data-this-id="${post.id}">숨기기</button>
								<a class="btn btn-sm mr-2" href="/post/update/view?postId=${post.id}">수정하기</a>
								<button type="button" class="btn btn-sm deleteBtn" data-delete-id="${post.id}">삭제하기</button>
							</div>
						</div>
						
						<div class="postInfo">
							<div class="postImageBox">
								<c:if test="${not empty post.imagePath}">
									<div class="postImage mb-1">
										<img alt="직접올린 사진" src="${post.imagePath}">
									</div>
								</c:if>
								<!-- 좋아요 버튼 -->
								<div class="d-flex justify-content-end align-items-center">
									<c:choose>
										<c:when test="${!post.like}">
											<i class="like-icon bi bi-heart mt-1 mr-2" data-post-id="${post.id}"></i>
										</c:when>
										<c:otherwise>
											<i class="like-icon bi bi-heart-fill text-danger mt-1 mr-2" data-post-id="${post.id}"></i>
										</c:otherwise>
									</c:choose>
									<div class="mt-1 small"><b>좋아요 ${post.likeCount}개</b></div>
								</div>
								<!-- 좋아요 버튼 -->
								
								<div class="postInfoContent">${post.content}</div>
								
								<!-- 댓글달기 -->
								<div class="comment">
									<div class="comment-header d-flex align-items-center justify-content-between">
										<div class="ml-2"><b>comment</b></div>
										<i class="bi bi-caret-up-fill btn"></i>
									</div>
									<div class="commentInfo mt-2">
										<div class="ml-3">
											<c:forEach var="comment" items="${post.commentList}">
												<div class="small mt-1"><b>보거스</b> ${comment.comment}</div>
											</c:forEach>
										</div>
										<div class="d-flex justify-content-center">
											<div class="input-group col-10 mt-2">
												<input type="text" class="form-control" id="comment${post.id}" placeholder="내용을 입력해주세요">
												<div class="input-group-append">
													<button class="commentBtn btn commentBtn" type="button" data-comment-id="${post.id}">게시</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- 댓글달기 -->
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- 게시물 리스트 -->
				
			</section>	
		</section>
		
		<c:import url="/WEB-INF/jsp/post/include/footer.jsp"/>
	</div>
	
	<script>
		$(document).ready(function(){
			
			$(".like-icon").on("click", function(){
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get"
					, url:"/post/like/isDuplicate"
					, data:{"postId":postId}
				 	, success:function(data){
				 		if(data.isDuplicate) {
				 			$.ajax({
								type:"get"
								, url:"/post/unlike"
								, data:{"postId":postId}
							 	, success:function(data){
							 		if(data.result == "success") {
							 			location.reload();
							 		} else {
							 			alert("좋아요취소 실패");
							 		}
							 	}
							 	, error:function(){
							 		alert("좋아요취소 에러");
							 	}
							});
				 		} else {
				 			$.ajax({
								type:"get"
								, url:"/post/like"
								, data:{"postId":postId}
							 	, success:function(data){
							 		if(data.result == "success") {
							 			location.reload();
							 		} else {
							 			alert("좋아요 실패");
							 		}
							 	}
							 	, error:function(){
							 		alert("좋아요 에러");
							 	}
							});
				 		}
				 	}
				 	, error:function(){
				 		alert("좋아요 중복확인 에러");
				 	}
				});
				
				
			});
			
			$(".commentBtn").on("click", function(){
				let postId = $(this).data("comment-id");
				let commentId = "#comment" + postId;
				let comment = $(commentId).val();
				
				$.ajax({
					type:"post"
					, url:"/post/comment/add"
					, data:{"postId":postId, "comment":comment}
					, success:function(data){
						if(data.result == "success") {
							location.reload();
						} else {
							alert("댓글 달기 실패");
						}	
					}
					, error:function(){
						alert("댓글 달기 에러");
					}
					
				});
			});
			
			$(".deleteBtn").on("click", function(){
				let postId = $(this).data("delete-id");

				$.ajax({
					type:"get"
					, url:"/post/delete"
					, data:{"postId":postId}
					, success:function(data){
						if(data.result == "success") {
							location.reload();
						} else {
							alert("삭제 실패");
						}	
					}
					, error:function(){
						alert("삭제 에러");
					}
					
				});
			});
			
			$(".hideButton").on("click", function(){
				let postId = $(this).data("this-id");
				
				$.ajax({
					type:"get"
					, url:"/post/hide"
					, data:{"postId":postId}
					, success:function(data){
						if(data.result == "success") {
							location.reload();
						} else {
							alert("숨기기 실패");
						}	
					}
					, error:function(){
						alert("숨기기 에러");
					}
					
				});
			});
				
/*			$(".likeIcon").on("click", function(){
				let postId = $(this).data("postid");
				
				$.ajax({
					type:"get"
					, url:"/post/like/isDuplicate"
					, data:{"postId":postId}
					, success:function(data){
						if(data.is_duplicate) {
							$.ajax({
								type:"get"
								, url:"/post/unlike"
								, data:{"postId":postId}
								, success:function(data){
									if(data.result == "success") {
										location.reload();
									} else {
										alert("좋아요 취소 실패");
									}	
								}
								, error:function(){
									alert("좋아요 취소 에러");
								}
								
							});
						} else {
							$.ajax({
								type:"get"
								, url:"/post/like"
								, data:{"postId":postId}
								, success:function(data){
									if(data.result == "success") {
										location.reload();
									} else {
										alert("좋아요 실패");
									}	
								}
								, error:function(){
									alert("좋아요 에러");
								}
								
							});
						}	
					}
					, error:function(){
						alert("좋아요 중복확인 에러");
					}
					
				});
						
				
			});  */
			
			
			$("#imageIcon").on("click", function(){
				// file input 을 클릭한 동작을 수행한다.
				$("#fileInput").click();
			});		
		
			
		
			$(".hideBtn").on("click", function(){
				let hideBtnCheck = $(this).data("hidebtn-check");
				let id = $(this).data("hide-postid");
				let btns = ".hideBtns" + id;
				
				if(hideBtnCheck == 0) {
					$(btns).removeClass("d-none");	
					$(this).data("hidebtn-check", "1");
				} else {
					$(btns).addClass("d-none");	
					$(this).data("hidebtn-check", "0");
				}
			});
	
			$("#uploadBtn").on("click", function(){
				let content = $("#contentInput").val();
				let file = $("#fileInput")[0];
				
				if(content.trim() == "") {
					alert("내용을 입력해주세요");
					return;
				}
				
				// 파일이 선택되지 않았을 경우의 유효성 검사
				//if(file.files.length == 0) {
				//	alert("파일을 선택하세요");
				//	return;
				//}
				
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