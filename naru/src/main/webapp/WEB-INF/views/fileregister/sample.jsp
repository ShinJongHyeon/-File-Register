<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 모달창 버튼 -->
		<button id="modalButton" class="btn btn-primary">Edit Data</button>

		<!-- 모달창 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">Edit Data</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<div class="modal-body">
				<!-- 수정할 데이터를 출력할 테이블 -->
				<table class="table table-bordered" id="data-table">
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
						<!-- 수정 버튼 -->
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<!-- 여기에 데이터가 동적으로 추가됩니다 -->
				</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary" id="save-changes">Save Changes</button>
			</div>
			</div>
		</div>
		</div>
		
</body>
</html>