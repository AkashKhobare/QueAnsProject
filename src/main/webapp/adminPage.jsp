<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<body>
	<input type="text" name="question" id="question">
	<input type="text" name="answer" id="answer">
	<button id="submit">submit</button>

	<br />
	<br />

	<div>
		<table id="queAnsTable" border="1">
			<thead>
				<tr>
					<th>id</th>
					<th>que</th>
					<th>ans</th>
					<th>action</th>
				</tr>
			</thead>
		</table>
	</div>
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
									method : "POST",
									data : jsonData,
									success : function(response) {
										//alert("You will now be redirected");
										console.log(response.d + "added");
										location.reload();
									},
									failure : function(response) {
										alert("something went wrong");
										console.log("failed adding");
										//location.href = "http://localhost:8080/QueAnsProject/adminPage.jsp";
									}
								})
					});

	$(document)
			.ready(
					function() {
						$
								.get(
										"http://localhost:8080/QueAnsProject/rest/services/viewAllQueAns",
										function(data, status) {
											console.log(data[0].queId);
											showDataInTable(data);
										});
					});

	function showDataInTable(data) {
		var d = "";
		for (var i = 0; i < data.length; i++) {
			var queId = data[i].queId;
			var question = data[i].question;
			var answer = data[i].answer;

			d += "<tr><td>"
					+ queId
					+ "</td><td>"
					+ question
					+ "</td><td>"
					+ answer
					+ "</td><td><button onclick='edit("
					+ queId
					+ ")'>edit</button></td><td><button onclick='delete()'>delete</button></td></tr>";
		}

		$("#queAnsTable").append(d);
	}

	function edit(queId) {
		console.log(queId);
	}
</script>
</html>