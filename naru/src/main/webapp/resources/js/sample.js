
   function openModal(selectedDate) {
	var modal = document.getElementById("myModal");
	var modalBody = document.getElementById("modalBody");
	
	// 현재 선택된 날짜의 데이터 가져오기
	$.ajax({
	  type: "POST",
	  url: "/listAllFileregister",
	  data: {selectedDate: selectedDate},
	  success: function(data) {
		// 모달창에 데이터 출력하기
		var modalContent = "";
		modalContent += "<table>";
		modalContent += "<tr>";
		modalContent += "<th>날짜</th>";
		modalContent += "<th>블록번호</th>";
		modalContent += "<th>처리번호</th>";
		modalContent += "<th>수표종류</th>";
		modalContent += "<th>상태</th>";
		modalContent += "<th>검사번호</th>";
		modalContent += "<th>가맹점코드</th>";
		modalContent += "<th>화폐종류</th>";
		modalContent += "<th>금액</th>";
		modalContent += "<th>이미지경로</th>";
		modalContent += "<th>생성날짜</th>";
		modalContent += "<th>생성시간</th>";
		modalContent += "<th>생성자</th>";
		modalContent += "</tr>";
		$.each(data, function(index, value) {
		  modalContent += "<tr>";
		  modalContent += "<td><input type='date' name='fileregister_currentdate' value='" + value.fileregister_currentdate + "'></td>";
		  modalContent += "<td><input type='text' name='fileregister_blocknumber' value='" + value.fileregister_blocknumber + "'></td>";
		  modalContent += "<td><input type='text' name='fileregister_handlenumber' value='" + value.fileregister_handlenumber + "'></td>";
		  modalContent += "<td><input type='text' name='fileregister_billtype' value='" + value.fileregister_billtype + "'></td>";
		  modalContent += "<td><input type='text' name='fileregister_state' value='" + value.fileregister_state + "'></td>";
		  modalContent += "<td><input type='text' name='fileregister_checknumber' value='" + value.fileregister_checknumber + "'></td>";
		  modalContent += "<td><input type='text' name='fileregister_shopcode' value='" + value.fileregister_shopcode + "'></td>";
		  modalContent += "<td><input type='text' name='fileregister_moneytype' value='" + value.fileregister_moneytype + "'></td>";
		  modalContent += "<td><input type='text' name='fileregister_price' value='" + value.fileregister_price + "'></td>";
		  modalContent += "<td><input type='text' name='fileregister_imagepath' value='" + value.fileregister_imagepath + "'></td>";
		  modalContent += "<td><input type='text' name='fileregister_createdate' value='" + value.fileregister_createdate + "'></td>";
		  modalContent += "<td><input type='text' name='fileregister_createtime' value='" + value.fileregister_createtime + "'></td>";
		  modalContent += "<td><input type='text name='fileregister_creator' value='" + value.fileregister_creator + "'></td>";
  modalContent += "</tr>";
  });
  modalContent += "</table>";
  modalBody.innerHTML = modalContent;
  modal.style.display = "block";
  },
  error: function(jqXHR, textStatus, errorThrown) {
  alert("에러 발생!");
  console.log(jqXHR.responseText);
  }
  });
  }
  
  function closeModal() {
  var modal = document.getElementById("myModal");
  modal.style.display = "none";
  }
  
  window.onclick = function(event) {
  var modal = document.getElementById("myModal");
  if (event.target == modal) {
  modal.style.display = "none";
  }
 }
  
  
  
  
	$(document).ready(function() {
	  // 모달창 띄우기
	  $('#modalButton').on('click', function() {
		// 데이터 불러오기
		$.ajax({
		  type: "GET",
		  url: "url-to-get-data",
		  data: {
			// 선택된 날짜
			selectedDate: selectedDate,
			// 기타 필요한 파라미터
			// ...
		  },
		  success: function(response) {
			// 불러온 데이터를 테이블에 출력
			$('#data-table tbody').empty();
			for (var i = 0; i < response.length; i++) {
			  var row = '<tr>' +
				'<td>' + response[i].column1 + '</td>' +
				'<td>' + response[i].column2 + '</td>' +
				'<td><button type="button" class="btn btn-warning btn-edit" data-id="' + response[i].id + '">Edit</button></td>' +
				'</tr>';
			  $('#data-table tbody').append(row);
			}
  
			// 수정 버튼 클릭 시
			$('.btn-edit').on('click', function() {
			  var id = $(this).data('id');
			  // TODO: 해당 데이터의 수정 창을 띄우는 코드 작성
			});
		  }
		});
	 // 모달창 띄우기
  $('#myModal').modal('show');
	  });
	});
	
	
	
	
	