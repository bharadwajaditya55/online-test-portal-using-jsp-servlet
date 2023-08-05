<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>

<jsp:useBean id="examFeedback" class="el.ExamFeedback"/>
<jsp:setProperty name="examFeedback" property="*"/>
<%

System.out.println("TTTTTTTTTTTT===============");
boolean b=examFeedback.submitFeedback();
//System.out.println("TTTTTTTTTTTT==============="+b);

if(b)
{
response.getWriter().write("Paper updated succesfully");
}
else
{
response.getWriter().write("Not added");
}


%>