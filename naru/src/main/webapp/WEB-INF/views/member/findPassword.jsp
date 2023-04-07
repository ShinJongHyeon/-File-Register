<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="ko">
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.10.1.js"></script>
<script type="text/javascript" src="resources/js/login.js?12"
	charset="UTF-8"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<title>비밀번호 찾기</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">


</head>

<body>
	<%@ include file="../include/header.jsp"%>

	<!-- <article style="display: flex; justify-content: center;"> -->
	<div style="display: flex; margin-left: 400px;">
		<div style="margin: auto;">
			<dl style="text-align: center;">
				<h1>비밀번호 찾기</h1>
				<br>
				<br>
				<h4>등록한 회원정보 또는 본인인증으로 비밀번호를 변경할 수 있습니다.</h4>
				<form action="#" name="find-pw-info" id="find-pw-info" method="post">
					<h4>등록된 회원정보로 찾기</h4>
					<p>회원 가입 시 등록한 정보를 정확히 입력해주세요.</p>
				</form>
			</dl>
			<br>
			<br>
			<!-- 이름 -->
			<div class="col-md-6 mb-3" style="margin-left: 180px;">

				<input type="text" class="form-control" id="name"
					placeholder="이름을 입력하세요" value="" required>
				<div class="invalid-feedback"></div>
			</div>
			<!-- 아이디 -->
			<div class="col-md-6 mb-3" style="margin-left: 180px;">

				<input type="text" class="form-control" id="id"
					placeholder="아이디를 입력하세요" value="" required>
				<div class="invalid-feedback"></div>
			</div>
			<!-- 이메일 -->
			<div class="col-md-6 mb-3" style="margin-left: 180px;">

				<input type="email" class="form-control" id="email"
					placeholder="you@example.com" required>
				<div class="invalid-feedback"></div>
			</div>


			<br>
			<!-- 아이디 찾기 -->

			<div class="col-md-6 mb-3" style="margin-left: 180px;">
				<button class="btn btn-primary btn-lg btn-block" type="submit"
					onclick="checkFP()">비밀번호 찾기</button>
			</div>
		</div>
	</div>
	</div>
	</div>
	</div>
	</div>


	<footer class="py-5 bg-dark">
		<div class="container px-4 px-lg-5">
			<p class="m-0 text-center text-white">Copyright &copy; ShinJongHyeon 2023 starlgb02@narudata.com</p>
		</div>
	</footer>

</body>

</html>