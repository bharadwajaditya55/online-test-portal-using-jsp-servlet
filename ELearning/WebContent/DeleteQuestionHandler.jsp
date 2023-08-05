<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="question" class="el.Question"/>
<jsp:setProperty name="question" property="*"/>
<%
question.deleteQuestion();
session.setAttribute("message",question.getMessage());
response.sendRedirect("ViewQuestionSId.jsp?subjectId="+request.getParameter("subjectId"));
 

%>
