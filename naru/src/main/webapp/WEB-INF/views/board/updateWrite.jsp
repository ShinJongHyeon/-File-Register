<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="ko">
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
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
<script src="resources/ckeditor/ckeditor.js"></script>

<title>글 수정</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">


<script>

	
	function updateB() {
		var bno = $("#bno").val();
		var title = $("#title").val();
		var content = CKEDITOR.instances.content.getData();
		var titleLength = title.length;
		if (!title) {
			swal("error", "제목을 입력하세요.", "error");
		} else if (titleLength > 50) {
			swal("", "제목이 너무 깁니다.", "error");
		} else if (content == "") {
			swal("error", "글내용을 입력해 주세요!!.", "error");
			return false;
		} else {
			swal({
				icon : "warning",
				text : "정말 수정 하시겠습니까?",
				closeOnClickOutside : false,
				closeOnEsc : false,
				buttons : [ "돌아가기", "수정 완료!" ],
		})
			.then(
			function(isConfirm) {
				if (isConfirm) {
					swal('수정 완료!', '게시글 수정을 완료했습니다.^^',
							'success')
					.then(function(isConfirm) {
						$.ajax({
							type : "POST",
							url : "updateBoard",
							data : {
								"bno" : bno,
								"title" : title,
								"content" : content
							},
									success : function(
											data) {
										location.href = "board";
									}
								});
							});
					}
				})
		}
	}
	//키보드로 글자수 입력 받았을 때 글자카운트 스크립트
	$(document).ready(function() {
		/* 키보드 이벤트 활용 */
		$('#title').keyup(function() {
			// 남은 글자수를 구한다.
			var titleLength = $(this).val().length; //현재 글자수
			var remain = 50 - titleLength;

			// 문서 객체에 남은 글자수 표시
			$('#titleCount').html(remain);

			if (remain >= 0) {
				$('#titleCount').css('color', 'green');
			} else {
				$('#titleCount').css('color', 'red');
			}
			if (remain < 0) {
				swal("", "제목은 한글기준 50자 까지만 쓸 수 있습니다.", "warning");
			}
		})
	})
</script>
</head>
<body>
	<%@ include file="../include/header.jsp"%>

	<main class="mt-5 pt-5"
		style="width: 1000px; margin-left: 200px; margin-bottom: 100px;">
		<div class="container-fluid px-4" style="width: 1000px;">
			<h1 class="mt-4" style="margin-bottom: 100px; text-align: center;">Board</h1>
			<div class="card mb-4">
				<div class="card-body">
					<form>
					<input type="hidden" name="bno" id="bno" value="${board.bno}"/>
					<%-- <div class="mb-3">
							<label for="title" class="form-label">글 번호</label> <input
								type="text" class="form-control" id="bno" name="bno"
								value="${board.bno}" >
						</div> --%>
						<div class="mb-3">
							<label for="title" class="form-label">제목</label> <input
								type="text" class="form-control" id="title" name="title"
								value="${board.title}" >
						</div>
						<div class="mb-3">
							<label for="content" class="form-label">글 내용</label>
							<textarea class="form-control" id="content" name="content"
								 style="width: 910px; height: 320px;">${board.content}</textarea>
						</div>
						<script>
							CKEDITOR.replace('content', {});
						</script>
						
						<a class="btn btn-primary" onclick="updateB()"
							id = "list_btn" style="text-align: right;">작성 완료</a>
							
						<a onclick="location.href='board'" id = "list_btn"
							class="btn btn-outline-secondary" style="text-align: right;">목록</a>
						
					</form>
				</div>
			</div>
		</div>
	</main>
	</div>
	</div>

	<footer class="py-5 bg-dark">
		<div class="container px-4 px-lg-5">
			<p class="m-0 text-center text-white">Copyright &copy; ShinJongHyeon 2023 starlgb02@narudata.com</p>
		</div>
	</footer>
</body>

</html>