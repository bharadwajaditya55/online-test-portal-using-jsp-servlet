<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="question" class="el.Question"/>
<jsp:useBean id="subject"  class="el.Subject"></jsp:useBean>
<jsp:setProperty name="subject" property="*"/>
<jsp:setProperty name="question" property="*"/>
<%
question.updateQuestion();
session.setAttribute("message",question.getMessage());
String sid=request.getParameter("subjectId");
response.sendRedirect("ViewQuestionSId.jsp?questionId="+request.getParameter("questionId")+"&subjectId="+sid);
%>
