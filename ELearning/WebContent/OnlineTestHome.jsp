<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*" %>
<jsp:useBean id="question"  class="el.Question"></jsp:useBean>
<jsp:useBean id="subject"  class="el.Subject"></jsp:useBean>
<jsp:useBean id="paper"  class="el.Paper"></jsp:useBean>
<jsp:setProperty property="*" name="paper"/>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>online test</title>
<meta name="keywords" content="" />
<style>
#roundcorner
{
border:2px solid #a1a1a1;
padding:10px 40px; 
background:#dddddd;
width:300px;
border-radius:25px;
}
</style>
</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />
<body >
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
 	<td style="vertical-align: top"><jsp:include page="Header.jsp" /></td>
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
							aria-current="page" href="#">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="OnlineTestHome.jsp">onlineTest</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">About us</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="Logout.jsp">Logout</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
<div id="wrapper">
	<div id="page">
<div style="clear: both;">
<form id="form3" name="form3" method="post" >
<table width="86%"  align="center"border="0">
  <tr>
    <td colspan="2" align="center">&nbsp;</td>
    <td width="33%" rowspan="5">&nbsp;

	
<div  id="roundcorner">
  <table cellspacing="0" cellpadding="4" width="100%">
    <tbody>
      <tr>
        <td bgcolor="#f2f2f2"><strong>Note:</strong></td>
      </tr>
      <tr>
        <td><ul>
          <li>Click the 'Submit Test' button given in the bottom of this page to Submit your answers.</li>
          <li>Test will be submitted automatically if the time expired.</li>
          <li>Don't refresh the page.</li>
          <li>if option is NA don't click the option</li>
          <li>you can select only one any answer after that it will get lock</li>
        </ul></td>
      </tr>
    </tbody>
  </table>
  </div>	</td>
  </tr>
  <tr>
    <td colspan="2" align="center">&nbsp;</td>
    </tr>
  <tr align="center">
    <td width="21%"><span class="style3">Select Subject</span></td>
    <td width="46%" align="left"><select name="subjectId" id="subjectId" onchange="getPaperNameBySubjectId1(this.value);"      style=" background-color: #E5E5E5">
      <option value="">--Select--</option>
      <%  
         
          ArrayList list =subject.getListOfAllSubjectsName();
         
          
           if(list != null && list.size() > 0)
           {
               
			  	ArrayList subjectIdList = (ArrayList)list.get(0);
				ArrayList subjectNameList =(ArrayList) list.get(1);
				
		
                         
               
               for(int i=0; i < subjectIdList.size();i++)
                {
       	 %>
      <option value="<%=subjectIdList.get(i)%>"><%=subjectNameList.get(i)%></option>
      <%
			  }}
			   
			  %>
    </select></td>
  </tr>
  <tr align="center">
    <td><span class="style3">Select Paper</span></td>
    <td align="left"><select name="paperId" id="paperId" onchange="getQuestionByPaperID()"   style=" background-color: #E5E5E5">
      <option value=""  selected="selected">--Select--</option>
      <%  
         if(request.getParameter("subjectId")!=null && request.getParameter("subjectId")!=""){
          ArrayList list1 =paper.getPaperNameBySubjectId(Integer.parseInt(request.getParameter("subjectId")));
         
          
           if(list1 != null && list1.size() > 0)
           {
               
			  	ArrayList paperIdList = (ArrayList)list1.get(0);
				ArrayList paperNameList =(ArrayList) list1.get(1);
			          
               
               for(int i=0; i < paperIdList.size();i++)
                {
       	 %>
      <option value="<%=paperIdList.get(i)%>"><%=paperNameList.get(i)%></option>
      <%
			  }}
			  }
			  %>
    </select>
      <%if(request.getParameter("subjectId")!=null){%>
      <script>
			  document.getElementById('subjectId').value='<%=request.getParameter("subjectId")%>';
			  </script>
      <%}%></td>
  </tr>
  <tr align="center">
    <td colspan="2"><input type="button"  name="Start Test" value="Start Test" onclick="startTest();" /></td>
  </tr>
</table>
</form>
</div>
  </div>
</div>
<style>
.footer {
	position: fixed;
	bottom: 0;
	width: 100%;
	height: 60px; 
	background: #6cf;
}
</style>
<footer class="footer">
		<div>
			<span><%@ include file="Footer.jsp"%></span>
		</div>
	</footer>
	<script>
function startTest(){
	var subid=document.form3.subjectId.value;
	var pid=document.form3.paperId.value;
	if(subid=="" && subid==0){
		document.form3.subjectId.focus();
		
		return;
	}
	if(pid==""){
		document.form3.paperId.focus();
		return;
	}
	var url="OnlineTest.jsp?subjectId="+subid+"&paperId="+pid+"&pageFlag=0";
	window.open(url,"OnlineTest","status=1,toolbar=0");
}
</script>
<script>
function getPaperNameBySubjectId1(value)
{
  //alert(value);
document.form3.action="OnlineTestHome.jsp?subjectId="+value;

document.form3.submit();

}
</script>
</body>
</html>
