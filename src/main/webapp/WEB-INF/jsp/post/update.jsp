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
<title>게시물 수정하기</title>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/post/include/header.jsp"/>
		
		<section class="main-contents d-flex justify-content-center">
			<section class="contents">
				<!-- 입력 박스 -->
				<div class="postInputBox border border-warning">
					<textarea rows="3" class="form-control" id="contentInput">${post.content}</textarea>
					<div class="d-flex justify-content-between">	
						<div class="file-upload d-flex align-items-center">
							<i id="imageIcon" class="bi bi-card-image image-icon-size ml-2"></i>
							<input id="fileInput" type="file" class="ml-2 mt-1 d-none">	
						</div>
					</div>
				</div>
			</section>
		</section>
		
		<div class="main-contents d-flex justify-content-center">
			<div class="contents d-flex justify-content-between mt-3">
				<a href="javascript:window.history.back();" class="btn">취소</a>
				<button type="button" class="btn" id="updateBtn" data-post-id="${post.id}">완료</button>
			</div>
		</div>
		
		<c:import url="/WEB-INF/jsp/post/include/footer.jsp"/>
	</div>
</body>

<script>
	$(document).ready(function(){
		
		$("#imageIcon").on("click", function(){
			$("#fileInput").click();
		});		
		
		$("#updateBtn").on("click", function(){
			let postId = $(this).data("post-id");
			let content = $("#contentInput").val();
			let file = $("#fileInput")[0];
			
			var formData = new FormData();
			formData.append("postId", postId);
			formData.append("content", content);
			formData.append("file", file.files[0]);

			$.ajax({
				type:"post"
				, url:"/post/update"
				, data:formData
				, enctype:"multipart/form-data" 
				, processData:false 
				, contentType:false 
				, success:function(data){
					if(data.result == "success") {
						location.href = document.referrer;
					} else {
						alert("수정 실패");
					}	
				}
				, error:function(){
					alert("수정 에러");
				}
				
			});
			
		});
	});	
</script>		
</html>