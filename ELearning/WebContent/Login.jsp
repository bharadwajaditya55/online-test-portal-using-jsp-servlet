<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.style3 {
	font-size: 18px;
}
</style>
</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />
<body bgcolor="#D8EAFC">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
		<div>
		<span style="vertical-align: top"><jsp:include
				page="Header.jsp" /></span>
	</div>
	<div class="container ">
        <main class= >
            <div class="container my-5">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card bg-light text-dark">
                            <div class="card-header">
                                <p>Login-Here</p>
                            </div>
                            <div class="card-body">
                                <form name = "log" method="post">
                                    <div class="mb-3">
                                        <label for="user_name" class="form-label" >user_name</label>
                                        <input type="text" class="form-control" id = "userId" name = "userId"
                                            aria-describedby="emailHelp" placeholder="enter name" />
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">Password</label>
                                        <input type="password" class="form-control" id="pass" name = "pass" />
                                    </div>
                                    <div class="mb-3">
                                        <label for="userType">select userType</label> <br />
                                        <input type="radio" id="userType" name="userType" value="student" />
                                        Student
                                        <input type="radio" id="userType" name="userType" value="teacher" />Teacher
                                    </div>
                                    <button type="submit" value="submit" class="btn btn-primary" onClick= "submitform12();">
                                        Submit
                                    </button>
                                    <% if(session.getAttribute("message") != null) 
           { 
         %>   
		  <%=session.getAttribute("message")%>

									<%
          	session.removeAttribute("message");
           } 
        %>
								</form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
	<div class = "container">
	<footer class="footer" align = "down">
		<div>
			<span><%@ include file="Footer.jsp"%></span>
		</div>
	</footer></div>
</body>
<script>
function submitform12()
{
	  var name = document.log.userId.value;
	  var pass = document.log.pass.value;
	  var userType = document.log.userType.value;
	  var namepattern = /^[a-zA-Z]+$/;
	  var pswdpattern = /^[a-zA-Z0-9]{6,}$/;
	  var userTypepattern = /^(student|teacher)$/;
	  if (!namepattern.test(name)) {
        alert("Invalid Name");
        return ;
      }
	  if (!pswdpattern.test(pass)) {
        alert("Invalid Password");
        return ;
	  }if (!userTypepattern.test(userType)) {
        alert("please select any one option");
        return ;
	  }
	  document.log.action="LoginHandler.jsp";
	  document.log.submit();
}
</script>
</html>