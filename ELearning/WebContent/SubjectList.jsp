<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*,el.*" errorPage="" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DisplayAllSubject</title>
<style type="text/css">
<!--
.style4 {
	font-family: "Comic Sans MS";
	font-size: 24px;
	color: #000000;
}
.style6 {font-family: "Comic Sans MS"; font-size: 18px; }
-->
</style>
</head>

<body>

<form name="form1" method="post" action="AdminHome.jsp">
<table width="100%" height="600" border="0" cellpadding="0" cellspacing="0">
  <tr height="100">
    <td style="vertical-align:top"><jsp:include page="Header.jsp"/></td>
  </tr>
   <tr>
    <td bgcolor="#D8EAFC"><jsp:include page="Menu.jsp"/></td>
  </tr>
  <tr>
      <td width="100%" height="80%" align="center" valign="middle" bgcolor="#D8EAFC">
	  
	  <div style="width:100%;height:400px; overflow:auto">
	  <table width="75%"  border="0" cellpadding="0" cellspacing="0">
        <tr>        </tr>
         <tr>
          <td height="19" colspan="9" align="center" valign="top"><span class="style4">List of Subjects</span></td>
          </tr>
		  
		 <% if(session.getAttribute("message") != null) { %> 
		  <tr>
          <td height="29" colspan="9" align="center" style="color:#FF0000">
              <%=session.getAttribute("message")%></td>
        </tr>
		 <% session.removeAttribute("message"); } %>
            
           
		
       
        <tr class="stylesmall">
          <td width="4%" align="center" bgcolor="#B4D7FA"><div align="left"><span class="style6">Sno</span></div></td>
          <td width="9%" align="center" bgcolor="#B4D7FA" class="style6"><div align="left">SubjectId</div></td>
          <td width="33%" align="center" bgcolor="#B4D7FA" class="style6"><div align="left">SubjectName</div></td>
          <td width="37%" align="center" bgcolor="#B4D7FA"><div align="left"><span class="style6">Description</span></div></td>
          <td width="17%" align="center" bgcolor="#B4D7FA" class="style6"><div align="left">Action</div></td>
        </tr>
        <%  
          Subject s=new Subject(); 
          ArrayList list =s.getListOfAllSubjects();
         
          
           if(list != null && list.size() > 0)
           {
               
			  	ArrayList subjectIdList = (ArrayList)list.get(0);
				ArrayList subjectNameList =(ArrayList) list.get(1);
				ArrayList descriptionList = (ArrayList)list.get(2);
		
                         
               
               for(int i=0; i < subjectIdList.size();i++)
                {
        %>
        <tr bgcolor='<%=(i%2==0 ? "" :"#B4D7FA")%>'>
          <td width="4%" align="center" class="stylegrey"><div align="left"><%=i+1%></div></td>
          <td width="9%" align="center" class="stylegrey"><div align="left"><%=subjectIdList.get(i)%></div></td>
          <td width="33%" align="center" class="stylegrey"><div align="left"><%=subjectNameList.get(i)%></div></td>
          <td width="33%" align="center" class="stylegrey"><div align="left"><%=descriptionList.get(i)%></div></td>
       
         
		   <td colspan="9">
		     <div align="left"><a href="ViewSubject.jsp?subjectId=<%=subjectIdList.get(i)%>">View</a>&nbsp;|&nbsp;
		         <a href="EditSubject.jsp?subjectId=<%=subjectIdList.get(i)%>">Edit</a>&nbsp;|&nbsp;
	           <a href="DeleteSubjectHandler.jsp?subjectId=<%=subjectIdList.get(i)%>" >Delete</a></div></td>
          </tr>
		  
        <%
			}
          }else
          {
       %>
              message ="No record Found";
        <%
          }
           
		%>
        <tr>
          <td colspan="9" align="center">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="9" align="center">&nbsp;</td>
        </tr>
      </table>
	  </div>
	  <input name="close" type="submit" id="close" value="Close" onClick="self.location='AdminHome.jsp'"></td>
  </tr>
    <tr >
      <td width="100%" height="5%" align="center"><%@ include file="Footer.jsp" %></td>
    </tr>
  </table>
  
</form>

</body>
</html>