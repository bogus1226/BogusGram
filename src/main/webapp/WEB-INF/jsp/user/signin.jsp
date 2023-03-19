<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<title>�α���</title>
</head>
<body>
	
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/user/include/header.jsp"/>
		
		<section class="login-box d-flex justify-content-center">
			<div class="col-10 mt-3">
				<input type="text" placeholder="���̵�" class="form-control mt-4" id="loginIdInput">
				<input type="password" placeholder="��й�ȣ" class="form-control mt-3" id="passwordInput">
				<div class="d-flex justify-content-between">
					<a id="signupBtn" class="btn mt-3" href="/user/signup/view">ȸ������</a>
					<button type="button" class="btn mt-3" id="loginBtn">�α���</button>
				</div>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/user/include/footer.jsp"/>
	</div>

	<script>
		$(document).ready(function(){
			
			$("#loginBtn").on("click", function(){
				let loginId = $("#loginIdInput").val();
				let password = $("#passwordInput").val();
				
				if(loginId == "") {
					alert("���̵� �Է����ּ���");
					return;
				}
				
				if(password == "") {
					alert("��й�ȣ�� �Է����ּ���");
					return;
				}
				
				$.ajax({
					type:"post"
					, url:"/user/signin"
					, data:{"loginId":loginId, "password":password}
					, success:function(data){
						if(data.result) {
							alert("�α��� ����")
						} else if(!data.idResult) {
							alert("��ġ�ϴ� ���̵� �����ϴ�\n���̵� Ȯ�����ּ���");
						} else if(data.idResult) {
							alert("��й�ȣ�� Ʋ�Ƚ��ϴ�\n��й�ȣ�� Ȯ�����ּ���")
						} else {
							alert("�α��� ����");
						}
						
					}
					, error:function(){
						alert("�α��� ����");
					}
					
				});
				
			});
		});
	</script>
</body>
</html>