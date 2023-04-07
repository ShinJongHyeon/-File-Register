<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
   <meta charset="utf-8" />
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
      integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
      crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
      integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
      crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="resources/ckeditor/ckeditor.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	

   <title>파일등록 페이지</title>

   <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>

<script>
$(document).ready(function() {
	  $('#uploadForm').submit(function(event) {
	    event.preventDefault();

	    var fileInput = document.getElementById('fileInput');
	    var file = fileInput.files[0];
	    if (!file || file.type !== 'text/plain') {
	      alert('.TXT 파일만 업로드 가능합니다.');
	      return;
	    }

	    var progressBar = $('.progress-bar');
	    progressBar.css('width', '0%');

	    var formData = new FormData();
	    formData.append('file', file);
	    $.ajax({
	      url: '/uploadFile',
	      type: 'POST',
	      data: formData,
	      processData: false,
	      contentType: false,
	      xhr: function() {
	        var xhr = new XMLHttpRequest();
	        xhr.upload.addEventListener('progress', function(event) {
	          var percent = event.loaded / event.total * 100;
	          progressBar.css('width', percent + '%');
	        });
	        return xhr;
	      },
	      success: function(response) {
	        console.log('File uploaded successfully');
	        alert('파일 업로드 성공!');

	        // 업로드된 파일 내용 파싱
	        var lines = response.split('\n');
	        for (var i = 0; i < lines.length; i++) {
	          var fields = lines[i].split(',');
	          // 각 필드를 이용해 데이터베이스에 저장하는 로직 구현
	          // ...
	        }
	      },
	      error: function(xhr, status, error) {
	        console.error('Error uploading file:', error);
	        alert('파일 업로드 실패!');
	      }
	    });
	  });
	});
</script>
<body>

    <%@ include file="../include/header.jsp"%>
    
   <main class="mt-5 pt-5"
		style="width: 1500px; margin-left: 30px; margin-bottom: 200px;">
		<div class="container-fluid px-4"
			style="width: 1500px; text-align: center;">
			<h1 class="mt-4" style="margin-bottom: 80px;">File Register</h1>

			<div class="card mb-4" style="width: 1500px; text-align: right;">
				<div class="card-header">
				
				
				<!-- <form id="date-form" action="fileregister" method="post" style="text-align: left;">
				  <label for="datepicker">작업일자(교환일) 선택 : </label>
				  <input type="text" id="datepicker" name="fileregister_currentdate">
				  <button type="submit" id="submit-btn">적용</button>
				</form> -->

                <!-- <a type=button class="btn btn-primary float-end" href ="change"
					 style="margin-bottom: 30px;">작업일자 관리</a> -->
				<!-- 파일 업로드를 위한 폼 -->
					<a class="btn btn-primary float-end" type=button
					 data-toggle="modal" data-target="#popup_box"
						style="margin-bottom: 30px;">파일 선택</a>
						<div class="modal fade" id="popup_box" style="margin-top:80px;">
					        <div class="modal-dialog">
					            <div class="modal-content">
					                <div class="modal-header" style="text-align: center;">
                                        <p style="font-size: 40px; text-align: center; font-weight: bold;">Text File</p>
					                </div>
					                <div class="modal-body">
									    <p style="font-size: 20px; text-align: center; font-weight: bold;">파일 선택</p>
									    <form id="uploadForm" enctype="multipart/form-data">
						                    <input type="file" id="fileInput" name="file" />
						                    <button type="submit" id="uploadButton">Upload</button>
						                </form>
									</div>
					                <div class="modal-footer">
					                    <p></p>
					                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					                </div>
					            </div>            
					        </div>
    					</div>
    					<!-- 파일 업로드 진행 상태를 보여주기 위한 프로그레스 바 -->
						<div class="progress" style="margin-bottom: 20px; width: 70%; margin-left: 230px">
						  <div class="progress-bar" role="progressbar"></div>
						</div>
						<!-- 검색 결과 출력창 -->
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
				<form action="fileregister">
				  <div style="margin-bottom:10px;">
				    <input type="text" name="keyword" placeholder="작업일자로 검색" value="${keyword}">
				    <input type="hidden" name="searchOption" value="FILEREGISTER_CURRENTDATE">
				 	<input type="hidden" name="search" value="s">
				    <button type="submit">검색</button>
				  </div>
				</form>
					
				<form action="fileregister">
					<input type="text" name="keyword" placeholder="은행코드로 검색" value="${keyword}">
				  	<input type="hidden" name="searchOption" value="FILEREGISTER_BANKCODE">
				 	<input type="hidden" name="search" value="s">
					<button type="submit">검색</button>
				</form>
          	  </div>
            
        <div class="card-body" style="text-align: center;">
        <div class="table-responsive text-nowrap">
            <table class="table table-hover table-striped">
                <thead>
                    <tr>
                        <th>작업일자</th>
                        <th>블럭번호</th>
                        <th>처리번호</th>
                        <th>장표구분</th>
                        <th>독취구분</th>
                        <th>수표번호</th>
                        <th>은행코드</th>
                        <th>지점코드</th>
                        <th>권종</th>
                        <th>금액</th>
                        <th>이미지경로</th>
                        <th>생성일자</th>
                        <th>생성시간</th>
                        <th>생성자</th>
                    </tr>
                </thead>
               <tbody>
				<c:choose>
				  <%-- 검색결과가 있을 때 --%>
				  <c:when test="${not empty map.list}">
				    <c:forEach var="row" items="${map.list}">
				      <tr height="45">
				        <td>${row.fileregister_currentdate}</td>
				        <td>${row.fileregister_blocknumber}</td>
				        <td>${row.fileregister_handlenumber}</td>
				        <td>${row.fileregister_billtype}</td>
				        <td>${row.fileregister_state}</td>
				        <td>${row.fileregister_checknumber}</td>
				        <td>${row.fileregister_bankcode}</td>
				        <td>${row.fileregister_shopcode}</td>
				        <td>${row.fileregister_moneytype}</td>
				        <td>${row.fileregister_price}</td>
				        <td>${row.fileregister_imagepath}</td>
				        <td>${row.fileregister_createdate}</td>
				        <td>${row.fileregister_createtime}</td>
				        <td>${row.fileregister_creater}</td>
				      </tr>
				      <input type="hidden" id="fileregister_bankcode" name="fileregister_bankcode" value="${row.fileregister_bankcode}" />
				      <input type="hidden" id="fileregister_currentdate" name="fileregister_currentdate" value="${row.fileregister_currentdate}" />
				    </c:forEach>
				  </c:when>
				  <%-- 검색결과가 없을 때 --%>
				  <c:when test="${map.count == 0}">
				    <tr style="text-align: center;">
				      <td colspan="14">
				        <b style="color: red; font-size: 30px;">'${keyword}'</b> 에 대한 검색결과가 없습니다.
				      </td>
				    </tr>
				  </c:when>
				</c:choose>
				</tbody>
            </table>
        </div>
        </div>
        
        </div>
        <div>
        <c:if test="${map.pager.curBlock > 1}">
				<a href="fileregister?curPage=1&searchOption=${searchOption}&keyword=${keyword}&search=${search}">[처음]</a>
			</c:if>
			<c:if test="${map.pager.curBlock > 1}">
				<a href="fileregister?curPage=${map.pager.prevPage}&searchOption=${searchOption}&keyword=${keyword}&search=${search}">[이전]</a>
			</c:if>
			
			<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
				<c:choose>
					<c:when test="${num == map.pager.curPage}">
						<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
						<span style="color: red;">${num}</span>
					</c:when>
					<c:otherwise>
						<a href="fileregister?curPage=${num}&searchOption=${searchOption}&keyword=${keyword}&search=${search}">${num}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${map.pager.curBlock < map.pager.totBlock}">
				<a href="fileregister?curPage=${map.pager.nextPage}&searchOption=${searchOption}&keyword=${keyword}&search=${search}">[다음]</a>
			</c:if>
			<c:if test="${(map.pager.totPage > 5) && (map.pager.totPage != map.pager.curPage)}">
				<a href="fileregister?curPage=${map.pager.totPage}&searchOption=${searchOption}&keyword=${keyword}&search=${search}">[끝]</a>
			</c:if>
			</div>
        </div>
        </main>
        
      </div>
   </div>

   <!-- Footer-->
   <footer class="py-5 bg-dark" style="position : fixed;  bottom : 0; width: 100%;">
      <div class="container px-4 px-lg-5">
         <p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p>
      </div>
   </footer>

</body>

</html>