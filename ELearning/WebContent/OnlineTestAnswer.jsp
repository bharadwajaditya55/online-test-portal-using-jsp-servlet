<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*"%>
<jsp:useBean id="question" class="el.Question"></jsp:useBean>
<jsp:useBean id="subject" class="el.Subject"></jsp:useBean>
<jsp:useBean id="paper" class="el.Paper"></jsp:useBean>
<jsp:useBean id="examFeedback" class="el.ExamFeedback" />
<jsp:setProperty property="*" name="paper" />
<jsp:setProperty property="*" name="subject" />
<jsp:setProperty property="*" name="question" />
<jsp:setProperty name="examFeedback" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>online test</title>
<meta name="keywords" content="" />
</head>
<body>
	
	<div id="wrapper">
		<div id="page">
			<div style="clear: both;">
				<table width="90%" align="center">
					<tr>
						<td colspan="5" align="center"><span class="style26">Online
								Test </span></td>
					</tr>
					<tr>
						<td colspan="5" align="center">&nbsp;</td>
					</tr>
					<tr id="subject">
					</tr>
					<tr id="paper">
						<td width="18%">Total Questions:</td>
						<td width="9%"><%=paper.getTotalQuestionsByPaperId(paper.getPaperId())%></td>
						<td width="9%">&nbsp;</td>
					</tr>
					<tr>
						<td>Questions Attemped:</td>
						<td><%=request.getParameter("Total")%></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td class="style4">Correct Answers:</td>
						<td class="style4"><%=request.getParameter("rightAnswer")%></td>
						<td class="style4">&nbsp;</td>
					</tr>
					<tr>
						<td>Wrong Answers:</td>
						<td><%=request.getParameter("wrongAnswer")%></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>Your Marks:</td>
						<td><%=request.getParameter("rightAnswer")%></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>Percentage:</td>
						<td><%=request.getParameter("percentage")%> <span
							class="style27">% </span></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td colspan="5"><p class="style4">
								<%
								paper.setPaperId(Integer.parseInt(request.getParameter("paperId")));
								System.out.println("getPaperId" + paper.getPaperId());
								%>
								<hr>
							</p>

							<div style="width: 100%; height: 400px; overflow: auto">


								<table width="90%" border="0">


									<%
									ArrayList list = paper.getQuestionsIdByPaperId(Integer.parseInt(request.getParameter("paperId")));
									el.Question qob = new el.Question();
									if (list != null && list.size() > 0) {
										for (int i = 0; i < list.size(); i++) {
											qob.selectQuestion(Integer.parseInt(String.valueOf(list.get(i))));
									%>
									<tr>
										<td style="vertical-align: top" width="4%" rowspan="4"><span
											class="style4"><%=i + 1 + "."%></span></td>
										<td width="96%" colspan="2"><span class="style4"><strong><%=qob.getQuestion()%></strong></span></td>
									</tr>
									<tr>
										<td><span class="style4">A<input
												name="answer<%=qob.getQuestionId()%>"
												id="answerA_<%=qob.getQuestionId()%>" type="radio" value="A"
												onclick="evaluateAnswer(this.value,<%=qob.getQuestionId()%>,'<%=qob.getAnswer()%>');"
												ondblclick="checked=false"><%=qob.getOption1()%><img
												id="A_Rimage_<%=qob.getQuestionId()%>"
												src="images/right.png" style="display: none" width="20px"
												height="15px" /><img id="A_Wimage_<%=qob.getQuestionId()%>"
												src="images/wrong.png" style="display: none" width="20px"
												height="15px" /></span></td>
										<td><span class="style4">B<input
												name="answer<%=qob.getQuestionId()%>"
												id="answerB_<%=qob.getQuestionId()%>" type="radio" value="B"
												onclick="evaluateAnswer(this.value,<%=qob.getQuestionId()%>,'<%=qob.getAnswer()%>');"
												ondblclick="checked=false"><%=qob.getOption2()%><img
												id="B_Rimage_<%=qob.getQuestionId()%>"
												src="images/right.png" style="display: none" width="20px"
												height="15px" /><img id="B_Wimage_<%=qob.getQuestionId()%>"
												src="images/wrong.png" style="display: none" width="20px"
												height="15px" /></span></td>
									</tr>
									<tr>
										<td><span class="style4">C<input
												name="answer<%=qob.getQuestionId()%>"
												id="answerC_<%=qob.getQuestionId()%>" type="radio" value="C"
												onclick="evaluateAnswer(this.value,<%=qob.getQuestionId()%>,'<%=qob.getAnswer()%>');"
												ondblclick="checked=false"><%=qob.getOption3()%><img
												id="C_Rimage_<%=qob.getQuestionId()%>"
												src="images/right.png" style="display: none" width="20px"
												height="15px" /><img id="C_Wimage_<%=qob.getQuestionId()%>"
												src="images/wrong.png" style="display: none" width="20px"
												height="15px" /></span></td>
										<td><span class="style4">D<input
												name="answer<%=qob.getQuestionId()%>"
												id="answerD_<%=qob.getQuestionId()%>" type="radio" value="D"
												onclick="evaluateAnswer(this.value,<%=qob.getQuestionId()%>,'<%=qob.getAnswer()%>');"
												ondblclick="checked=false"><%=qob.getOption4()%><img
												id="D_Rimage_<%=qob.getQuestionId()%>"
												src="images/right.png" style="display: none" width="20px"
												height="15px" /><img id="D_Wimage_<%=qob.getQuestionId()%>"
												src="images/wrong.png" style="display: none" width="20px"
												height="15px" /></span></td>
									</tr>
									<tr>
										<td height="88" colspan="2"><p>
												<span class="style19">Answer:</span><span class="style21"><%=qob.getAnswer()%></span>
											</p>
											<p>
												<span class="style19">Explaination</span>:&nbsp;&nbsp;&nbsp;<%=qob.getExplanation()%></p>
										</td>
									</tr>
									<%
									}
									}
									%>
								</table>
							</div>

							<hr />
					</tr>
					<tr align="center">
						<td height="58" colspan="5">&nbsp;</td>
					</tr>
				</table>
			</div>
		</div>
	</div>			
   <div align = "center"><span><button > <a href="OnlineTestHome.jsp" >Exit </a></button></span></div>  	
	<footer >
		<div>
			<span><%@ include file="Footer.jsp"%></span>
		</div>
	</footer>
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
		function submitFeedbackByAjax()
		{
							xmlHttp=GetXmlHttpObject();
				if(xmlHttp==null)
				{
					alert("Your browser does not support AJAX!");
					return;
				}
				var url="OnlineTestFeedbackHandlerByAjax.jsp";
				var name=document.form5.name.value;
				var email=document.form5.EmailId.value;
				var quality=document.form5.quality.value;
				var comment=document.form5.comment.value;
				var atpos=email.indexOf("@");
                var dotpos=email.lastIndexOf(".");
                if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length)
                 {
                alert("Please Enter a valid e-mail Id");
                return false;
                }
                if(comment=="" || comment=="null"){
                alert("Please put A comment");
                document.form5.comment.focus();
                return;
                }

				url=url+"?name="+name+"&emailId="+email+"&quality="+quality+"&comment="+comment;


				xmlHttp.onreadystatechange=stateChanged;
				xmlHttp.open("POST",url,true);
				xmlHttp.send(null);
		}
			
		
		function stateChanged()
		{
		if(xmlHttp.readyState==4)
			{
			result=xmlHttp.responseText;			
			
				}
		
			}		
</script>
<script>
function submitForm(){
var name=document.form5.name.value;
if(name=="" || name=="null"){
alert("Please fill Name");
document.form5.name.focus();
return;
}
document.form5.action="OnlineTestFeedbackHandler.jsp";
document.form5.submit();
}
</script>
	
</body>
</html>
