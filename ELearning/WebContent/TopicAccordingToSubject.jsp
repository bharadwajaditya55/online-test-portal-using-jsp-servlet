<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*,java.util.*,el.*" errorPage=""%>
	<jsp:useBean id="topic"  class="el.Topic"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<title>Student's Site</title>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<body>
	<div>
		<span style="vertical-align: top"><jsp:include
				page="Header.jsp" /></span>
	</div>
	<div class = "container">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">Testbea</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="index.jsp">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="#">register</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								login </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="OnlineTestHome.jsp">student
										login</a></li>
								<li><a class="dropdown-item" href="Login.jsp">faculty
										login</a></li>
							</ul></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">About us</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">contact us</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<div class="container">
	    <h3>Topics available: </h3>
		<ul class="list-group list-group-flush" style = "float: left">
			<jsp:include page="UserTopic.jsp"/>
		</ul>
	</div>
	<div id="content" style=" float : left ">
		<%
		if(request.getParameter("topicId")!=null){
			System.out.println("ssssssssssss----------------"+topic.getContentByTopicId(Integer.parseInt(request.getParameter("topicId"))));
		%>
		<%=topic.getContentByTopicId(Integer.parseInt(request.getParameter("topicId")))%>
		<%
		}
		%>
		 
	  </div>
	<div>
	<img src="exam.jpg" alt="exam" style="float: right" width="1000" ></div>	
	<div class = "container">
	<footer class="footer" align = "down">
		<div>
			<span><%@ include file="Footer.jsp"%></span>
		</div>
	</footer></div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>
