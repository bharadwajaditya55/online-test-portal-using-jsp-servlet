<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*,el.*" errorPage=""%>
<jsp:useBean id="login" class="el.Login" />
<jsp:setProperty name="login" property="*" />
<%
boolean yes=login.checkLogin();
String userType = request.getParameter("userType");
if(yes){ 
	if(userType.equals("teacher"))
	   response.sendRedirect("AdminHome.jsp");
	else{
	   response.sendRedirect("OnlineTestHome.jsp");
	}
}
else{
session.setAttribute("message",login.getMessage());
response.sendRedirect("Login.jsp");
}
%>