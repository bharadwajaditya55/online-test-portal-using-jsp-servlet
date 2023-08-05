<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*" %>
<jsp:useBean id="question"  class="el.Question"></jsp:useBean>
<jsp:useBean id="subject"  class="el.Subject"></jsp:useBean>
<jsp:useBean id="paper"  class="el.Paper"></jsp:useBean>
<jsp:setProperty property="*" name="paper"/>



<style type="text/css">
<!--
.style2 {
	font-family: "Comic Sans MS";
	color: #000000;
	font-size: 24px;
}
.style4 {color: #FF0000}
.style7 {font-family: "Comic Sans MS"; color: #000000; font-size: 18px; }
-->
</style>
<table width="100%" height="500" cellpadding="0" cellspacing="0" >

<tr height="100">
    <td width="525" style="vertical-align:top"><jsp:include page="Header.jsp"/></td>
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
		
		

		<table width="312" height="508" border="0">
  <tr  height="30px">
    <td width="312" bordercolor="#DEDEDE" bgcolor="#D8EAFC" style="vertical-align:top"><form id="form1" name="form1" method="post" action="AddQuestionsToPaper.jsp">
      <p><span class="style7">Subject </span>
        <select name="subjectIdDrop" id="subjectIdDrop" onchange="getPaperNameBySubjectId(this.value);">
            <option value=""  selected="selected">--Select--</option>
		
	
         
	      
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
      </p>
      <p><span class="style7">Paper
        </span>
        <select name="paperId" id="paperId" onchange="getQuestionByPaperID()">
            <option value=""  selected="selected">--Select--</option>
        
	   <%  
         if(request.getParameter("subjectId")!=null){
          ArrayList list1 =paper.getPaperNameBySubjectId(Integer.parseInt(request.getParameter("subjectId")));
         
          
           if(list1 != null && list1.size() > 0)
           {
               
			  	ArrayList paperIdList = (ArrayList)list1.get(0);
				ArrayList paperNameList =(ArrayList) list1.get(1);
			          
               
               for(int i=0; i < paperIdList.size();i++)
                {
       	 %>
            <option value="<%=paperIdList.get(i)%>"><%=paperNameList.get(i)%></option>
            <%
			  }}
			  }
			  %>
          </select>
      <p>
        <%if(request.getParameter("subjectId")!=null){%>
        <script>
			  document.getElementById('subjectIdDrop').value='<%=request.getParameter("subjectId")%>';
			  </script>
        <%}%>
		<%if(request.getParameter("paperId")!=null){%>
        <script>
			  document.getElementById('paperIdDrop').value='<%=request.getParameter("paperId")%>';
			  </script>
        <%}%>
      <p>
	  
	 
	  <div style="width:100%;height:330px; overflow:auto">
      <table width="100%" border="1" bordercolor="#FFFFFF" bgcolor="#D8EAFC" >
        <%
			  
			  if(request.getParameter("subjectId")!=null){
			  
			  ArrayList list2 =question.getQuestionsBySubjectId(Integer.parseInt(request.getParameter("subjectId")));
         
          
           if(list2 != null && list2.size() > 0)
           {    
                
			  	ArrayList questionIdList = (ArrayList)list2.get(0);
				ArrayList subjectIdList = (ArrayList)list2.get(1);
			    
                         
               
                for(int i=0; i < questionIdList.size();i++)
                {
			%>
        <tr id="TR<%=questionIdList.get(i)%>">
          <td width="51%" bordercolor="#FFFFFF" ><%=i+1%>
		  <input name="questionId" type="checkbox" id="questionId_<%=questionIdList.get(i)%>" value="<%=questionIdList.get(i)%>"></td>
          <td width="49%"><div style="background-image:url(images/img05.jpg);width:10px;height:10px" onclick="getQuestionByQuestionIdByAjax('<%=questionIdList.get(i)%>');"><%=questionIdList.get(i)%></div></td>
        </tr>
        <%
	
	}}}
	%>
      </table>
	  
	  </div>
     
	  <p>
        <input name="Add" align="center" type="button" id="Add" value="Add" onClick="addQuestionByAjax();">
        <input name="Exit" align="center" type="button" id="Exit" value="Exit" onClick="self.location='AdminHome.jsp'">
		<input name="qId" type="hidden" id="qId" value="">
		
 </form>      <p>&nbsp;</p></td>
  </tr>

</table>
</td>
       <%
	   //if(request.getParameter("questionId")!=null){
	   
	   
	   %>	   
	    <td  width="766" style="vertical-align:top"><div> <jsp:include page="UpdateQuestionAtPaper.jsp"/></div></td>
		<%//}else{%>
		 <div  align="center">WELCOME</div>
		<%//}%>
      </tr>
    </table>     </td>
  </tr>
  <tr style="background-color:">
    <td align="center"><jsp:include page="Footer.jsp"/></td>
  </tr>
</table>
<script>
function getPaperNameBySubjectId(value)
{
document.form1.action="AddQuestionsToPaper.jsp?subjectId="+value;

document.form1.submit();

}
</script>

<script>

		var xmlHttp;
		function GetXmlHttpObject()
		{
			
			try
			{
				//Firefox,Opara 8.0+,Safari
				xmlHttp=new XMLHttpRequest();
			}
			catch(e)
			{
				//Internet Explorer
				try
				{
					xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
				}
				catch(e)
				{
					xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
				}
			}
			return xmlHttp;
		}
		
		function getQuestionByPaperID()
		{
			//document.form1.availablestate.value=Trim(document.form1.availablestate.value);
			//document.form1.city_name.value=Trim(document.form1.city_name.value);
			if(document.form1.paperId.value!="")
			{
				xmlHttp=GetXmlHttpObject();
				if(xmlHttp==null)
				{
					alert("Your browser does not support AJAX!");
					return;
				}
				var url="AddQuestionsToPaperHandlerByAjax.jsp";
				url=url+"?paperId="+document.form1.paperId.value;
				//alert(url);
				xmlHttp.onreadystatechange=stateChanged;
				xmlHttp.open("POST",url,true);
				xmlHttp.send(null);
			}
			else{
				alert("Please select paper");
				return;
			}
		}
		function stateChanged()
		{
		var allQID1=document.form1.questionId;
		if(xmlHttp.readyState==4)
			{
			for(i=0;i<allQID1.length;i++)
			{
			       if(document.getElementById('questionId_'+allQID1[i].value).checked=true)
				  {
				    document.getElementById('questionId_'+allQID1[i].value).checked=false;
			       }
			}
			
			
				result=xmlHttp.responseText;				
				var r2=result.split(",");
				//alert("result question id adasdasdasd=="+r2);
				
				for(i=0;i<r2.length;i++)
					{
					 for(j=0;j<allQID1.length;j++)
					 {
					 if(r2[i]==allQID1[j].value)
					 {
					 document.getElementById('questionId_'+r2[i]).checked=true;
				     // alert("matched question id"+r2[i]);
				      }
					  
				}
				}
				return;
			}
			else
				{
					//document.getElementById("idbox").innerHTML="";
					
					
				     return;
				}
		
			}		
			
</script>
<script>
function getQuestionByQuestionIdByAjax(questionId){
	if(questionId!="")
	{
		xmlHttp=GetXmlHttpObject();
		if(xmlHttp==null)
		{
			alert("Your browser does not support AJAX!");
			return;
		}
		var url="getQuestionByQuestionIdByAjax.jsp";
		url=url+"?questionId="+questionId;
		//alert(url);
		xmlHttp.onreadystatechange=stateChangeQuestionByQuestionId;
		xmlHttp.open("POST",url,true);
		xmlHttp.send(null);
	}
	

}
function stateChangeQuestionByQuestionId(){
//alert("stateChangeQuestionByQuestionId called");
	if(xmlHttp.readyState==4)
		{
			result=xmlHttp.responseText;	
			//alert("Its RESULT"+result);			
			var data=result.split("\1");
			//alert("Its DATA"+data);
			var qid=data[0];
			var op1=data[1];
			var op2=data[2];
			var op3=data[3];
			var op4=data[4];
			var ans=data[5];
			var ques=data[6];
			var remak=data[7];
			
			document.form2.question.value=ques;
			document.form2.option1.value=op1;
			document.form2.option2.value=op2;
			document.form2.option3.value=op3;
			document.form2.option4.value=op4;
			document.form2.remarks.value=remak;
			
			if(ans=="A"){
				document.getElementById("answerA").checked=true;
			}else if(ans=="B"){
				document.getElementById("answerB").checked=true;
			}else if(ans=="C"){
				document.getElementById("answerC").checked=true;
			}else if(ans=="D"){
				document.getElementById("answerD").checked=true;
			}
			
			
			var ob=document.form1.questionId;
			//alert(ob);
			// here ob returns ObjectNodeList
			for(ii=0;ii<ob.length;ii++){
					document.getElementById('TR'+ob[ii].value).style.backgroundColor="#D8EAFC";
			}
			
			var TRID='TR'+qid;
			//alert(TRID);
			if(document.getElementById(TRID)!=null){
				document.getElementById(TRID).style.backgroundColor="#9393FF";
			}
		}
	
}
</script>

<script>
function addQuestionByAjax()
{

allCheckedId="";
var ob=document.form1.questionId;
// here ob returns ObjectNodeList
for(i=0;i<ob.length;i++)
{

	if(ob[i].checked)
	{
		allCheckedId+=ob[i].value+",";
	}
}
//alert(allCheckedId);
allCheckedId=allCheckedId.substring(0,allCheckedId.length-1);
//to temove last useless ","
//alert(allCheckedId);
//document.form1.questionId.value=allCheckedId;

	    xmlHttp=GetXmlHttpObject();
		if(xmlHttp==null)
		{
			alert("Your browser does not support AJAX!");
			return;
		}
		var url="AddQuestionByAjaxHandler.jsp";
		url=url+"?paperId="+document.form1.paperId.value+"&questionId="+allCheckedId;
		//alert(url);
		xmlHttp.onreadystatechange=stateChangeAddQuestionByQuestionId;
		xmlHttp.open("POST",url,true);
		xmlHttp.send(null);
	}
	function stateChangeAddQuestionByQuestionId(){
	if(xmlHttp.readyState==4)
		{
			result=xmlHttp.responseText;				
			alert(result);	
        }
}
</script>		
<script>
var allCheckedId="";
function maintainId(id){
//i think no need of this method 

//called("maintainId function called");
	allCheckedId="";
var ob=document.form1.questionId;
for(i=0;i<ob.length;i++){

	if(ob[i].checked)
	{
	allCheckedId+=ob[i].value+",";
	}
}
allCheckedId=allCheckedId.substring(0,allCheckedId.length-1);
//alert(allCheckedId);
document.form1.questionId.value=allCheckedId;

}
</script>

<script>
function viewQuestion(qid){
var pId=document.form1.paperId.value;
var sId=document.form1.subjectIdDrop.value;
var allQID=document.form1.questionId;
var allCheckedId1="";
for(i=0;i<allQID.length;i++)
{
if(allQID[i].checked){
allCheckedId1+=allQID[i].value+","
}
}
allCheckedId1=allCheckedId1.substring(0,allCheckedId.length-1);
document.form1.questionId.value=allCheckedId;
document.form1.action="AddQuestionsToPaper.jsp?paperId="+pId+"&questionId="+qid+"&subjectId="+sId+"&allQID="+allCheckedId;

document.form1.submit();
}   
function deleteQuestion(qid){
}
</script>
<script>
function checkedAllId(){
	var allId='<%=request.getParameter("allQID")%>';
	document.form1.questionId.value=allId;
	var idarr=allId.split(",");
	for(i=0;i<idarr.length;i++){
		
	  document.getElementById('questionId_'+idarr[i]).checked=true;
	}
}
</script>
<script>

var TRID='TR'+'<%=request.getParameter("questionId")%>';
if(document.getElementById(TRID)==null){
}else{
document.getElementById(TRID).style.backgroundColor="#9393FF";
}
</script>

<script>
checkedAllId();
</script>
