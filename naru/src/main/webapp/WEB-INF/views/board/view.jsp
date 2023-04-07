<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html lang="ko">
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.10.1.js"></script>
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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/ckeditor/ckeditor.js"></script>

<title>게시글 상세보기</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script>
	// 게시물 삭제 확인
	function deleteB() {
		swal({
			icon: "warning",
			text: "정말 게시글을 삭제하시겠습니까?",
			closeOnClickOutside : false,
			closeOnEsc : false, 
			buttons: ["돌아가기", "삭제하기"],
		}).then(function(isConfirm) {
			if (isConfirm) {
				swal('삭제 완료!','게시글을 삭제했습니다.','success').then(function(isConfirm){
					location.href='delete?bno='+${board.bno};
				});
			}
		})
	}
	$("#list_btn").click(function(){
		self.location="board?"
				+ "searchOption=${searchOption}&keyword=${keyword}"
				+ "&search=${search}&curPage=${curPage}";
	});
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
						<div class="mb-3 mt-3">
							<label for="bno" class="form-label">글 번호</label> <input
								type="text" class="form-control" id="bno" name="bno"
								value="${board.bno}" disabled>
						</div>

						<div class="mb-3">
							<label for="title" class="form-label">제목</label> <input
								type="text" class="form-control" id="title" name="title"
								value="${board.title}" disabled>
						</div>
						<div class="mb-3">
							<label for="content" class="form-label">글 내용</label>
							<textarea class="form-control" id="content" name="content"
								disabled style="width: 910px; height: 320px;">${board.content}</textarea>
						</div>
						<div class="mb-3">
							<label for="regDate" class="form-label">날짜</label> <input
								type="text" class="form-control" id="regDate" name="regDate"
								value="${board.regDate}" disabled>
						</div>
						<div class="mb-3">
							<label for="writer" class="form-label">작성자</label> <input
								type="text" class="form-control" id="writer" name="writer"
								value="${board.writer}" disabled>
						</div>
						
						<a onclick="location.href='board'"
							class="btn btn-outline-secondary" style="text-align: right;">목록</a>
						<%-- <c:if test="${member.member_id == board.writer}"> --%>
						<a href="updateWrite" class="btn btn-outline-warning"
							style="text-align: right;">수정</a> <a onClick="deleteB()"
							class="btn btn-outline-danger" style="text-align: right;">삭제</a>
						<%-- </c:if> --%>
					</form>
					<div align="center" style="float: left;">
						<c:if test="${map.previousB != null}">
							<button class="previous"
								onClick="location.href='view?bno=${map.previousB.bno}&show=Y'">이전글</button>
						</c:if>
						<c:if test="${map.nextB != null}">
							<button class="next"
								onClick="location.href='view?bno=${map.nextB.bno}&show=Y'">다음글</button>
						</c:if>
						&nbsp;&nbsp;&nbsp;게시글 번호 : ${board.bno}
					</div>
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