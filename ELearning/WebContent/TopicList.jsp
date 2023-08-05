<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*,el.*" errorPage="" %>
<jsp:useBean id="topic"  class="el.Topic"></jsp:useBean>
<jsp:setProperty property="*" name="topic"/>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DisplayAllSubject</title>
<style type="text/css">
<!--
.style4 {
	font-size: 24px;
	color: #000000;
}
.style6 { font-size: 18px; }
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
	  <table width="84%"  border="0" cellpadding="0" cellspacing="0">
        <tr>        </tr>
         <tr>
          <td height="19" colspan="9" align="center" valign="top"><span class="style4">List of Topics</span></td>
          </tr>
		  
		 <% if(session.getAttribute("message") != null) { %> 
		  <tr>
          <td height="29" colspan="9" align="center" style="color:#FF0000">
              <%=session.getAttribute("message")%>              </td>
        </tr>
		 <% session.removeAttribute("message"); } %>
            
           
		
       
        <tr class="stylesmall">
          <td width="4%" align="center" bgcolor="#B4D7FA"><div align="left"><span class="style6">Sno</span></div></td>
          <td width="9%" align="center" bgcolor="#B4D7FA" class="style6"><div align="left">SubjectName</div></td>
          <td width="25%" align="center" bgcolor="#B4D7FA" class="style6"><div align="left">TopicName</div></td>
          <td width="33%" align="center" bgcolor="#B4D7FA"><div align="left"><span class="style6">Description</span></div></td>
          <td width="29%" align="center" bgcolor="#B4D7FA" class="style6"><div align="left">Action</div></td>
        </tr>
        <%  
          
          ArrayList list =topic.getListOfAllTopics();
         
          
           if(list != null && list.size() > 0)
           {
               
			  	ArrayList subjectIdList = (ArrayList)list.get(0);
			    ArrayList topicIdList = (ArrayList)list.get(1);
				ArrayList topicNameList =(ArrayList) list.get(2);
				ArrayList descriptionList = (ArrayList)list.get(3);
		
                         
               
               for(int i=0; i < subjectIdList.size();i++)
                {
        %>
        <tr bgcolor='<%=(i%2==0 ? "" :"#B4D7FA")%>'>
          <td width="4%" align="center" class="stylegrey"><div align="left"><%=i+1%></div></td>
          <td width="9%" align="center" class="stylegrey"><div align="left"><%=subjectIdList.get(i)%></div></td>
          <td width="33%" align="center" class="stylegrey"><div align="left"><%=topicNameList.get(i)%></div></td>
          <td width="33%" align="center" class="stylegrey"><div align="left"><%=descriptionList.get(i)%></div></td>
       
         
		   <td colspan="9">
		     <div align="left"><a href="ViewTopic.jsp?topicId=<%=topicIdList.get(i)%>">View</a>&nbsp;|&nbsp;
			  <a href="AddTopicContents.jsp?subjectId=<%=subjectIdList.get(i)%>&topicId=<%=topicIdList.get(i)%>&pageFlag=1">Add Content</a>&nbsp;|&nbsp;
		         <a href="EditTopic.jsp?subjectId=<%=subjectIdList.get(i)%>&topicId=<%=topicIdList.get(i)%>">Edit</a>&nbsp;|&nbsp;
	           <a href="DeleteTopicHandler.jsp?topicId=<%=topicIdList.get(i)%>" >Delete</a></div></td>
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
      </table>
	  </div>
	    <input name="close" type="submit" id="close" value="Close" onClick="self.location='AdminHome.jsp'">
      <tr>
          <td colspan="9" align="center">&nbsp;</td>
	    </tr>
	  </td>
  </tr>
    <tr >
      <td width="100%" height="5%" align="center"><%@ include file="Footer.jsp" %></td>
    </tr>
  </table>
  
</form>

</body>
</html>