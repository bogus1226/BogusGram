<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<a id="loginClass" class="login" href="/user/signin/view">로그인/회원가입</a>
				<div id="logoutClass" class="d-none">
					<div class="d-flex logInOut">
						<div class="login" id="userName" data-userId="${userId}">${userName}님 환영합니다.</div>
						<a class="login ml-3" href="/user/signout" id="logoutBtn">로그아웃</a>
					</div>
				</div>
			</div>
		</header>