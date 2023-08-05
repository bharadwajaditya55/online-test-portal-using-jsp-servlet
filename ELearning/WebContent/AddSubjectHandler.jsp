<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="addsubject" class="el.Subject"/>
<jsp:setProperty name="addsubject" property="*"/>
<%
addsubject.addSubject();
session.setAttribute("message",addsubject.getMessage());
response.sendRedirect("AddSubject.jsp");
%>
