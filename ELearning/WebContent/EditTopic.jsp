<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<jsp:useBean id="topic"  class="el.Topic"></jsp:useBean>
<jsp:setProperty property="*" name="topic"/>
<%            topic.getRecord();        %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Topic</title>
<style type="text/css">

body {
margin-left: 0px;
margin-top: 0px;
margin-right: 0px;
margin-bottom: 0px;
}
.style3 {
	font-size: 18px;
	font-family: "Comic Sans MS";
	color: #000000;
}
.style5 {color: #000000}
</style></head>
<body>
<table width="100%" height="500" border="0" cellpadding="0" cellspacing="0">
  <tr height="100">
    <td style="vertical-align:top"><jsp:include page="Header.jsp"/></td>
  </tr>
  <tr >
    <td ><jsp:include page="Menu.jsp"/></td>
  </tr>
  <tr height="420">
    <td bordercolor="#00FFFF" bgcolor="#D8EAFC" ><form name="form1" method="post" action="EditTopicHandler.jsp">
      <div align="center">
        <table  align="center" bgcolor="#00CCFF" width="50%" border="1" bordercolor="#ffffff" >
		<tr> <td colspan="2" align="center" bgcolor="#00CCFF"> <span class="style3"> Edit Topic Information </span></td>
		 
		</tr>
          <% if(session.getAttribute("message") != null) 
           { 
         %>
          <tr bordercolor="#990000">
            <td colspan="2" align="center" bgcolor="#00CCFF" class="style3"><%=session.getAttribute("message")%> </td>
          </tr>
          <%
          	session.removeAttribute("message");
           } 
        %>
          <tr>
            <td width="43%" height="33" class="style3">Topic Name </td>
            <td colspan="2"><input name="topicName" type="text" class="style3" id="topicName" value="<%=topic.getTopicName()%>">
              <input name="topicId" type="hidden" id="topicId" value="<%=topic.getTopicId()%>">
			  <input name="subjectId" type="hidden" id="subjectId" value="<%=topic.getSubjectId()%>">
			  
              <input name="oldTopicName" type="hidden" id="oldTopicName" value="<%=topic.getTopicName()%>"></td>
          </tr>
          <tr>
            <td class="style3">Topic Description </td>
            <td colspan="2"><span class="style5 style5">
              <textarea name="description"  id="description"><%=topic.getDescription()%></textarea>
            </span> </td>
          </tr>
          <tr>
            <td colspan="3" align="center"><span class="style5 style5">
              <label>
              <input name="Add" align="left" type="submit" id="Add" value="Update">
              </label>
              <label>
             <input type="reset" name="reset" value="Reset">
              </label>
              <label>
              <input name="Exit" type="button" id="Exit" value="<<Back" onClick="window.location='TopicList.jsp'">
              </label>
            </span></td>
          </tr>
        </table>
      </div>
    </form> </td>
  </tr>
  <tr height="50">
    <td><jsp:include page="Footer.jsp"/></td>
  </tr>
</table>
</body>
</html>