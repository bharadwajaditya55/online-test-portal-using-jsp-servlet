<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="addtopic" class="el.Topic"/>
<jsp:setProperty name="addtopic" property="*"/>
<%
addtopic.updateTopicContents();
session.setAttribute("message",addtopic.getMessage());
response.sendRedirect("TopicList.jsp");
  %>