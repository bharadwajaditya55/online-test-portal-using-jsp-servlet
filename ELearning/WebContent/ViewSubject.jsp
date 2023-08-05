<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<jsp:useBean id="subject"  class="el.Subject"></jsp:useBean>
<jsp:setProperty property="subjectId" name="subject"/>
<%            subject.getRecord();        %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Subject</title>
<style type="text/css">
<!--
.style1 {font-family: "Comic Sans MS"}
.style3 {font-family: "Comic Sans MS"; font-size: 18px; }
-->
</style>
</head>
<body>
<table width="100%" height="600" border="0" cellpadding="0" cellspacing="0">
  <tr height="100">
    <td style="vertical-align:top"><jsp:include page="Header.jsp"/></td>
  </tr>
   <tr >
    <td ><jsp:include page="Menu.jsp"/></td>
  </tr>
 
  <tr height="420">
    <td bordercolor="#00FFFF" bgcolor="#D8EAFC">
	<form name="form1" method="post" action="SubjectList.jsp">
	  <table width="60%"   align="center" bordercolor="#ffffff">
        <tr bordercolor="#990000">
          <td colspan="2" align="center" bgcolor="#00CCFF"><strong class="style3">View Subject Information </strong></td>
        </tr>
		  <% if(session.getAttribute("message") != null) 
           { 
         %>   
        
		<%
          	session.removeAttribute("message");
           } 
        %> 
        <tr>
          <td width="50%" bordercolor="#990000" bgcolor="#00CCFF" class="style3">SubjectId</td>
          <td width="50%" bgcolor="#00CCFF"><label><span class="stylegrey"><%=subject.getSubjectId()%></span>     
          </label></td>
        </tr>
        <tr>
          <td bordercolor="#990000" bgcolor="#00CCFF" class="style3">SubjectName</td>
          <td bgcolor="#00CCFF"><label><%=subject.getSubjectName()%>
          
          </label></td>
        </tr>
		 <tr>
          <td bordercolor="#990000" bgcolor="#00CCFF" class="style3">SubjectDescription</td>
          <td bgcolor="#00CCFF"><%=subject.getDescription()%>
          <tr bordercolor="#990000">
          <td colspan="2" align="center" bgcolor="#00CCFF">
            <input  type="button" name="Submit" value="<<Back" onClick="window.location.href='SubjectList.jsp'">
            
         </td>
        </tr>
      </table>
        </form>
    </td>
  </tr>
  <tr height="100">
    <td><jsp:include page="Footer.jsp"/></td>
  </tr>
</table>
</table>
</body>
</html>