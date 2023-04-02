<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<header class="d-flex">
			<div class="search pt-2">
				
			</div>
			
			<div class="logo d-flex justify-content-center align-items-center">
				<a href="/post/mainpage/view"><b>BogusGram</b></a>
			</div>
			
			<div class="logInOut d-flex justify-content-end align-items-center pt-3">
				<c:choose>
					<c:when test="${empty userId}">
						<a class="login" href="/user/signin/view">로그인/회원가입</a>
					</c:when>
					
					<c:when test="${not empty userId}">
						<div>
							<div class="d-flex logInOut">
								<div class="login" id="userName">${userName}님 환영합니다.</div>
								<a class="login ml-3" href="/user/signout">로그아웃</a>
							</div>
						</div>
					</c:when>
				</c:choose>
			</div>
		</header>