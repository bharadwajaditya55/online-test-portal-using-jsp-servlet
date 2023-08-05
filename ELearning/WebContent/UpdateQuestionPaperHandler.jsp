<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="question" class="el.Question"/>
<jsp:useBean id="paper" class="el.Paper"/>
<jsp:useBean id="subject"  class="el.Subject"></jsp:useBean>
<jsp:setProperty name="subject" property="*"/>
<jsp:setProperty name="paper" property="*"/>
<jsp:setProperty name="question" property="*"/>

<%
question.updateQuestion();
session.setAttribute("message",question.getMessage());
String sid=request.getParameter("subjectId");
String sid2=request.getParameter("paperId");
response.sendRedirect("AddQuestionsToPaper.jsp?questionId="+request.getParameter("questionId")+"&subjectId="+sid+"&paperId="+sid2);
%>
