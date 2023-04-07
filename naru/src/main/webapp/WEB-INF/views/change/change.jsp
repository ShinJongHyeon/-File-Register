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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/smoothness/jquery-ui.css" />
	

   <title>작업일자(교환일) 관리</title>

   <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>

<script>
	$(function() {
		  // datepicker 설정
		  $("#datepicker").datepicker({
		    dateFormat: "yy-mm-dd",
		    showOtherMonths: true,
		    showMonthAfterYear: true,
		    changeYear: true,
		    changeMonth: true,
		    yearSuffix: "년",
		    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
		  });
	
		  $('#datepicker').datepicker('setDate', 'today+1D');
	
		  // submit 버튼 클릭 시 form 제출
		  $("#date-form").submit(function(e) {
		    e.preventDefault(); // 기본 제출 동작 방지
		    var selectedDate = $("#datepicker").val(); // 선택된 날짜 값 가져오기
		    console.log("선택된 날짜: ", selectedDate);
		    alert('선택된 날짜: ' + selectedDate);
	
		    // 업데이트를 위해 ajax로 서버로 데이터 전송
		    $.ajax({
		      url: "/updateFileregister",
		      type: "POST",
		      data: {
		        fileregister_currentdate: selectedDate
		      },
		      success: function(result) {
		        alert("작업일자(교환일) 설정 완료!");
		        console.log(result);
		      },
		      error: function(xhr, status, error) {
		        alert("작업일자(교환일) 설정 실패..");
		        console.error(xhr, status, error);
		      }
		    });
		  });
		});

</script>

<body>

    <%@ include file="../include/header.jsp"%>
    
   <main class="mt-5 pt-5"
		style="width: 1500px; margin-left: 30px; margin-bottom: 200px;">
		<div class="container-fluid px-4" style="width: 1500px; text-align: center;">
			<h1 class="mt-4" style="margin-bottom: 100px;">작업일자(교환일) 관리</h1>

			<div class="card mb-4" style="width: 1500px;">
				<div class="card-header">
				<form id="date-form">
                    <label for="datepicker">작업일자(교환일) 선택 : </label>
                    <input type="text" id="datepicker" name="selectedDate">
                    <button type="submit" id="submit-btn">적용</button>
                </form>
            
        <div class="card-body" style="text-align: center;">
        <div class="table-responsive text-nowrap">
            <table class="table table-hover table-striped">
                <thead>
                    <tr>
                        <th style="color:red;">작업일자</th>
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