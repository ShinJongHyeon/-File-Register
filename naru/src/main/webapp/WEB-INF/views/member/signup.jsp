<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="resources/js/signup.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>


<title>회원가입</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
</head>

<body>
	<%@ include file="../include/header.jsp"%>

	<!-- Page Content-->
	<div class="container" style="margin-bottom: 120px; margin-top: 30px;">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto" style="margin-top: 30px;">
				<h4 class="mb-3">회원가입</h4>
				<form class="validation-form" novalidate name="f3rm" id="f3rm" enctype="multipart/form-data">
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="nickname">회원 ID</label> <input type="text"
								class="form-control" id="member_id" placeholder="ID를 입력하세요"
								value="">

						</div>
						<div class="col-md-6 mb-3">
							<label for="name">이름</label> <input type="text"
								class="form-control" id="member_name" placeholder="이름을 입력하세요"
								value="">

						</div>
					</div>


					<div class="mb-3">
						<label for="password">비밀번호</label> <input type="password"
							class="form-control" id="member_pwd" placeholder="비밀번호를 입력하세요">

					</div>
					<div class="mb-3" id="emailForm">
						<label for="email">이메일</label> <input type="email"
							class="form-control" id="member_email" name="member_email"
							placeholder="you@example.com">
					</div>
					<div id="emailMsg"></div>
					<div>
					<input type="password" id="member_pass" name="member_pass" value="1" disabled>
					</div>
			</div>
			<div class="input-form col-md-12 mx-auto">
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" id="aggrement">
					<label class="custom-control-label" for="aggrement">개인정보 수집
						및 이용에 동의합니다.</label>
				</div>
				<div class="mb-4"></div>
				<button class="btn btn-primary btn-lg btn-block" type="button"
					vlaue= "가입" onclick="doSignup()">가입 완료</button>
			</div>

			</form>
		</div>
	</div>
	</div>



	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container px-4 px-lg-5">
			<p class="m-0 text-center text-white">Copyright &copy;
				ShinJongHyeon 2023 starlgb02@narudata.com</p>
		</div>
	</footer>
</body>

</html>