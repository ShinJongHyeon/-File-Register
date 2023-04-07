<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

<title>게시판 리스트</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">



</head>

<body>
	<%@ include file="../include/header.jsp"%>

	<main class="mt-5 pt-5"
		style="width: 1000px; margin-left: 200px; margin-bottom: 100px;">
		<div class="container-fluid px-4"
			style="width: 1000px; text-align: center;">
			<h1 class="mt-4" style="margin-bottom: 100px;">Board</h1>

			<div class="card mb-4" style="width: 1000px; text-align: right;">
				<div class="card-header">
					<a class="btn btn-primary float-end" href="write"
						style="margin-bottom: 30px;"> <!-- <i class="fas fa-table me-1"></i> -->
						<i class="fas fa-edit"></i> 글 작성
					</a>
					<c:if test="${map.search eq 's'}">
						<c:choose>
							<c:when test="${map.count == 0 }">
								<br />
								<span style="font-family: '돋움';">게시글이 없습니다. 검색을 다시
									확인해주세요.&nbsp;</span>
							</c:when>
							<c:otherwise>
								<span style="font-family: '돋움';">${map.count}개의
									게시물이 있습니다.&nbsp;</span>
							</c:otherwise>
						</c:choose>
					</c:if>
					<!-- 검색 조건 뷰 -->
					<form action="board">
						<!-- align="left" -->
						<select name="searchOption" id="searchOption">
							<option value="ALL">
								<c:out value="${map.searchOption=='ALL'?'selected':''}"/>제목+이름+내용</option>
							<option value="TITLE">
								<c:out value="${map.searchOption=='TITLE'?'selected':''}"/>제목</option>
							<option value="WRITER">
								<c:out value="${map.searchOption=='WRITER'?'selected':''}"/>이름</option>
							<option value="CONTENT">
								<c:out value="${map.searchOption=='CONTENT'?'selected':''}"/>내용</option>
						</select> <input type="text" name="keyword" placeholder="검색어 입력"
							id="keyword" value="${keyword}"> <input type="hidden"
							name="search" id="search" value="s" /> <input type="submit"
							class="check2" value="조회" />

					</form>

				</div>
				<div class="card-body" style="text-align: center;">
					<table class="table table-hover table-striped">
						<thead>
							<tr>
								<th>글번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<c:forEach begin="0" end="${(fn:length(map.list))}" var="i">
							<c:set var="row" value="${map.list[i]}" />
							<input type="hidden" id="bno" name="bno" value="${row.bno}" />
							<c:choose>
								<%-- 검색결과가 있을 때 --%>
								<c:when test="${not empty row}">
									<tr height="45">
										<td>${row.bno}</td>
										<td class="list2"><a href="view?bno=${row.bno}&show=Y"
											style="text-decoration: none;"> ${row.title}</a>
										<td class="list2">${row.writer}</td>
										<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="today" />
										<fmt:formatDate value="${row.regDate}" pattern="yyyyMMdd"
											var="regDate" />
										<c:choose>
											<c:when test="${today == regDate}">
												<td class="list2" style="color: red;">오늘</td>
											</c:when>
											<c:otherwise>
												<td class="list2">${row.regDate}</td>
											</c:otherwise>
										</c:choose>
										<td class="list2">${row.viewCnt}</td>
									</tr>
								</c:when>
								<%-- 검색결과가 없을 떄 --%>
								<c:when test="${map.count == 0}">
									<tr style="text-align: center;">
										<td colspan='5' size="30px"><b
											style="color: red; font-size: 30px;">'${keyword}'</b> 에 대한
											검색결과가 없습니다.</td>
									</tr>
								</c:when>
							</c:choose>
						</c:forEach>
					</table>
				</div>
			</div>
			
			<c:if test="${map.pager.curBlock > 1}">
				<a href="board?curPage=1&searchOption=${searchOption}&keyword=${keyword}&search=${search}">[처음]</a>
			</c:if>
			<c:if test="${map.pager.curBlock > 1}">
				<a href="board?curPage=${map.pager.prevPage}&searchOption=${searchOption}&keyword=${keyword}&search=${search}">[이전]</a>
			</c:if>
			
			<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
				<c:choose>
					<c:when test="${num == map.pager.curPage}">
						<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
						<span style="color: red;">${num}</span>
					</c:when>
					<c:otherwise>
						<a href="board?curPage=${num}&searchOption=${searchOption}&keyword=${keyword}&search=${search}">${num}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${map.pager.curBlock < map.pager.totBlock}">
				<a href="board?curPage=${map.pager.nextPage}&searchOption=${searchOption}&keyword=${keyword}&search=${search}">[다음]</a>
			</c:if>
			<c:if test="${(map.pager.totPage > 5) && (map.pager.totPage != map.pager.curPage)}">
				<a href="board?curPage=${map.pager.totPage}&searchOption=${searchOption}&keyword=${keyword}&search=${search}">[끝]</a>
			</c:if>
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