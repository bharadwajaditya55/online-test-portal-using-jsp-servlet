<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="addtopic" class="el.Topic"/>
<jsp:setProperty name="addtopic" property="*"/>
<%
addtopic.updateTopicContents();
session.setAttribute("message",addtopic.getMessage());
if(request.getParameter("pageFlag").equals("0")){
response.sendRedirect("AddContent2.jsp");
}else{
response.sendRedirect("TopicList.jsp");
}

%>