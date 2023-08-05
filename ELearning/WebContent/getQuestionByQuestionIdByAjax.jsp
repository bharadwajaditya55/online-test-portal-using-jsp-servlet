<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="question" class="el.Question"/>
<jsp:setProperty name="question" property="questionId"/>
<%
String data=question.getQuestionDetailsByAjax();
System.out.println(data);
if(data!=null)
{
response.getWriter().write(data);
}
else
{
response.getWriter().write("");
}

%>