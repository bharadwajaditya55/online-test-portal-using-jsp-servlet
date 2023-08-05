<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="subject" class="el.Subject"/>
<jsp:setProperty name="subject" property="*"/>
<%
subject.updateSubject();
session.setAttribute("message",subject.getMessage());
response.sendRedirect("SubjectList.jsp");
%>
