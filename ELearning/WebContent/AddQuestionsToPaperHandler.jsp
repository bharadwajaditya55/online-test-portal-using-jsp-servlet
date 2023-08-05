<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="paper" class="el.Paper"/>
<jsp:setProperty name="paper" property="*"/>
<%

paper.addQuestionToPaper();

session.setAttribute("message",paper.getMessage());
String sid3=request.getParameter("paperId");
response.sendRedirect("AddQuestionsToPaper.jsp?subjectId="+request.getParameter("subjectIdDrop")+"&paperId="+sid3);
 

%>