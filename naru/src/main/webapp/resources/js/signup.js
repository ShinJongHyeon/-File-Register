
//숫자입력
function onlyNumber() {
	if ((event.keyCode < 48) || (event.keyCode > 57)) {
		event.returnValue = false;
	}
}


    
//회원가입 버튼
function doSignup() {
	var member_id = $("#member_id").val();
	var member_name = $("#member_name").val();
	var member_pwd = $("#member_pwd").val();
	var member_email = $("#str_email01").val() + "@" + $("#str_email02").val();
	var member_pass = $("#member_pass").val();
	
	if (!$("#member_id").val() || !$("#member_name").val() || !$("#member_pwd").val()|| !$("#member_email").val()) {
		swal("", "필수항목이 비어있습니다. 입력해주세요.", "warning");
	} else {
		
		$.ajax({
			type: "POST",
			url: "join",
			data: {
				"member_id": member_id,
				"member_name": member_name,
				"member_pwd": member_pwd,
				"member_email": member_email,
				"member_pass" : member_pass

			},
			success: function(data) {
				alert("회원가입 완료");
				window.location.href = "login";
			}
		});
	}
}

