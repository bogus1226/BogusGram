<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="post" items="${postList}">
						
	<div class="postInfoBox mt-4">
		<div class="postInfoBoxHeader d-flex align-items-center justify-content-between">
			<div class="nickname ml-2"><b>${post.nick_name}</b></div>
			<c:if test="${post.userId eq userId}">
			
				<!-- Button trigger modal -->
				<i class="bi bi-three-dots btn iconBtn" data-toggle="modal" data-target="#selectBtns" data-post-id="${post.id}"></i>
				<!-- Button trigger modal -->
	
			</c:if>
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
					<c:if test="${not empty userId}">
						<c:choose>
							<c:when test="${!post.like}">
								<i class="like-icon bi bi-heart mt-1 mr-2" data-post-id="${post.id}"></i>
							</c:when>
							<c:otherwise>
								<i class="like-icon bi bi-heart-fill text-danger mt-1 mr-2" data-post-id="${post.id}"></i>
							</c:otherwise>
						</c:choose>
					</c:if>
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
								<div class="small mt-1"><b>${comment.nick_name.nick_name}</b> ${comment.comment}</div>
							</c:forEach>
						</div>
						<div class="d-flex justify-content-center">
							<div class="input-group col-10 mt-2">
								<c:choose>
									<c:when test="${not empty userId}">
										<input type="text" class="form-control" id="comment${post.id}" placeholder="내용을 입력해주세요">
										<div class="input-group-append">
											<button class="commentBtn btn commentBtn" type="button" data-comment-id="${post.id}">게시</button>
										</div>
									</c:when>
									
									<c:otherwise>
										<input type="text" class="form-control bg-white" placeholder="로그인후 이용해주세요" disabled>
										<div class="input-group-append">
											<button class="commentBtn btn commentBtn" type="button" disabled>게시</button>
										</div>
									</c:otherwise>
								</c:choose>
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