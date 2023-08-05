<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*" %>
<jsp:useBean id="question"  class="el.Question"></jsp:useBean>
<jsp:useBean id="subject"  class="el.Subject"></jsp:useBean>
<html>
<script>
function getQuestionsBySubjectId(value)
{
document.form1.action="ViewQuestionSId.jsp?subjectId="+value;
document.form1.submit();
}
</script>





<form name="form1" method="post" >
<table width="484" height="348" border="1">
  <tr>
  
    <td height="105" colspan="3">Subject
      <select name="subjectId" id="subjectId" onchange="getQuestionsBySubjectId(this.value);">
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
	  
	  <%if(request.getParameter("subjectId")!=null){%>
			  
			  <script>
			  document.getElementById('subjectId').value='<%=request.getParameter("subjectId")%>';
			  </script>
	  <%}%>    </td>
  </tr>
  
  <tr>
      <td>Serial Number</td>
      <td>Question Id</td>
      <td height="141">Action</td>
    </tr>
  
  
  
   <%  
		  System.out.println("aaa");
              if(request.getParameter("subjectId")!=null){
			  
			  ArrayList list1 =question.getQuestionsBySubjectId(Integer.parseInt(request.getParameter("subjectId")));
         
          
           if(list1 != null && list1.size() > 0)
           {
               
			  	ArrayList questionIdList = (ArrayList)list1.get(0);
			    
                         
               
               for(int i=0; i < questionIdList.size();i++)
                {
        %>
  
  
  
  <div>
    
    <tr>
    <td width="172"><%=i+1%></td>
    <td width="143"><a href="AddQuestionToInclude.jsp?questionId=<%=questionIdList.get(i)%>"><%=questionIdList.get(i)%></a> </td>
    <td width="147" height="141"><a href="DeleteQuestionHandler.jsp?questionId=<%=questionIdList.get(i)%>" >Delete</a></td>
  </tr></div>
  
 
		  
  <%
			}
          }
		  }
		  System.out.println("aaa");
		  System.out.println("aaa");
              %>
</table>
</form>
</html>
