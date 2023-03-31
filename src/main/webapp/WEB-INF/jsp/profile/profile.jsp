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
	
<title>프로필</title>
</head>
<body>	

	<div id="wrap2">
		<header class="header2 d-flex justify-content-between align-items-end">
			<div class="nickName"><b>bogus</b></div>
			<div class="logo2">
				<a href="/post/mainpage/view"><b>BogusGram</b></a>
			</div>
		</header>
		<div class="userInfoBox2 d-flex mt-1	mb-3">
			<div class="profileImageBox2">
				<div class="profileImage2 border">
					<img height="100px" width="200px" alt="프로필 사진" src="/static/image/notphoto.png">
				</div>
			</div>
			<div class="buttonBox2 ml-2">
				<a type="button" class="btn btn-block btn-sm" href="/profile/update/view?userId=${userId}"><b>프로필 편집</b></a>
				<button type="button" class="btn btn-block btn-sm"><b>숨긴 목록</b></button>
			</div>
			<div class="countBox2 d-flex justify-content-center text-center">
				<div class="postInfoBox2">
					<h5><b>게시물</b></h5>
					<h5><b>${postCount}</b></h5>
				</div>
				<div class="followerInfoBox2">
					<h5><b>팔로워</b></h5>
					<h5><b>${fallowerCount}</b></h5>
				</div>
				<div class="followingInfoBox2">
					<h5><b>팔로잉</b></h5>
					<h5><b>${fallowingCount}</b></h5>
				</div>
			</div>
		</div>
		<section class="main-contents2 d-flex justify-content-end">
			<section class="content2">
				<div class="iconButtons2 d-flex">
					<div class="postIcon2">
						<div class="d-flex justify-content-center align-items-center">
							<i class="bi bi-grid-3x3 post-icon2"></i>
						</div>
						<hr class="mt-0">
					</div>
					<div class="postPhotoIcon2">
						<div class="d-flex justify-content-center align-items-center">
							<i class="bi bi-camera-fill post-icon2"></i>
						</div>
						<hr class="mt-0 d-none">
					</div>
				</div>
				
				<section class="contents">
					<c:import url="/WEB-INF/jsp/post/include/postList.jsp"/>
				</section>
			</section>
		</section>
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
</body>

<script>
	$(document).ready(function(){
		
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
		
	});
</script>
</html>