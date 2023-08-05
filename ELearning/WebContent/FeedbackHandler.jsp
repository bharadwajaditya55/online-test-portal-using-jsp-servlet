<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>

<jsp:useBean id="submitfeedback" class="el.Feedback"/>
<jsp:setProperty name="submitfeedback" property="*"/>
<%
submitfeedback.submitFeedback();
session.setAttribute("message",submitfeedback.getMessage());
response.sendRedirect("FeedbackResponse.jsp?useremailId="+request.getParameter("useremailId"));
 

%>