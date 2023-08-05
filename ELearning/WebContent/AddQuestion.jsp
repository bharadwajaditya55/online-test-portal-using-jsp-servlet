<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*"%>
<jsp:useBean id="subject" class="el.Subject"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AddQuestion</title>

<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.style2 {
	color: #FF0000
}

.style3 {
	color: #CC0066;
	font-weight: bold;
	font-size: 24px;
}

.style4 {
	font-size: 18px;
	font-family: "Times New Roman";
	height: 100%;
	background-color: "#D8EAFC" ;
	width: 100%;
}

.style5 {
}

.style7 {
	color: #CC0066;
}
</style>

</head>
<body bgcolor="#D8EAFC">
	<table bgcolor="#D8EAFC" width="100%"
		height="500" align="center" cellpadding="0" cellspacing="0">
		<tr height="100">
			<td width="1047" style="vertical-align: top"><jsp:include
					page="Header.jsp" /></td>
		</tr>
		<tr>
			<td><jsp:include page="Menu.jsp" /></td>
		</tr>
		<tr height="420">
			<td bordercolor="#00FFFF"><form name="form1" method="post"
					action="AddQuestionHandler.jsp">



					<table width="80%" align="center">
						<tr>
							<td colspan="3" align="center"><span class="style3">Add
									Questions </span></td>
						</tr>
						<tr>
							<td colspan="3" Align="center"><span class="style2">
									<%
									if (request.getParameter("subjectId") != null) {
									%> <script>
			  document.getElementById('subjectId').value='<%=request.getParameter("subjectId")%>
										';
									</script> <%
 }
 %> <%
 if (session.getAttribute("message") != null) {
 %> <%=session.getAttribute("message")%>
							</span></td>
						</tr>
						<%
						session.removeAttribute("message");
						}
						%>
						<tr>
							<td colspan="3"><span class="style7">Subject</span> <select
								name="subjectId" id="subjectId"
								style="background-color: #F7A6BA">
									<option selected="selected" value="">--Select--</option>


									<%
									ArrayList list = subject.getListOfAllSubjectsName();

									if (list != null && list.size() > 0) {

										ArrayList subjectIdList = (ArrayList) list.get(0);
										ArrayList subjectNameList = (ArrayList) list.get(1);

										for (int i = 0; i < subjectIdList.size(); i++) {
									%>

									<option value="<%=subjectIdList.get(i)%>"><%=subjectNameList.get(i)%></option>
									<%
									}
									}
									%>
							</select></td>
						</tr>

						<tr>
							<td><span class="style7">Question</span></td>
							<td>&nbsp;</td>
							<td><span class="style7">Options</span></td>
						</tr>
						<tr>
							<td rowspan="4" width="60%"><textarea name="question"
									wrap="soft" class="style4" cols="100" rows="13" id="question"></textarea></td>
							<td width="9%" height="67" align="center"><input
								name="answer" type="radio" value="A"> <span
								class="style7">A</span></td>
							<td width="31%"><textarea name="option1" class="style4"
									rows="3" id="option1">NA</textarea></td>
						</tr>
						<tr>
							<td width="9%" height="66" align="center"><input
								name="answer" type="radio" value="B"> <span
								class="style7"> B</span></td>
							<td width="31%"><textarea name="option2" class="style4"
									rows="3" id="option2">NA</textarea></td>
						</tr>
						<tr>
							<td width="9%" height="58" align="center"><input
								name="answer" type="radio" value="C"> <span
								class="style7"> C</span></td>
							<td width="31%"><textarea name="option3" class="style4"
									rows="3" id="option3">NA</textarea></td>
						</tr>
						<tr>
							<td width="9%" height="55" align="center"><input
								name="answer" type="radio" value="D"> <span
								class="style7"> D</span></td>
							<td width="31%"><textarea name="option4" class="style4"
									rows="3" id="option4">NA</textarea></td>
						</tr>
						<tr>
							<td colspan="3"><span class="style5">Explaination</span></td>
						</tr>
						<tr>
							<td colspan="3"><textarea name="explanation" class="style4"
									cols="160" rows="8" id="explanation">NA</textarea></td>
						</tr>
						<tr>
							<td colspan="3" align="center"><input type="submit"
								name="Submit" onClick="submitAddedQuestion();" value="Add">
								<input name="Exit" type="button" id="Exit" value="<<Back"
								onClick="exit();"></td>
						</tr>
					</table>
				</form></td>
		</tr>
		<tr height="50">
			<td><jsp:include page="Footer.jsp" /></td>
		</tr>
	</table>
	<script>
		function submitAddedQuestion() {

			var id = document.form1.subjectId.value;
			var question = document.form1.question.value;
			var option1 = document.form1.option1.value;
			var option2 = document.form1.option2.value;
			var option3 = document.form1.option3.value;
			var option4 = document.form1.option4.value;
			if (id == "" || id == "null") {
				alert("Please select subject");
				document.form1.subjectIdfocus();
				return;
			}
			if (question == "" || question == "null") {
				alert("Please fill question");
				document.form1.question.focus();
				return;
			}
			if (option1 == "" || option1 == "null") {
				alert("Please fill option1");
				document.form1.option1.focus();
				return;
			}
			if (option2 == "" || option2 == "null") {
				alert("Please fill option2");
				document.form1.option2.focus();
				return;
			}
			if (option3 == "" || option3 == "null") {
				alert("Please fill option3");
				document.form1.option3.focus();
				return;
			}
			if (option4 == "" || option4 == "null") {
				alert("Please fill option4");
				document.form1.option4.focus();
				return;
			}

			document.form1.action = "AddQuestionHandler.jsp";
			document.form1.submit();
		}
	</script>
	<script type="text/javascript" language="javascript">
		function exit() {

			// alert("are u sure to exit");

			document.form1.action = "AdminHome.jsp";
			document.form1.submit();

		}
	</script>
</body>
</html>
