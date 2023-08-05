<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*,el.*" errorPage="" %>
<html>
<style type="text/css">
<!--
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #993399;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
	color: #0000FF;
}
-->
</style>

    <table width="10%" align="center" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <th scope="col"><div align="center"><%  
           Topic topic= new Topic();
		   
          ArrayList list =topic.getListOfAllTopicsBySubjectId(Integer.parseInt(request.getParameter("subjectId")));
         
          
           if(list != null && list.size() > 0)
           {
               
			  	ArrayList subjectIdList =(ArrayList)list.get(0);
				ArrayList topicIdList = (ArrayList)list.get(1);
				ArrayList topicNameList = (ArrayList)list.get(2);
				for(int i=0; i < topicIdList.size();i++)
                {
        %>
        <tr>
          
          <td width="33%" align="center" ><div align="left"><li><a href="TopicAccordingToSubject.jsp?subjectId=<%=subjectIdList.get(i)%>&topicId=<%=topicIdList.get(i)%>"><%=topicNameList.get(i)%></a></li></div></td>
                    <%
			}
		}
          
           
		%>
      </tr>
    </table>
</html>