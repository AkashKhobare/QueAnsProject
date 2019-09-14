<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<body>
	<form method = "post">
		<input type="text" name="question" id="question"> <input
			type="text" name="answer" id="answer">
		<button id="submit">submit</button>
	</form>
</body>
<script>
	$("#submit")
			.click(
					function() {
						var que = $("#question").val();
						var ans = $("#answer").val();

						var data = {
							question : que,
							answer : ans
						}

						jsonData = JSON.stringify(data);
						console.log(jsonData);

						$
								.ajax({
									url : "http://localhost:8080/QueAnsProject/rest/services/addQueAns",
									type : "post",
									data : jsonData,
									success : function(result) {
										console.log(result + "........");
										if(result === "no_errors") {
											window.location = "success.jsp";
										}									
									},
									error : function() {
										console.log("something went wrong");
									}
								});
					});
</script>
</html>