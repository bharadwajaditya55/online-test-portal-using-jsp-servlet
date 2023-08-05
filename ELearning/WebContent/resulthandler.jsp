<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*,el.*" errorPage=""%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*,el.*" errorPage=""%>
<jsp:useBean id="result" class="el.Result" />
<jsp:setProperty name="result" property="*" />
<% boolean check = result.scoreupdate();
  if(check){
   response.sendRedirect("OnlineTestHome.jsp");
  }else{
	  response.sendRedirect("OnlineTestAnswer.jsp");
  }
  %>