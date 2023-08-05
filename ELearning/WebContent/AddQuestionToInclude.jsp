<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*,java.lang.*" errorPage="" %>
<jsp:useBean id="question"  class="el.Question"></jsp:useBean>
<jsp:setProperty property="*" name="question"/>
<%            question.getQuestionDetails();        %>


<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>

<style type="text/css">

body {
margin-left: 0px;
margin-top: 0px;
margin-right: 0px;
margin-bottom: 0px;
}
.style2 {color: #FF0000}
.style3 {
	color: #000000;
	font-weight: bold;
	font-size: 24px;
	font-family: "Comic Sans MS";
}
</style></head>
<body>
<div>
<table width="484" height="348" border="0" cellpadding="0" cellspacing="0">
  <tr height="420">
    <td bordercolor="#00FFFF" bgcolor="#D8EAFC" ><form name="form2" method="post" action="UpdateQuestionHandler.jsp">
     
	  <table width="100%" >
		
		  
        <tr>
          <td colspan="3">Question</td>
          </tr>
        <tr>
          <td rowspan="4" width="60%"><textarea name="question" cols="50" rows="16" id="question"> <%=question.getQuestion()!=null?question.getQuestion():""%></textarea></td>
          <td width="10%" ><input name="answer"  id="answerA" type="radio" value="A">
            A</td>
          <td width="30%" ><textarea name="option1" rows="3" id="option1"><%=question.getOption1()!=null?question.getOption1():""%></textarea>
            </td>
        </tr>
        <tr>
          <td width="10%"><input name="answer" id="answerB"  type="radio" value="B">
            B</td>
          <td width="30%"><textarea name="option2" rows="3" id="option2"><%=question.getOption2()!=null?question.getOption2():""%></textarea></td>
        </tr>
        <tr>
          <td width="10%"><input name="answer" id="answerC"  type="radio" value="C">
            C</td>
          <td width="30%"><textarea name="option3" rows="3"  id="option3"><%=question.getOption3()!=null?question.getOption3():""%></textarea></td>
        </tr>
        <tr>
          <td width="10%"><input name="answer" id="answerD"  type="radio" value="D">
            D</td>
          <td width="30%"><textarea name="option4" rows="3" id="option4"><%=question.getOption4()!=null?question.getOption4():""%></textarea></td>
        </tr>
        <tr>
          <td colspan="3">Remark</td>
          </tr>
        <tr>
          <td colspan="3" ><textarea name="remarks" cols="70" rows="5" id="remarks"><%=question.getRemarks()!=null?question.getRemarks():""%></textarea></td>
          </tr>
        <tr>
          <td height="33" colspan="3" align="center" >
		  <input name="subjectId" type="hidden" id="subjectId" value="<%=question.getSubjectId()!=0?question.getSubjectId():""%>">
		  <input name="questionId" type="hidden" id="questionId" value="<%=question.getQuestionId()!=0?question.getQuestionId():""%>">
		  <input name="add" type="submit" id="add" value="Update">
            <input name="Exit" type="button" id="Exit" value="Exit" onClick="self.location='AdminHome.jsp'"></td>
          </tr>
      </table>
        </form>    </td>
  </tr>
  
  
<%  
  //response.sendRedirect("ViewQuestionSId.jsp");

  %>
</table>
</div>
<script>
var ans='<%=question.getAnswer()!=null?question.getAnswer():""%>';

if(ans=="A"){
document.getElementById("answerA").checked=true;
}else if(ans=="B"){
document.getElementById("answerB").checked=true;
}else if(ans=="C"){
document.getElementById("answerC").checked=true;
}else if(ans=="D"){
document.getElementById("answerD").checked=true;
}


</script>

</body>
</html>
