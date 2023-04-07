//회원탈퇴
function delM(v){
	var idv = $(v).attr("name");
	
	swal({
		icon : "warning",
		text : "정말 삭제 하시겠습니까?",
		closeOnClickOutside : false,
		closeOnEsc : false,
		buttons : [ "돌아가기", "삭제하기" ],
	}).then(function(isConfirm) {
		if (isConfirm) {
				$.ajax({
					type : "POST",
					url : "delMem",
					data : { "member_id" : idv },
					dataType : "JSON",
					success : function(data) {
						swal("", "회원 정보가 삭제 되었습니다.", "success").then(function(isConfirm){
							location.reload();
						});
					}		
				});	
		}
	})
}

//관리자 회원 삭제
function delMember2(member_id) {
	swal({
		icon : "warning",
		text : "회원탈퇴",
		closeOnclickOutsize : false,
		closeOnEsc : false,
		buttons : ["취소", "탈퇴 완료"],
	}).then(function(isConfirm) {
		swal("탈퇴 완료", "회원정보를 삭제했습니다.").then(function(inConfirm) {
			$.ajax({
				type : "GET",
				url : "delMember2",
				data : {
					"member_id" : member_id
				},
				success : function(data) {
					window.location.href="memberList";
				}
			});
		});
	});
}

//회원 수정
function doModifyMember(){	
	var member_id = $("#member_id").val();
	var member_name = $("#member_name").val();
	var member_email = $("#member_email").val();
	console.log(member_name);
	
	swal({
		icon : "warning",
		text : "정말 수정 하시겠습니까?",
		closeOnClickOutside : false,
		closeOnEsc : false,
		buttons : [ "돌아가기", "수정하기" ],
	}).then(function(isConfirm) {
		if (isConfirm) {
			$.ajax({
				type : "POST",
				url : "modifyMember2",
				data : {
				"member_id" : member_id,
				"member_name" : member_name,
				"member_email" : member_email		
				},
				success : function(data) {
					swal("", "수정에 성공했습니다.", "success")
					.then(function(isConfirm) {
						if (isConfirm) {
							location.href = "memberList";
						}
					})					
				}
			});
		}
	})
	
}
