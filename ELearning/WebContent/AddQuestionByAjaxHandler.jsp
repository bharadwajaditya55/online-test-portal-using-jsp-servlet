<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>

<jsp:useBean id="questionPaperSet" class="el.QuestionPaperSet"/>
<jsp:setProperty name="questionPaperSet" property="*"/>
<%


boolean b=questionPaperSet.addQuestionToPaper();
if(b)
{
response.getWriter().write("Paper updated succesfully");
}
else
{
response.getWriter().write("Not added");
}

%>