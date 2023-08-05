<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*,el.*" errorPage=""%>
<jsp:useBean id="checkreg" class="el.Login" />
<jsp:setProperty name="checkreg" property="*" />
<%
boolean flag = checkreg.checkReg();
if(flag == true)
{
	response.sendRedirect("Login.jsp");
}else
{
	session.setAttribute("message",checkreg.getMessage());
	response.sendRedirect("Register.jsp");
}
%>
