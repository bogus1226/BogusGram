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
					<c:if test="${not empty userId}">
						<a href="/profile/view?userId=${userId}" class="btn btn-sm col-3">내 프로필</a><br>
					</c:if>
				</nav>
				
				<section class="contents">
				
					<!-- 입력 박스 -->
					<div class="postInputBox border border-warning">
						<c:choose>
							
							<c:when test="${not empty userId}">
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
							</c:when>
							
							<c:otherwise>
								<textarea rows="3" placeholder="로그인후 이용해주세요" class="form-control bg-white" disabled></textarea>
								<div class="d-flex justify-content-between">	
									<div class="file-upload d-flex align-items-center">
										<i class="bi bi-card-image image-icon-size ml-2"></i>
									</div>
									<div class="d-flex align-items-center">
										<button type="button" class="btn btn-sm mr-2 mb-1" id="uploadBtn" disabled>upload</button>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- 입력 박스 -->
					
					<!-- 게시물 리스트 -->
					<c:import url="/WEB-INF/jsp/post/include/postList.jsp"/>
					<!-- 게시물 리스트 -->
					
				</section>	
			</section>
		
		<c:import url="/WEB-INF/jsp/post/include/footer.jsp"/>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="selectBtns" >
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-body">
		  	<button type="button" class="btn btn-sm mr-2" id="hideButton">숨기기</button>
			<a class="btn btn-sm mr-2" href="#" id="updateBtn">수정하기</a>
			<button type="button" class="btn btn-sm" id="deleteBtn">삭제하기</button>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary closeBtn" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- Modal -->
	
	<script>
		$(document).ready(function(){
			
			$("#carentDownBtn").on("click", function(){
				$("#carentDownBtn").addClass("d-none");
				$("#shortComment").addClass("d-none");
				$("#carentUpBtn").removeClass("d-none");
				$("#longComment").removeClass("d-none");
			});
			
			$("#carentUpBtn").on("click", function(){
				$("#carentDownBtn").removeClass("d-none");
				$("#shortComment").removeClass("d-none");
				$("#carentUpBtn").addClass("d-none");
				$("#longComment").addClass("d-none");
			});
			
			$("#deleteBtn").on("click", function(){
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get"
					, url:"/post/delete"
					, data:{"postId":postId}
					, success:function(data){
						if(data.result) {
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
			
			$("#hideButton").on("click", function(){
				let postId = $(this).data("post-id");
				
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
			
			$(".iconBtn").on("click", function(){
				
				let postId = $(this).data("post-id");
				
				$("#deleteBtn").data("post-id", postId);
				
				$("#hideButton").data("post-id", postId);	
				
				$("#updateBtn").attr("href", "/post/update/view?postId=" + postId);	
			});
			
			
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
			
			
			$("#imageIcon").on("click", function(){
				// file input 을 클릭한 동작을 수행한다.
				$("#fileInput").click();
			});		
	
			$("#uploadBtn").on("click", function(){
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