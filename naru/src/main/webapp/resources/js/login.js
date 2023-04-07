//로그인

function memberCheck() {
	var member_id=$("#member_id").val();
	var member_pwd=$("#member_pwd").val();
	if (!member_id || !member_pwd) {
		swal("", "아이디 혹은 패스워드를 입력해주세요.", "error");
	} else {
		$.ajax({
			type : "POST",
			url : "checkMember",
			data : {
				"member_id" : member_id,
				"member_pwd" : member_pwd
			}, success : function(data) {
			 
				if (data != 0) {
					$.ajax({
						type : "POST",
						url : "login",
						data : {
							"member_id" : member_id,
							"member_pwd" : member_pwd
						}, success : function() {
							alert("로그인완료");
							window.location.href = "home";
						} 
					});
				} else {
					swal("","아이디 혹은 패스워드를 확인해주세요.","warning")
				} 
			}, error : function(data) {
				console.log(data);
			}
		});
	}	
}

//숫자입력
function onlyNumber(){
	if((event.keyCode<48)||(event.keyCode>57)) {
		event.returnValue=false;
	}
}


function logout() {
	$.ajax({
		type : "GET",
		url : "logout",
		data : {},
		success : function(data) {
			swal("로그아웃", "완료", "success");
			location.href="home";
		}
	});
}

//마이페이지 클릭 이벤트
function mypBtn() {
	var member_id = $("#mymember_id").val();
	var myp = $("#myp").val();
	$.ajax({
		type : "GET",
		url : "mypL",
		data : {
			"member_id" : member_id,
			"myp" : myp
		}, success : function(data) {
			window.location.href = "mypage?member_id=" + member_id + "&myp=" + myp;
		}
	});
}

function checkFI() {
	var member_name =$("#member_name").val();
	var member_email = $("#member_email").val();
	var popupX = (window.screen.width / 2) - 200;
	var popupY = (window.screen.height / 2) - 125;	
	if (!member_name || !member_email) {
		swal("", "이름과 이메일를 입력해주세요", "error");
	} else {
		$.ajax({
			type : "POST",
			url : "findId",
			data : {
				"member_name" : member_name,
				"member_email" : member_email
			}, success : function(data) {
				if (data != 0) {
					$.ajax({
						type : "POST",
						url : "findId2",
						data : {
							"member_name" : member_name,
							"member_email" : member_email
						}, success : function() {
							window.open("foundID", "아이디 찾기", "status = no, width = 400, height = 250, left = " + popupX + ", top = " + popupY);
						}
					});
				} else {
					swal("","이름과 이메일을 확인해주세요.","warning");
				}
			}, error : function(data) {
				console.log(data);
			}
		});
	}	
}

function checkFP() {
	member_id =$("#member_id").val();
	member_name =$("#member_name").val();
	var member_email = $("#member_email").val();
	var popupX = (window.screen.width / 2) - 400;
	var popupY = (window.screen.height / 2) - 300;	
	if (!member_name || !member_email) {
		swal("", "회원 정보를 입력해주세요", "error");
	} else {
		$.ajax({
			type : "POST",
			url : "findPassword",
			data : {
				"member_id" : member_id,
				"member_name" : member_name,
				"member_email" : member_email
			}, success : function(data) {
				if (data != 0) {
					$.ajax({
						type : "POST",
						url : "findPassword2",						
						data : {
							"member_id" : member_id,
							"member_name" : member_name,
							"member_email" : member_email
						}, success : function() {
							window.open("foundPassword", "비밀번호 찾기", "status = no, width = 400, height = 300, left = " + popupX + ", top = " + popupY);
						}
					});
				} else {
					swal("","회원 정보를 확인해주세요.","warning");
				}
			}, error : function(data) {
				console.log(data);
			}
		});
	}	
}

function changePw(){
	var member_id = $("#member_id").val();
	var member_name = $("#member_name").val();
	var member_pwd=$("#member_pwd").val();
	var member_repwd=$("#member_repwd").val();
	if(!member_pwd || !member_repwd){
		swal("","비밀번호를 입력해 주세요.","warning");
	}else if(member_pwd != member_repwd){
		swal("","비밀번호를 일치시켜 주세요.","warning");
	}else{
		$.ajax({
			type : "POST",
			url : "cpw",
			data : {
				"member_id" : member_id,
				"member_name" : member_name,
				"member_pwd" : member_pwd
			},
			success : function(data) {
				swal("","비밀번호가 변경되었습니다","success")
				.then(function(isConfirm){
					$.ajax({
						type : "GET",
						url : "emptyss",
						success : function(data) {
							self.close();
							opener.top.location = "login";	
						}
					});
				});
			}
		});
	}	
}

function fi_close(){
	$.ajax({
		type : "GET",
		url : "emptyss",
		success : function(data) {
			self.close();
			opener.top.location = "home";	
		}
	});	
}

function go_login(){
	$.ajax({
		type : "GET",
		url : "emptyss",
		success : function(data) {
			self.close();
			opener.top.location = "login";	
		}
	});	
}

function change_pw(){
	$.ajax({
		type : "GET",
		url : "emptyss",
		success : function(data) {
			self.close();
			opener.top.location = "findPassword";	
		}
	});	
}