<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="question" class="el.Question"/>
<jsp:setProperty name="question" property="*"/>

<%
question.addQuestion();
session.setAttribute("message",question.getMessage());
response.sendRedirect("AddQuestion.jsp?subjectId="+request.getParameter("subjectId"));
 

%>