<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="topic" class="el.Topic"/>
<jsp:setProperty name="topic" property="*"/>
<%
topic.deleteTopic();
session.setAttribute("message",topic.getMessage());
response.sendRedirect("TopicList.jsp");
 

%>
