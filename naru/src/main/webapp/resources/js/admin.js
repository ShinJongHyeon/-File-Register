$('.appro').click(function () {
        	const successId = $(this).data("member_id");
        	console.log(successId);
        	// 0 가입대기 , 1.가입승인, 2. 가입거절
        	
        	$.ajax({
        		type : 'post',
        		url : "successId",
        		data : {
            		id : successId,
            	},
            	success : function(data){
            	},error : function(status, error) {
    				console.log('에러발생!!');
    				console.log(status, error);
    			}
            	
        	});
        	});
        
        
        // 회원가입 거부
        $('.deni').click(function () {
        	const failId = $(this).data("member_id");
        	console.log(failId);
      	$.ajax({
    		type : 'post',
    		url : "failId",
    		data : {
        		id : failId,
        	},
        	success : function(data){
        	},error : function(status, error) {
				console.log('에러발생!!');
				console.log(status, error);
			}
    	});
    	});
    	

      // 가입승인 버튼 클릭시 회원가입승인
      $('.appro').click(function(){
      	const successId = $(this).data("member_id");
    	console.log(successId);
    	// 0 가입대기 , 1.가입승인, 2. 가입거절
    	
    	$.ajax({
    		type : 'post',
    		url : "successId",
    		data : {
        		id : successId,
        	},
        	success : function(data){
        	},error : function(status, error) {
				console.log('에러발생!!');
				console.log(status, error);
			}
        	
    	}); 
    	});
      
      $('.userDrop').click(function() {
		
    	  const dropId = $(this).data("member_id");
        	console.log(dropId);
           	$.ajax({
        		type : 'post',
        		url : "dropId",
        		data : {
            		id : dropId,
            	},
            	success : function(data){
            	},error : function(status, error) {
      				console.log('에러발생!!');
      				
      				console.log(status, error);
      			}
  		}); 
  	});