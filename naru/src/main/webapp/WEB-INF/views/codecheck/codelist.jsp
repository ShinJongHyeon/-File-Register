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
	
<script>
    $(document).ready(function() {
        $("#uploadButton").on("click", function() {
            // Get the uploaded file
            var file = $("#fileInput").prop("files")[0];

            // Create a FormData object to send the file to the server
            var formData = new FormData();
            formData.append("file", file);

            // Set up the progress bar
            var progressBar = $(".progress-bar");
            progressBar.css("width", "0%");

            // Send the file to the server using Ajax
            $.ajax({
                url: "/upload",
                type: "POST",
                data: formData,
                processData: false,
                contentType: false,
                xhr: function() {
                    // Set up the progress bar
                    var xhr = new XMLHttpRequest();
                    xhr.upload.addEventListener("progress", function(event) {
                        var percent = (event.loaded / event.total) * 100;
                        progressBar.css("width", percent + "%");
                    });
                    return xhr;
                },
                success: function() {
                    try {
                        // If the file upload was successful, call the createCodecheck function
                        $.ajax({
                            url: "/createCodecheck",
                            type: "POST",
                            data: {
                                // Pass the parameters for the createCodecheck function
                                param1: $("#param1Input").val(),
                                param2: $("#param2Input").val(),
                                param3: $("#param3Input").val(),
                                param4: $("#param4Input").val(),
                                param5: $("#param5Input").val(),
                                param6: $("#param6Input").val(),
                                param7: $("#param7Input").val(),
                                param8: $("#param8Input").val(),
                                param9: $("#param9Input").val(),
                            },
                            success: function() {
                                // If the createCodecheck function was successful, redirect the user to the next page
                                alert("Sussess creating codecheck");
                                window.location.href = "codecheck";
                            },
                            error: function() {
                                // If there was an error with the createCodecheck function, display an error message
                                alert("Error creating codecheck");
                            }
                        });
                    } catch (error) {
                        // If there was an error processing the file, display an error message
                        alert("Error processing file");
                    }
                },
                error: function() {
                    // If there was an error with the file upload, display an error message
                    alert("Error uploading file");
                }
            });
        });
    });
</script>

   <title>은행코드 등록</title>
   
   <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
   
</head>

<body>
  <%@ include file="../include/header.jsp"%>
   <main class="mt-5 pt-5"
		style="width: 1500px; margin-left: 30px; margin-bottom: 200px;">
		<div class="container-fluid px-4"
			style="width: 1500px; text-align: center;">
			<h1 class="mt-4" style="margin-bottom: 80px;">Bank Code Check</h1>

			<div class="card mb-4" style="width: 1500px; text-align: right;">
				<div class="card-header">
					<a class="btn btn-primary float-end" type=button
					 data-toggle="modal" data-target="#popup_box"
						style="margin-bottom: 30px;">파일 선택</a>
						<div class="modal fade" id="popup_box" style="margin-top:80px;">
					        <div class="modal-dialog">
					            <div class="modal-content">
					                <div class="modal-header" style="text-align: center;">
                                        <p style="font-size: 40px; text-align: center; font-weight: bold;">Excel File</p>
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
						<div class="progress" style="margin-bottom: 20px; width: 70%; margin-left: 180px">
						  <div class="progress-bar" role="progressbar"></div>
						</div>
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
				<form action="codecheck">
				  <input type="text" name="keyword" placeholder="은행코드 입력" value="${keyword}">
				  <input type="hidden" name="searchOption" value="CODECHECK_BCODE">
				  <input type="hidden" name="search" value="s">
				  <button type="submit">검색</button>
				</form>
              

            </div>
        <div class="card-body" style="text-align: center;">
       	<div class="table-responsive text-nowrap">
            <table class="table table-hover table-striped">
                <thead>
                    <tr>
                        <th>은행코드</th>
                        <th>은행명</th>
                        <th>점포명</th>
                        <th>전화번호</th>
                        <th>팩스</th>
                        <th>우편번호</th>
                        <th>주소</th>
                        <th>구분</th>
                        <th>폐쇄관리점</th>
                    </tr>
                </thead>
				<tbody>
				<c:choose>
				  <%-- 검색결과가 있을 때 --%>
				  <c:when test="${not empty map.list}">
				    <c:forEach var="row" items="${map.list}">
				      <tr >
				        <td>${row.codecheck_bcode}</td>
				        <td>${row.codecheck_bname}</td>
				        <td>${row.codecheck_bshop}</td>
				        <td>${row.codecheck_btel}</td>
				        <td>${row.codecheck_bpax}</td>
				        <td>${row.codecheck_bzipcode}</td>
				        <td>${row.codecheck_baddr}</td>
				        <td>${row.codecheck_bsection}</td>
				        <td>${row.codecheck_bspot}</td>
				      </tr>
				      <input type="hidden" id="codecheck_bcode" name="codecheck_bcode" value="${row.codecheck_bcode}" />
				    </c:forEach>
				  </c:when>
				  <%-- 검색결과가 없을 때 --%>
				  <c:when test="${map.count == 0}">
				    <tr style="text-align: center;">
				      <td colspan="9">
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
        <c:if test="${map.pager.curBlock > 1}">
				<a
					href="codecheck?curPage=1&searchOption=${searchOption}&keyword=${keyword}&search=${search}">[처음]</a>
			</c:if>
			<c:if test="${map.pager.curBlock > 1}">
				<a
					href="codecheck?curPage=${map.pager.prevPage}&searchOption=${searchOption}&keyword=${keyword}&search=${search}">[이전]</a>
			</c:if>
			
			<c:forEach var="num" begin="${map.pager.blockBegin}"
				end="${map.pager.blockEnd}">
				<c:choose>
					<c:when test="${num == map.pager.curPage}">
						<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
						<span style="color: red;">${num}</span>
					</c:when>
					<c:otherwise>
						<a href="codecheck?curPage=${num}&searchOption=${searchOption}&keyword=${keyword}&search=${search}">${num}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${map.pager.curBlock < map.pager.totBlock}">
				<a href="codecheck?curPage=${map.pager.nextPage}&searchOption=${searchOption}&keyword=${keyword}&search=${search}">[다음]</a>
			</c:if>
			<c:if test="${(map.pager.totPage > 5) && (map.pager.totPage != map.pager.curPage)}">
				<a href="codecheck?curPage=${map.pager.totPage}&searchOption=${searchOption}&keyword=${keyword}&search=${search}">[끝]</a>
			</c:if>
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