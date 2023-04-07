<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">

<head>
   <meta charset="utf-8" />
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
   <meta name="description" content="" />
   <meta name="author" content="" />
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
      integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
      crossorigin="anonymous"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
      integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
      crossorigin="anonymous"></script>
      <script src="resources/js/member.js"></script>
         <script>
   function list(page) {
      location.href = "memberList?curPage=" + page;
   }
</script>

   <title>회원 리스트</title>
   
   <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>

<body>
   <%@ include file="../include/header.jsp"%>
   
   <main class="mt-5 pt-5"
		style="width: 1000px; margin-left: 300px; margin-bottom: 200px;">
		<div class="container-fluid px-4"
			style="width: 1000px; text-align: center;">
			<h1 class="mt-4" style="margin-bottom: 100px;">Member List</h1>

			<div class="card mb-4" style="width: 1000px; text-align: right;">
				<div class="card-header">
					<!-- <a class="btn btn-primary float-end" href="write"
						style="margin-bottom: 30px;">가입 승인 요청</a> -->
                <form action="board">
                     <!-- align="left" -->
                     <input type="text" name="keyword" placeholder="회원 이름 입력" id="keyword" value="">
                     <a class="btn btn-primary float-end"
                      type="button" id="searchBtn" onclick="searchMem()" style="cursor: pointer;"> 검색 </a>
               </form>

            </div>
            <form name="f3rm" id="f3rm" enctype="multipart/form-data">
        <div class="card-body" style="text-align: center;">
            <table class="table table-hover table-striped">
                <thead>
                    <tr>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>이메일</th>
                        <th>회원정보 수정</th>
                    </tr>
                </thead>
                <c:forEach begin="0" end="${(fn:length(map.list))}" var="i">
               <c:set var="member2" value="${map.list[i]}" />
               <c:if test="${not empty member2}">
                  <tr>
                     <td>${member2.member_id}</td>
                     <td>${member2.member_name}</td>
                     <td>${member2.member_email}</td>
                     <td><a class="updateMember" onclick="location.href='updateMember?member_id=${member2.member_id}'">
                       <input type="button" name="updateMember"
                          id="updateMember" value="수정" ></a></td>
                  </tr>
               </c:if>
            </c:forEach>
            </table>
            
            
        </div>
        
        </form>
        
        
        </div>
        <c:if test="${map.pager.curBlock > 1}">
							<a href="#" onclick="list('1')">[처음]</a>
						</c:if>
						<c:if test="${map.pager.curBlock > 1}">
							<a href="#" onclick="list('${map.pager.prevPage}')">[이전]</a>
						</c:if>
						<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
							<c:choose>
								<c:when test="${num == map.pager.curPage}">
									<span style="color:red;">${num}</span>
								</c:when>
								<c:otherwise>
									<a href="#" onclick="list('${num}')">${num}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${map.pager.curBlock < map.pager.totBlock}">
							<a href="#" onclick="list('${map.pager.nextPage}')">[다음]</a>
						</c:if>
						<c:if test="${map.pager.curBlock < map.pager.totPage}">
							<a href="#" onclick="list('${map.pager.totPage}')">[끝]</a>
						</c:if>
        </div>     
          
        </main>   
 

   <!-- Footer-->
   <footer class="py-5 bg-dark" style="position : fixed;  bottom : 0; width: 100%;">
      <div class="container px-4 px-lg-5">
         <p class="m-0 text-center text-white">Copyright &copy;
				ShinJongHyeon 2023 starlgb02@narudata.com</p>
      </div>
   </footer>

</body>

</html>