<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*" %>
<jsp:useBean id="question"  class="el.Question"></jsp:useBean>
<jsp:useBean id="subject"  class="el.Subject"></jsp:useBean>
<style type="text/css">
.style2 {
	color: #000000;
	font-size: 24px;
}
.style4 {color: #FF0000}
.style6 { color: #000000; font-size: 16px; }
.style7 { color: #000000; font-size: 12px; }
</style>
<script>
function getQuestionsBySubjectId(value)
{
document.form1.action="ViewQuestionSId.jsp?subjectId="+value;
document.form1.submit();
}
</script>

<script>
function viewQuestion(qid){
var sId=document.form1.subjectIdDrop.value;


document.form1.action="ViewQuestionSId.jsp?subjectId="+sId+"&questionId="+qid;
document.form1.submit();
}   
function deleteQuestion(qid){

alert(qid);
}
</script>



<div >
<table  width="100%" height="500" cellpadding="0" cellspacing="0" >

<tr height="100">
    <td  style="vertical-align:top"><jsp:include page="Header.jsp"/></td>
  </tr>
  <tr >
    <td ><jsp:include page="Menu.jsp"/></td>
  </tr>




  <tr>
    <td colspan="2" align="center"><span class="style2">Manage Questions </span></td>
  </tr>
  <tr>
    <td colspan="2" align="center" class="style4" >
      <% if(session.getAttribute("message") != null){ 
         %>      
      <%=session.getAttribute("message")%></td>
  </tr>
  <%
          	session.removeAttribute("message");
           } 
        %>
		
		
	
		
  <tr>

    <td height="144" colspan="2" align="center"><div><table width="99%" height="400">
      <tr >
        <td width="312" align="left" style="vertical-align:top">
		
		
		
		<table width="312" height="508" border="0" bgcolor="#D8EAFC">
		
<tr>
<td width="312" align="left" bordercolor="#000000" bgcolor="#D8EAFC" style="vertical-align:top">  
   
	<form name="form1" method="post" action="ViewQuestionSId.jsp" >

	   <span class="style6">Subject</span>
       <select name="subjectIdDrop" id="subjectIdDrop" onchange="getQuestionsBySubjectId(this.value);">
            &lt;option value="">
        --Select--
        
		
	
         <%  
         
          ArrayList list =subject.getListOfAllSubjectsName();
         
          
           if(list != null && list.size() > 0)
           {
               
			  	ArrayList subjectIdList = (ArrayList)list.get(0);
				ArrayList subjectNameList =(ArrayList) list.get(1);
				
		
                         
               
               for(int i=0; i < subjectIdList.size();i++)
                {
       	 %>
        <option value="<%=subjectIdList.get(i)%>" selected="selected"><%=subjectNameList.get(i)%></option>
        <%
			  }}
			  
			  %>
      </select>
	  </form>
	  
	    <%if(request.getParameter("subjectId")!=null){%>
	    
	    <script>
			  document.getElementById('subjectIdDrop').value='<%=request.getParameter("subjectId")%>';
			  </script>
	            <%}%>      
	  
		<div style="overflow:auto;width:99%;height:350px;background-color:#D8EAFC">
	  <table width="100%" border="1" bordercolor="#FFFFFF"  bgcolor="#D8EAFC">
        <%
	 
              if(request.getParameter("subjectId")!=null){
			  
			  ArrayList list1 =question.getQuestionsBySubjectId(Integer.parseInt(request.getParameter("subjectId")));
         
          
           if(list1 != null && list1.size() > 0)
           {
               
			  	ArrayList questionIdList = (ArrayList)list1.get(0);
				ArrayList subjectIdList = (ArrayList)list1.get(1);
			    
                         
               
               for(int i=0; i < questionIdList.size();i++)
                {
	%>
        <tr id="TR<%=questionIdList.get(i)%>">
          <td height="23"><%=i+1%>.</td>
          <td><div style="background-image:url(images/img05.jpg);width:10px;height:10px" onclick="viewQuestion('<%=questionIdList.get(i)%>');"><%=questionIdList.get(i)%></div></td>
          <td><div  > <a href="DeleteQuestionHandler.jsp?questionId=<%=questionIdList.get(i)%>&amp;subjectId=<%=subjectIdList.get(i)%>" class="style7" onclick="return confirm('Are you sure you want to delete');">Delete</a></div></td>
        </tr>
        <%
	
	}}}
	%>
      </table>
	  </div>
	  <p>&nbsp;</p>
	  <p>&nbsp;</p></td>
  </tr>
  
</table></td>
       <%
	   if(request.getParameter("questionId")!=null){
	   
	   
	   %>
	   
	
	
	
	
	   
	    <td  width="766" style="vertical-align:top"><div> <jsp:include page="UpdateQuestion.jsp"/></div></td>
		<%}else{%>
		 <div  align="center">WELCOME</div>
		<%}%>
      </tr>
    </table></div></td>
  </tr>
  <tr style="background-color:">
    <td align="center"><jsp:include page="Footer.jsp"/></td>
  </tr>
</table>
<script>

var TRID='TR'+'<%=request.getParameter("questionId")%>';
if(document.getElementById(TRID)==null){
}else{
document.getElementById(TRID).style.backgroundColor="#9393FF";
}
</script>
</div>

