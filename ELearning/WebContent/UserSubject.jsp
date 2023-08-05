<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*,el.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
<!--
a:visited {
	color: #993399;
}
a:active {
	color: #0000FF;
}
-->
</style>
    <table width="10%" align="top" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <th scope="col"><div align="center">
		<%  
           Subject subject= new Subject();
		   
          ArrayList list =subject.getListOfAllSubjectsName();
         
          
           if(list != null && list.size() > 0)
           {
               
			  	ArrayList subjectIdList = (ArrayList)list.get(0);
				ArrayList subjectNameList =(ArrayList) list.get(1);
				
                                        
               for(int i=0; i < subjectIdList.size();i++)
                {
        %>
        <tr>
          
          <td width="33%" align="center" ><div align="left"><li><a href="TopicAccordingToSubject.jsp?subjectId=<%=subjectIdList.get(i)%>"><%=subjectNameList.get(i)%></a></li></div></td>
                    <%
			}
			}        
		%>
      </tr>
    </table>
</html>