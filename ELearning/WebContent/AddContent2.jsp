<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*" %>
<jsp:useBean id="subject"  class="el.Subject"></jsp:useBean>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AddContent</title>

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
.style7 {color: #FF0000}
.style9 {font-size: 18px;  color: #000000; font-weight: bold; }
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
    <td bordercolor="#00FFFF" bgcolor="#D8EAFC" >
	
	<form name="form1" method="post" >
      <div align="center">
        <table  align="center" bgcolor="#D8EAFC" width="50%" border="1" border="1"  >
		<tr> 
		<td width="100%" colspan="2" align="center" bgcolor="#D8EAFC" class="style9"> Add Topic Contents </td>
		</tr>
          <% if(session.getAttribute("message") != null) 
           { 
         %>
          <tr bordercolor="#990000">
            <td colspan="2" align="center" width="100%" bgcolor="#00CCFF" class="style7"><%=session.getAttribute("message")%> </td>
          </tr>
          <%
          	session.removeAttribute("message");
           } 
        %>
          <tr>
            <td width="50%" height="33" class="style3">Select Subject  </td>
            <td width="50%" colspan="2">
              <select name="subjectId" id="subjectId" onChange="getTopicNameBySubjectId(this.value);">
			   <option  selected="selected" value="">--Select--</option>
			  
			   
			  <%  
         
          ArrayList list =subject.getListOfAllSubjectsName();
         
          
           if(list != null && list.size() > 0)
           {
               
			  	ArrayList subjectIdList = (ArrayList)list.get(0);
				ArrayList subjectNameList =(ArrayList) list.get(1);
				
		
                         
               
               for(int i=0; i < subjectIdList.size();i++)
                {
       	 %>
		 
		  <option value="<%=subjectIdList.get(i)%>"><%=subjectNameList.get(i)%></option>
			  <%
			  }}
			  
			  %>
              </select>
			  <%if(request.getParameter("subjectId")!=null){%>
			  
			  <script>
			  document.getElementById('subjectId').value='<%=request.getParameter("subjectId")%>';
			  </script>
			  <%}%>			  </td>
          </tr>
          <tr>
            <td width="50%" height="33" class="style3">Select Topic  </td>
            <td colspan="2" id="topicTD">
              <select name="topicId" id="topicId">
			   <option  selected="selected" value="">--Select--</option>
			 <%  
         
          if(request.getParameter("subjectId")!=null){
		  ArrayList list2=subject.getTopicNameBySubjectId(Integer.parseInt(request.getParameter("subjectId")));
		  
         
          
           if(list2 != null && list2.size() > 0)
           {
               
			  	ArrayList topicIdList = (ArrayList)list2.get(0);
				ArrayList topicNameList =(ArrayList) list2.get(1);
				
				
		
                         
               
               for(int i=0; i < topicIdList.size();i++)
                {
       	 %>
			  <option value="<%=topicIdList.get(i)%>"><%=topicNameList.get(i)%></option>
			  <%
			  }}
			  }
			  %>
              </select>
	  		  </td>
          </tr> 	
          
          <tr>
            <td colspan="3" align="center"><span class="style5 style5">
              <label>
              <input name="Add" align="left" type="button" id="Add" value="Add" onClick="submitForm();">
              </label>
              
              <label>
              <input name="Exit" type="button" id="Exit" value="Exit" onClick="self.location='AdminHome.jsp'">
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
<script>
function getTopicNameBySubjectId(value){
if(value==""){

document.getElementById('topicID').innerHTML='<select name="topicId" id="topicId"><option  selected="selected" value="">--Select--</option></select>';
}else{
document.form1.action="AddContent2.jsp?subjectId="+value;
document.form1.submit();
}
}
function submitForm(){
var subid=document.form1.subjectId.value;
var tid=document.form1.topicId.value;
if(subid==""){
alert("Select Subject Name");
document.form1.subjectId.focus();
return;
}
if(tid==""){
alert("Select Topic Name");
document.form1.topicId.focus();
return;
}
document.form1.action="AddTopicContents.jsp?subjectId="+subid+"&topicId="+tid+"&pageFlag=0";
document.form1.submit();
}
</script>
</body>
</html>