<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
<body bgcolor="#D8EAFC">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <div>
		<span style="vertical-align: top"><jsp:include
				page="Header.jsp" /></span>
	</div>
    <div class="container " background-color:"#D8EAFC">
        <main class= background-color:"#D8EAFC" >
            <div class="container my-5" bgcolor="#D8EAFC">
                <div class="row" bgcolor="#D8EAFC">
                    <div class="col-md-4 offset-md-4">
                        <div class="card bg-light text-dark">
                            <div class="card-header">
                                <p>Register-Here</p>
                            </div>
                            <div class="card-body">
                                <form  name = "reg"  method="post">
                                    <div class="mb-3">
                                        <label for="user_name" class="form-label" >user_name</label>
                                        <input type="text" class="form-control" id = "userId" name = "userId"
                                            aria-describedby="emailHelp" placeholder="enter name" />
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Email address</label>
                                        <input type="email" class="form-control" id="em" name = "em"
                                            aria-describedby="emailHelp" placeholder="example@gmail.com" />
                                        <div class="form-text">
                                            We'll never share your email with anyone else.
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">Password</label>
                                        <input type="password" class="form-control" id="pass" name = "pass"/>
                                    </div>
                                    <div class="mb-3">
                                        <label for="userType">select userType</label> <br />
                                        <input type="radio" id="userType" name="userType" value="student" />
                                        Student
                                        <input type="radio" id="userType" name="userType" value="teacher" />Teacher
                                    </div>
                                    <button type="submit" value="submit" class="btn btn-primary" onClick= "submitform();" >
                                        Submit
                                    </button>
                                    <%
									if (session.getAttribute("message") != null) {
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
      function submitform()
      {
    	  var name = document.reg.userId.value;
    	  var em = document.reg.em.value;
    	  var pass = document.reg.pass.value;
    	  var userType = document.reg.userType.value;
    	  var namepattern = /^[a-zA-Z]+$/;
    	  var pswdpattern = /^[a-zA-Z0-9]{6,}$/;
    	  var emailpattern = /^[a-zA-Z]+@[a-zA-Z]{3,}(.com|.in|.org)$/;
    	  var userTypepattern = /^(student|teacher)$/;
    	  if (!namepattern.test(name)) {
              alert("Invalid Name");
              return ;
            }
    	  if (!emailpattern.test(em)) {
              alert("Invalid Email");
              return ;
    	  }
    	  if (!pswdpattern.test(pass)) {
              alert("Invalid Password");
              return ;
    	  }if (!userTypepattern.test(userType)) {
              alert("please select any one option");
              return ;
    	  }
    	  document.reg.action="handleregister.jsp";
    	  document.reg.submit();
      }
</script>
</html>