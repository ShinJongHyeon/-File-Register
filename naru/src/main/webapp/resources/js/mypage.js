var checkPWD = false;
$(document).ready(function() {
	$("#member_pwd").keyup(function() {
		$("#checkPasswd").text("");
	});
	
	$("#chk_member_pwd").keyup(function() {
		var checkText = $("#checkPasswd");
		if ($("#member_pwd").val() == "" || $("#chk_member_pwd").val() == "") {
			checkText.css("color", "red");
			checkText.text("필수정보입니다.");
			checkPWD = false;
		} else if ($("#member_pwd").val() != $("#chk_member_pwd").val()) {
			checkPWD = false;
			checkText.text("패스워드가 동일하지 않습니다.");
			checkText.css("color", "red");
		} else {
			checkPWD = true;
			checkText.text("패스워드가 동일합니다.");
			checkText.css("color", "green");
		}
	});

	$("#email_select").change(function() {
		if ($("#email_select").val() == "1") {
			$("#email_addr").val("");
			$("#email_addr").prop("disabled", false);
		} else if ($("#email_select").val() == "") {
			$("#email_addr").val("");
			$("#email_addr").prop("disabled", true);
		} else {
			$("#email_addr").val($("#email_select").val());
			$("#email_addr").prop("disabled", true);
		}
	});



})

// 숫자입력
function onlyNumber(){
	if((event.keyCode<48)||(event.keyCode>57)) {
		event.returnValue=false;
	}
}

// 회원정보 수정
function myinfoUp() {
	var member_id = $("#member_id").val();
	var member_pwd = $("#member_pwd").val();
	var member_email = $("#email_id").val() + "@" + $("#email_addr").val();
	var myp = $("#myp").val();
	if ( (member_pwd == "" || member_pwd == null) && ($("#chk_member_pwd").val()  == "" || $("#chk_member_pwd").val() == null) ) {
		swal({
			icon : "warning",
			text : "정말 수정 하시겠습니까?",
			closeOnClickOutside : false,
			closeOnEsc : false,
			buttons : [ "돌아가기", "수정 완료!" ],
		}).then(function(isConfirm) {
			if (isConfirm) {
				swal('수정 완료!', '회원정보 수정을 완료했습니다.^^', 'success').then(function(isConfirm) {
					$.ajax({
						type : "POST",
						url : "mypage3b",
						data : {
							"member_id" : member_id,
							"member_email" : member_email,
							"myp" : myp
						},
						success : function(data) {
							console.log(member_id);
							console.log(myp);
							window.location.href = "mypage?member_id=" + member_id + "&myp=" + myp;
						},
						error : function(data) {
							console.log(member_id);
							console.log(myp);
						}
					});
				});
			}
		})
	}
	else if (checkPWD == false) {
		swal("", "필수항목이 비어있습니다. 입력해주세요.", "warning");
	} else {
		swal({
			icon : "warning",
			text : "정말 수정 하시겠습니까?",
			closeOnClickOutside : false,
			closeOnEsc : false,
			buttons : [ "돌아가기", "수정 완료!" ],
		}).then(function(isConfirm) {
			if (isConfirm) {
				swal('수정 완료!', '회원정보 수정을 완료했습니다.^^', 'success').then(function(isConfirm) {
					$.ajax({
						type : "POST",
						url : "mypage3",
						data : {
							"member_id" : member_id,
							"member_pwd" : member_pwd,
							"member_email" : member_email,
							"myp" : myp
						},
						success : function(data) {
							console.log(member_id);
							console.log(myp);
							window.location.href = "mypage?member_id=" + member_id + "&myp=" + myp;
						},
						error : function(data) {
							console.log(member_id);
							console.log(myp);
						}
					});
				});
			}
		})
	}
}


/*function memberUp() {
	var member_pass = $("member_pass").val();
	
	
	if (checkPWD != false) {
		swal("", "필수항목이 비어있습니다. 입력해주세요.", "warning");
	} else {
		swal({
			icon : "warning",
			text : "정말 수정 하시겠습니까?",
			closeOnClickOutside : false,
			closeOnEsc : false,
			buttons : [ "돌아가기", "수정 완료!" ],
		}).then(function(isConfirm) {
			if (isConfirm) {
				swal('수정 완료!', '회원정보 수정을 완료했습니다.^^', 'success').then(function(isConfirm) {
					$.ajax({
						type : "POST",
						url : "updateMember2",
						data : {
							"member_pass" : member_pass
						},
						success : function(data) {
							console.log(member_pass);
								window.location.href="memberList";
						},
						error : function(data) {
							console.log(member_pass);
						}
					});
				});
			}
		})
	}
}*/

function memberUp() {
    var member_pass = $("#member_pass").val();
    var member_id = $("#member_id").val();

    if (member_pass == "") { // check if member_pass is empty
        swal("", "필수항목이 비어있습니다. 입력해주세요.", "warning");
    } else {
        swal({
            icon: "warning",
            text: "정말 수정 하시겠습니까?",
            closeOnClickOutside: false,
            closeOnEsc: false,
            buttons: ["돌아가기", "수정 완료!"],
        }).then(function(isConfirm) {
            if (isConfirm) {
                swal('수정 완료!', '회원정보 수정을 완료했습니다.^^', 'success').then(function(isConfirm) {
                    $.ajax({
                        type: "POST",
                        url: "updateMember2",
                        data: {
                            "member_id": member_id,
                            "member_pass": member_pass
                        },
                        success: function(data) {
                            console.log(data);
                            window.location.href = "memberList";
                        },
                        error: function(data) {
                            console.log(data);
                        }
                    });
                });
            }
        });
    }
}