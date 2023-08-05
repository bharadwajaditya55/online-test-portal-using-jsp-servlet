<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*" %>
<jsp:useBean id="question"  class="el.Question"></jsp:useBean>
<jsp:useBean id="subject"  class="el.Subject"></jsp:useBean>
<jsp:useBean id="paper"  class="el.Paper"></jsp:useBean>
<jsp:setProperty property="*" name="paper"/>
<jsp:setProperty property="*" name="subject"/>
<jsp:setProperty property="*" name="question"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>online test</title>
<meta name="keywords" content="" />
<script>
var mins ='<%=paper.getTimeDurationByPaperId(Integer.parseInt(request.getParameter("paperId")))%>';
    var secs = mins * 60;
    var currentSeconds = 0;
    var currentMinutes = 0;
 var stopTimer=setInterval(Decrement,1000);

    function Decrement() {

	    currentMinutes = Math.floor(secs / 60);
        currentSeconds = secs % 60;
        if(currentSeconds <= 9) currentSeconds = "0" + currentSeconds;
        secs--;
        document.getElementById("timerText").innerHTML = currentMinutes + ":" + currentSeconds; //Set the element id you need the time put into.
        if(currentMinutes==0 && currentSeconds==0){
		//alert("Time Over");
		clearInterval(stopTimer);
        var percentage= (rightAnswer/<%=paper.getTotalQuestionsByPaperId(paper.getPaperId())%>)*100;
        alert("Total questions:"+" "+<%=paper.getTotalQuestionsByPaperId(paper.getPaperId())%>+"\nQuestions attempted:"+" "+total+"\nCorrect answers:"+" "+rightAnswer+"\nWrong        answers:"+" "+wrongAnswer+"\nYour marks:"+" "+rightAnswer+"\nPercentage"+" "+percentage+"%");
		}
		if(secs == -1){clearInterval(stopTimer);}
		
    }
	</script>

</head>


<body>
<!-- start header -->
<div id="wrapper">
	<!-- start page -->
	<div id="page"><!-- start content -->
<div style="clear: both;">
<form id="form4" name="form4" method="post" action="OnlineTestHome.jsp">
  <table width="90%" align="center" >
    <tr>
      <td colspan="2" align="center"><span class="style8">Online Test </span></td>
      </tr> 
    <tr id="subject">
      <td  "width="72%"><span class="style4">Name of subject:<span class="style12"><%=subject.getSubjectNameAccordingToSubjectId(Integer.parseInt(request.getParameter("subjectId")))%></span></span></td>
	  <td width="28%" rowspan="2" align="center"> <div id="roundcorner"><span class="style6">Time left </span> </div></td>
    </tr>
    <tr id="paper">
      <td ><span class="style4">Paper Set:<span class="style12"><%=paper.getPaperNameAccordingToPaperId(Integer.parseInt(request.getParameter("paperId")))%></span>
	  </span></td>
      </tr>
    <tr>
      <td><span class="style4">Total number of questions:<span class="style12"><%=paper.getTotalQuestionsByPaperId(Integer.parseInt(request.getParameter("paperId")))%></span>
	  </span></td>
            <td width="28%" rowspan="2" align="center">
			
		<div id="roundcorner">	<span id="timerText" style="color:#FF0000; font-size:36px"></span></div>&nbsp;</td>
			
    </tr>
    <tr>
      <td class="style4">Total  duration(in minutes):<span class="style16"><%=paper.getTimeDurationByPaperId(Integer.parseInt(request.getParameter("paperId")))%>  
	   </span></td>
      </tr>
    <tr>
      <td><span class="style4">For correct answer: 1 marks </span></td>
      <td width="28%" align="center">&nbsp;</td>
    </tr>
    <tr>
      <td><span class="style4">For wrong answer: 0 marks </span></td>
      <td width="28%" align="center">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2"><p class="style4"><%paper.setPaperId(Integer.parseInt(request.getParameter("paperId")));
	System.out.println("getPaperId"+paper.getPaperId());
	%>
	<hr />
	</p>
	     <div style="width:100%;height:400px;  overflow:auto ">	
		<table width="90%" border="0">         
		
		  <%  ArrayList list =paper.getQuestionsIdByPaperId(Integer.parseInt(request.getParameter("paperId")));
		      el.Question qob=new el.Question();
           if(list != null && list.size() > 0)
           {
		      for(int i=0; i < list.size();i++)
            {
					qob.selectQuestion(Integer.parseInt(String.valueOf(list.get(i))));
		  %>
		   <tr>
            <td style=" vertical-align:top" width="4%" rowspan="3"><span class="style4"><%=i+1+"."%></span></td>
            <td width="96%" colspan="2"><span class="style4"><strong><%=qob.getQuestion()%></strong></span></td>
          </tr>
          <tr>
            <td><span class="style4">A<input name="answer<%=qob.getQuestionId()%>" id="answerA_<%=qob.getQuestionId()%>" type="radio"  value="A"  onclick="evaluateAnswer(this.value,<%=qob.getQuestionId()%>,'<%=qob.getAnswer()%>');"    ondblclick="checked=false" ><%=qob.getOption1()%><img  id="A_Rimage_<%=qob.getQuestionId()%>"src="images/right.png" style="display:none" width="20px" height="15px"/><img  id="A_Wimage_<%=qob.getQuestionId()%>"src="images/wrong.png" style="display:none" width="20px" height="15px"/></span></td>
            <td><span class="style4">B<input name="answer<%=qob.getQuestionId()%>" id="answerB_<%=qob.getQuestionId()%>"  type="radio"  value="B" onclick="evaluateAnswer(this.value,<%=qob.getQuestionId()%>,'<%=qob.getAnswer()%>');" ondblclick="checked=false" ><%=qob.getOption2()%><img  id="B_Rimage_<%=qob.getQuestionId()%>"src="images/right.png" style="display:none" width="20px" height="15px"/><img  id="B_Wimage_<%=qob.getQuestionId()%>"src="images/wrong.png" style="display:none" width="20px" height="15px"/></span></td>
          </tr>
          <tr>
            <td><span class="style4">C<input name="answer<%=qob.getQuestionId()%>" id="answerC_<%=qob.getQuestionId()%>"  type="radio" value="C" onclick="evaluateAnswer(this.value,<%=qob.getQuestionId()%>,'<%=qob.getAnswer()%>');" ondblclick="checked=false" ><%=qob.getOption3()%><img  id="C_Rimage_<%=qob.getQuestionId()%>"src="images/right.png" style="display:none" width="20px" height="15px"/><img  id="C_Wimage_<%=qob.getQuestionId()%>"src="images/wrong.png" style="display:none" width="20px" height="15px"/></span></td>
           <td><span class="style4">D<input name="answer<%=qob.getQuestionId()%>" id="answerD_<%=qob.getQuestionId()%>"  type="radio"  value="D" onclick="evaluateAnswer(this.value,<%=qob.getQuestionId()%>,'<%=qob.getAnswer()%>');" ondblclick="checked=false" ><%=qob.getOption4()%><img  id="D_Rimage_<%=qob.getQuestionId()%>"src="images/right.png" style="display:none" width="20px" height="15px"/><img  id="D_Wimage_<%=qob.getQuestionId()%>"src="images/wrong.png" style="display:none" width="20px" height="15px"/></span></td>
            </tr>			
		    <%	
	}}
	%>
        </table>
		</div>
		
		<hr />
           </tr>
		
    <tr align="center">
      <td height="58" colspan="2"><input name="Submit Test" type="button" id="Submit" value="Submit Test" onclick="showResult();">
      </tr>  	
  </table>
</form>
</div>
  </div>
</div>
	<footer class="footer">
		<div>
			<span><%@ include file="Footer.jsp"%></span>
		</div>
	</footer>
	<script>
var rightAnswer=0;
var wrongAnswer=0;
var total=0;
function evaluateAnswer(option,qid,ans){
//alert("Enter function evaluate answer");
//alert("paper id"+<%=paper.getPaperId()%>);
//alert("option"+option);
//alert("question id"+qid);
//alert("correct answer"+ans);
if(option==ans)
{
 rightAnswer+=1;
 // document.getElementById(option+"_Rimage_"+qid).style.display='';

}
else
{
wrongAnswer+=1;
 // document.getElementById(option+"_Wimage_"+qid).style.display='';


}
document.getElementById('answerA_'+qid).disabled=true;
document.getElementById('answerB_'+qid).disabled=true;
document.getElementById('answerC_'+qid).disabled=true;
document.getElementById('answerD_'+qid).disabled=true;
total=rightAnswer+wrongAnswer;

	
}

</script>
<script>
function showResult()
{

 
			  var subjectid='<%=request.getParameter("subjectId")%>';
		      var paperid='<%=request.getParameter("paperId")%>';
			  //clearInterval(stopTimer);
			  
			  var totalquestions=<%=paper.getTotalQuestionsByPaperId(paper.getPaperId())%>;
			  var uq=totalquestions-total;
			  

  clearInterval(stopTimer);
  var percentage= (rightAnswer/<%=paper.getTotalQuestionsByPaperId(paper.getPaperId())%>)*100;
  
      
  
  document.form4.action="OnlineTestAnswer.jsp?subjectId="+subjectid+"&paperId="+paperid+"&pageFlag=0"+"&Total="+total+"&percentage="+percentage+"&rightAnswer="+rightAnswer+"&wrongAnswer="+wrongAnswer;
document.form4.submit();
}
</script>
	
</body>
</html>
