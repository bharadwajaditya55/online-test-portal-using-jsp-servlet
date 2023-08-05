<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<jsp:useBean id="topic" class="el.Topic"/>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Topic Content</title>
<style type="text/css">

body {
margin-left: 0px;
margin-top: 0px;
margin-right: 0px;
margin-bottom: 0px;
}
</style>
<style type="text/css">
<!--
.style4 {}
.style6 {
	font-size: 18px;
	font-weight: bold;
}
-->
</style>
</head>
<body>
<table width="100%" height="450" border="0" cellpadding="0" cellspacing="0">
  <tr height="100">
    <td style="vertical-align:top"><jsp:include page="Header.jsp"/></td>
  </tr>
  <tr >
    <td ><jsp:include page="Menu.jsp"/></td>
  </tr>
  <tr height="400">
    <td bordercolor="#00FFFF" bgcolor="#D8EAFC" ><form name="form1" method="post" action="AddTopicContentsHandler.jsp">
      <table width="100%" border="0">
        <tr>
          <td colspan="2" align="center"><span class="style6">Add Data </span></td>
          </tr>
		 <% if(session.getAttribute("message") != null) 
           { 
         %>  
        <tr>
          <td colspan="2" align="center"><%=session.getAttribute("message")%></td>
          </tr>
		  <%
          	session.removeAttribute("message");
           } 
        %> 
		  
		  
        <tr>
          <td><span class="style4">SubjectName:</span><%=topic.getSubjectNameById(Integer.parseInt(request.getParameter("subjectId")))%> </td>
          <td><span class="style4">TopicName:</span>   <%=topic.getTopicNameById(Integer.parseInt(request.getParameter("topicId"))) %>
            <input type="hidden" name="topicId" id="topicId" value="<%=request.getParameter("topicId")%>">
		    <input type="hidden" name="pageFlag" id="pageFlag" value="<%=request.getParameter("pageFlag")%>"></td>
        </tr>
        <tr>
          <td colspan="2"><div>
    <textarea name="topicContent" id="topicContent" rows="20"  style="width:100%"><%=topic.getTopicContentsById(Integer.parseInt(request.getParameter("topicId")))%></textarea>
  </div></td>
          </tr>
        <tr>
          <td colspan="2" align="center">            <input type="submit" name="Submit" value="Save" >
           <input type="button" name="Submit2" value="<<Back" onClick="self.location='TopicList.jsp'">           </td>
          </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table>
        </form>
    </td>
  </tr>
  <tr height="50">
    <td><jsp:include page="Footer.jsp"/></td>
  </tr>
</table>
 <script type="text/javascript">
  $(function()
  {
      $('#topicContent').wysiwyg();
  });
  </script>
<script>
function show(){
alert(document.getElementById('topicContent').value);
}
</script>
</body>
</html>