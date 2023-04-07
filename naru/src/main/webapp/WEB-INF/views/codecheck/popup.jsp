<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	$(document).ready(function() {
		  // Get the uploaded file
		  var fileInput = document.getElementById("fileInput");
		  var file = null;
		  fileInput.addEventListener("change", function(e) {
		    file = e.target.files[0];
		  });
	
		  $("#uploadButton").on("click", function() {
		    // Check if a file has been selected
		    if (!file) {
		      alert("파일을 선택해주세요.");
		      return;
		    }
	
		    // Check if the file is a valid Excel file
		    if (
		      !file.type ||
		      ![
		        "application/vnd.ms-excel",
		        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
		      ].includes(file.type)
		    ) {
		      alert("엑셀 파일(.xls, .xlsx)만 업로드 가능합니다.");
		      return;
		    }
	
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
		      success: function(response) {
		        try {
		          // If the file upload was successful, parse the data and call the saveData function
		          var workbook = XLSX.read(response, { type: "binary" });
		          var worksheet = workbook.Sheets[workbook.SheetNames[0]];
		          var data = XLSX.utils.sheet_to_json(worksheet, { header: 1 });
		          saveData(data);
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
	
		  // Function to save the parsed data to the database
		  function saveData(data) {
		    // Loop through the rows of data and save each row to the database
		    for (var i = 1; i < data.length; i++) {
		      var row = data[i];
		      var param1 = row[0];
		      var param2 = row[1];
		      var param3 = row[2];
		      var param4 = row[3];
		      var param5 = row[4];
		      var param6 = row[5];
		      var param7 = row[6];
		      var param8 = row[7];
		      var param9 = row[8];
	
		      $.ajax({
		        url: "/createCodecheck",
		        type: "POST",
		        data: {
		          // Pass the parameters for the saveData function
		          param1: param1,
		          param2: param2,
		          param3: param3,
		          param4: param4,
		          param5: param5,
		          param6: param6,
		          param7: param7,
		          param8: param8,
		          param9: param9
		        },
		        success: function(response) {
		          // If the row was saved successfully, do nothing
		        },
		        error: function() {
		          // If there was an error saving the row, display an error message
		          alert("Error saving data");
		        }
		      });
		    }
		    // Display a success message once all the rows have been saved
		    alert("데이터가 성공적으로 저장되었습니다.");
</script>

</head>
<body>
	<div class="modal fade" id="popup_box">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <p>헤더 부분</p>
                </div>
                <div class="modal-body">
                    <p>바디 부분</p>
                </div>
                <div class="modal-footer">
                    <p>테일부분</p>
                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                </div>
            </div>            
        </div>
    </div>
</body>
</html>