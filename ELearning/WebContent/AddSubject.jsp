<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add subject</title>
<style type="text/css">

body {
margin-left: 0px;
margin-top: 0px;
margin-right: 0px;
margin-bottom: 0px;
}
.style3 {
	font-size: 18px;
	color: #000000;
}
.style5 {color: #000000}
.style7 {color: #FF0000}
.style9 {font-size: 18px; color: #000000; font-weight: bold; }
</style></head>
<body>
<table width="100%" height="500" border="0" cellpadding="0" cellspacing="0">
  <tr height="100">
    <td style="vertical-align:top"><jsp:include page="Header.jsp"/></td>
  </tr>
  <tr >
    <td ><jsp:include page="Menu.jsp"/></td>
  </tr>
  <tr height="420">
    <td bordercolor="#00FFFF" bgcolor="#D8EAFC" ><form name="form1" method="post" >
      <div align="center">
        <table  align="center" bgcolor="#D8EAFC" width="50%" border="1"  >
		<tr> <td colspan="2" align="center" bgcolor="#D8EAFC"> <span class="style9"> Add Subject Information </span></td>
		 
		</tr>
          <% if(session.getAttribute("message") != null) 
           { 
         %>
          <tr bordercolor="#990000">
            <td colspan="2" align="center" bgcolor="#D8EAFC" class="style7"><%=session.getAttribute("message")%> </td>
          </tr>
          <%
          	session.removeAttribute("message");
           } 
        %>
          <tr>
            <td width="43%" height="33" class="style3">Subject Name </td>
            <td colspan="2"><input name="subjectName" type="text" class="style3" id="subjectName">            </td>
          </tr>
          <tr>
            <td class="style3">Subject Description </td>
            <td colspan="2"><span class="style5 style5">
              <textarea name="description"  id="description"></textarea>
            </span> </td>
          </tr>
          <tr>
            <td colspan="3" align="center"><span class="style5">
              <label>
              <input name="Add" align="left" type="submit" id="Add"  onClick="submitSubject();"value="Add">
              </label>
              <label>
              <input name="Reset" type="Reset" id="Reset" value="Reset">
              </label>
              <label>
              <input name="Exit" type="button" id="Exit" value="Exit" onClick="self.location='AdminHome.jsp'">
              </label>
            </span></td>
          </tr>
        </table>
      </div>
    </form> </td>
  </tr>
  <tr height="50">
    <td><jsp:include page="Footer.jsp"/></td>
  </tr>
</table>
<script>
function submitSubject(){
	
var name=document.form1.subjectName.value;
var description=document.form1.description.value;

if(name=="" || name=="null"){
alert("Please fill Name");
document.form1.name.focus();
return;
}
if(description=="" || description=="null"){
alert("Please fill description");
document.form1.description.focus();
return;
}
document.form1.action="AddSubjectHandler.jsp";
document.form1.submit();
}
</script>
</body>
</html>