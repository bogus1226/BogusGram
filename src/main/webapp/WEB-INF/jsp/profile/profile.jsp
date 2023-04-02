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
			<div class="nickName"><b>${user.nick_name}</b></div>
			<div class="logo2">
				<a href="/post/mainpage/view"><b>BogusGram</b></a>
			</div>
		</header>
		<div class="userInfoBox2 d-flex mt-1 mb-3">
			<div class="profileImageBox2">
				<div class="profileImage2 border">
					<c:choose>
						<c:when test="${not empty user.profile_img}">
							<img alt="프로필 사진" src="${user.profile_img}">
						</c:when>
						<c:otherwise>
							<img alt="프로필 사진" src="/static/image/notphoto.png">
						</c:otherwise>
					</c:choose>
					<c:if test="${not empty userId and (isDuplicateFollow ne 0)}">
						<h5 class="text-center followingText"><b>팔로잉</b></h5>
					</c:if>
				</div>
			</div>
			<div class="buttonBox2 ml-2">
				<c:if test="${not empty userId}">
					<c:choose>
						<c:when test="${userId eq profileUserId}">
							<a type="button" class="btn btn-block btn-sm" href="/profile/update/view?userId=${userId}"><b>프로필 편집</b></a>
							<button type="button" class="btn btn-block btn-sm" id="hidePostButton"><b>숨긴 목록</b></button>
							<button type="button" class="btn btn-block btn-sm d-none" id="notHidePostButton"><b>게시물</b></button>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${isDuplicateFollow eq 0}">
									<button type="button" class="btn btn-block btn-sm" id="fallowBtn" data-userid="${userId}" data-followid="${profileUserId}"><b>팔로우</b></button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-block btn-sm m-0" id="unFallowBtn" data-userid="${userId}" data-followid="${profileUserId}"><b>팔로우 취소</b></button>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</c:if>
			</div>
			<div class="countBox2 d-flex justify-content-center text-center">
				<div class="postInfoBox2">
					<h5><b>게시물</b></h5>
					<h5 id="postCount"><b>${postCount}</b></h5>
					<h5 id="postHideCount" class="d-none"><b>${postHideCount}</b></h5>
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
							<i class="bi bi-grid-3x3 post-icon2" id="profilePostIcon"></i>
						</div>
						<hr class="mt-0" id="profileHr">
					</div>
					<div class="postPhotoIcon2">
						<div class="d-flex justify-content-center align-items-center">
							<i class="bi bi-camera-fill post-icon2" id="profilePostPhotoIcon"></i>
						</div>
						<hr class="mt-0 d-none" id="profilePhotoHr">
					</div>
				</div>
				
				<section class="contents">
					<div id="postList">
						<div id="postNotHideList">
							<c:import url="/WEB-INF/jsp/post/include/postList.jsp"/>
						</div>
						
						<div class="d-none" id="postHideList">
							<c:import url="/WEB-INF/jsp/post/include/postHideList.jsp"/>
						</div>
					</div>
					
					<div class="d-none mt-3" id="postPhotoList">
						<div>
							<div id="notHidePhotoList">
								<div class="d-flex flex-wrap">
									<c:forEach var="post" items="${postList}">
										<c:if test="${not empty post.imagePath}">
											<div class="photoBox border mr-3 mt-2">
												<img alt="게시물 사진" src="${post.imagePath}" class="postPhoto">
											</div>
										</c:if>
									</c:forEach>
								</div>
							</div>
							
							<div class="d-none" id="hidePhotoList">
								<div class="d-flex flex-wrap">
									<c:forEach var="post" items="${postHideList}">
										<c:if test="${not empty post.imagePath}">
											<div class="photoBox border mr-3 mt-2">
												<img alt="게시물 사진" src="${post.imagePath}" class="postPhoto">
											</div>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
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
	
	<!-- Modal -->
	<div class="modal fade" id="selectBtn" >
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-body">
		  	<button type="button" class="btn btn-sm mr-2" id="cancleHideButton">숨기기 취소</button>
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
		
		$("#fallowBtn").on("click" , function(){
			let userId = $(this).data("userid");
			let followId = $(this).data("followid");
			
			$.ajax({
				type:"get"
				, url:"/profile/follow"
				, data:{"userId":userId, "followUserId":followId}
				, success:function(data){
					if(data.result) {
						location.reload();
					} else {
						alert("팔로우 실패");
					}	
				}
				, error:function(){
					alert("팔로우 에러");
				}
				
			});
		});
		
		$("#unFallowBtn").on("click" , function(){
			let userId = $(this).data("userid");
			let followId = $(this).data("followid");
			
			$.ajax({
				type:"get"
				, url:"/profile/unfollow"
				, data:{"userId":userId, "followUserId":followId}
				, success:function(data){
					if(data.result) {
						location.reload();
					} else {
						alert("팔로우 취소 실패");
					}	
				}
				, error:function(){
					alert("팔로우 취소 에러");
				}
				
			});
		});
		
		$("#hidePostButton").on("click", function(){
			$("#hidePostButton").addClass("d-none");
			$("#notHidePostButton").removeClass("d-none");
			$("#postHideList").removeClass("d-none");
			$("#postNotHideList").addClass("d-none");
			$("#notHidePhotoList").addClass("d-none");
			$("#hidePhotoList").removeClass("d-none");
			$("#postCount").addClass("d-none");
			$("#postHideCount").removeClass("d-none");
		});
		
		$("#notHidePostButton").on("click", function(){
			$("#notHidePostButton").addClass("d-none");
			$("#hidePostButton").removeClass("d-none");
			$("#postHideList").addClass("d-none");
			$("#postNotHideList").removeClass("d-none");
			$("#notHidePhotoList").removeClass("d-none");
			$("#hidePhotoList").addClass("d-none");
			$("#postCount").removeClass("d-none");
			$("#postHideCount").addClass("d-none");
		});
		
		$("#profilePostPhotoIcon").on("click", function(){
			$("#profileHr").addClass("d-none");
			$("#profilePhotoHr").removeClass("d-none");
			$("#postList").addClass("d-none");
			$("#postPhotoList").removeClass("d-none");
		});
		
		$("#profilePostIcon").on("click", function(){	
			$("#profilePhotoHr").addClass("d-none");
			$("#profileHr").removeClass("d-none");
			$("#postList").removeClass("d-none");
			$("#postPhotoList").addClass("d-none");
		});
		
		$("#cancleHideButton").on("click", function(){
			let postId = $(this).data("post-id");
			
			$.ajax({
				type:"get"
				, url:"/profile/cancle/hide"
				, data:{"postId":postId}
				, success:function(data){
					if(data.result) {
						location.reload();
					} else {
						alert("숨기기 취소 실패");
					}	
				}
				, error:function(){
					alert("숨기기 취소 에러");
				}
				
			});
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
			
			$("#cancleHideButton").data("post-id", postId);	
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