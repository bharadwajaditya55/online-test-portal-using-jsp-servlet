<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="paper" class="el.Paper"/>
<jsp:setProperty name="paper" property="*"/>
<%
boolean yes=false;

String str=paper.getQuestionByPaperId();
System.out.println("get question by paper id "+str);
if(str!=null)
{
response.getWriter().write(str);
}
else
{
response.getWriter().write("");
}

%>

