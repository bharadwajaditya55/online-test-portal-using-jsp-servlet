<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="paper" class="el.Paper"/>
<jsp:setProperty name="paper" property="*"/>
<%
paper.addPaper();
session.setAttribute("message",paper.getMessage());
response.sendRedirect("AddPaper.jsp?subjectId="+request.getParameter("subjectId"));
 

%>