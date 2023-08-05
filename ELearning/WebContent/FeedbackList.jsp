<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*,el.*" errorPage="" %>
<jsp:useBean id="submitfeedback" class="el.Feedback"/>
<jsp:setProperty name="submitfeedback" property="*"/>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FeedBacK List</title>
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
	  <table width="84%"  border="0" cellpadding="0" cellspacing="0">
        <tr>        </tr>
         <tr>
          <td height="19" colspan="10" align="center" valign="top"><span class="style4">Feedback Store </span></td>
          </tr>
		  
		 <% if(session.getAttribute("message") != null) { %> 
		  <tr>
          <td height="29" colspan="10" align="center" style="color:#FF0000">
              <%=session.getAttribute("message")%>              </td>
        </tr>
		 <% session.removeAttribute("message"); } %>
            
           
		
       
        <tr class="stylesmall">
          <td width="4%" align="center" bgcolor="#B4D7FA"><div align="left"><span class="style6">Sno</span></div></td>
          <td width="9%" align="center" bgcolor="#B4D7FA" class="style6"><div align="left">UserName</div></td>
          <td width="25%" align="center" bgcolor="#B4D7FA" class="style6"><div align="left">UserEmailId</div></td>
          <td width="16%" align="center" bgcolor="#B4D7FA"><div align="left"><span class="style6">UserComment</span></div></td>
          <td width="17%" align="center" bgcolor="#B4D7FA"><span class="style6">DateOfComment</span></td>
          <td width="29%" align="center" bgcolor="#B4D7FA" class="style6"><div align="left">Action</div></td>
        </tr>
        <%  
          
          ArrayList list =submitfeedback.getListOfAllComments();
         
          
           if(list != null && list.size() > 0)
           {
               
			  ArrayList snoList = (ArrayList)list.get(0);
			  	ArrayList usernameList = (ArrayList)list.get(1);
			    ArrayList useremailIdList =(ArrayList) list.get(2);
				ArrayList commentList =(ArrayList) list.get(3);
			    ArrayList dateofcommentList = (ArrayList)list.get(4);
			
		
                         
               
               for(int i=0; i < snoList.size();i++)
                {
        %>
        <tr bgcolor='<%=(i%2==0 ? "" :"#B4D7FA")%>'>
          <td width="4%" align="center" class="stylegrey"><div align="left"><%=snoList.get(i)%></div></td>
          <td width="9%" align="center" class="stylegrey"><div align="left"><%=usernameList.get(i)%></div></td>
          <td width="33%" align="center" class="stylegrey"><div align="left"><%=useremailIdList.get(i)%></div></td>
          <td width="16%" align="center" class="stylegrey"><div align="left"><%=commentList.get(i)%></div></td>
       
         
		   <td width="17%" align="center" class="stylegrey"><div align="left"><%=dateofcommentList.get(i)%></div></td>
		   <td colspan="9">
		     <div align="left"><a href="ViewFeedback.jsp?useremailId=<%=useremailIdList.get(i)%>">View</a>&nbsp;|&nbsp;
	           <a href="DeleteFeedbackHandler.jsp?useremailId=<%=useremailIdList.get(i)%>" onClick="return confirm('Are you sure you want to delete');">Delete</a></div></td>
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
          <td colspan="10" align="center">&nbsp;</td>
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