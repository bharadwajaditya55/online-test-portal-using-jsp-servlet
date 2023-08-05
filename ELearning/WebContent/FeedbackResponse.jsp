<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*" %>

<jsp:useBean id="submitfeedback"  class="el.Feedback"></jsp:useBean>
<jsp:setProperty name="submitfeedback" property="*"/>
        <%   submitfeedback.getFeed();    %>

<!DOCTYPE html>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Feedback</title>
<meta name="keywords" content="" />
<meta name="Premium Series" content="" />
<style>

body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #616161;
}
men{
border:none;
border:0px;
margin:0px;
padding:0px;
font-family: "Comic Sans MS"
font-size:14px;
font-weight:bold;

}
.men ul{
background:#6A00D5;
height:50px;
list-style:none;
margin:0;
padding:0;
font-family: "Comic Sans MS"
font-size:14px;
font-weight:bold;
}


.men li{
float:left;
padding:0px;
}
.men li a{
background:#6A00D5 url("http://i47.tinypic.com/qp53sw.jpg") bottom right no-repeat;
color:#cccccc;
display:block;
font-weight:normal;
font-family: "Comic Sans MS"
line-height:40px;
margin:0px;
padding:0px 30px;
text-align:center;
text-decoration:none;
}
.men li a:hover, .men ul li:hover a{
background: #2580a2 url("http://i49.tinypic.com/13zbc53.jpg") bottom center no-repeat;
color:#FFFFFF;
font-style:Comic Sans MS;
text-decoration:none;
font-family: "Comic Sans MS"
}
.men li ul{
background:#00CCFF;
display:none;

height:auto;
padding:0px;
margin:0px;
border:0px;

position:absolute;
width:150px;
z-index:200;
/*top:1em;
/*left:0;*/
}
.men li:hover ul{
display:block;

}
.men li li {
background:url('http://i45.tinypic.com/nvxxqg.jpg') bottom left no-repeat;
display:block;
float:none;
margin:0px;
padding:0px;
width:150px;

}
.men li:hover li a{
background:none;

}
.men li ul a{
display:block;
height:40px;
font-size:12px;

margin:0px;
padding:0px 10px 0px 15px;
text-align:left;
}



.men li ul a:hover, .men li ul li:hover a{
background:#2580a2 url('http://i50.tinypic.com/66elwh.jpg') center left no-repeat;
border:0px;
color:#ffffff;
text-decoration:none;

}
.men p{
clear:left;
}

</style>


<!-- Start WOWSlider.com HEAD section -->
	<link rel="stylesheet" type="text/css" href="engine1/style.css" media="screen" />
	<script type="text/javascript" src="engine1/jquery.js"></script>
<!-- End WOWSlider.com HEAD section -->



<!-- Start WOWSlider.com HEAD section -->
	<link rel="stylesheet" type="text/css" href="engine2/style.css" media="screen" />
	<script type="text/javascript" src="engine2/jquery.js"></script>
<!-- End WOWSlider.com HEAD section -->

<style type="text/css">
<!--
a:hover {
	color: #6A00D5;
}
a:active {
	color: #8C033C;
}
.style2 {
	font-family: "Comic Sans MS";
	font-size: 24px;
	color: #FFFFFF;
}

.style8 {
	font-family: "Comic Sans MS";
	font-size: 18px;
	color: #FFFFFF;
}



.style4 {
	font-size: 18px;
	font-family: "Times New Roman";
   
	background-color:#F17292; 
	height:inherit;
	border-radius: 10%;
	border:#F17292;
    width:560px;
    
}


.style6 {
	font-size: 14px;
	font-family: "Comic Sans MS";
	background-color:#F17292; 
	height:inherit;
	border-radius: 10%;
	border:#F17292;
    width:150px;
    
}

.style3 {
	font-size: 18px;
	font-family:"Comic Sans MS";
    color: #000000;
	 
}

#myoval {

border-radius:1%;

overflow: hidden;
  }
.style10 {color: #F495AD}


  
-->
</style>




</head>
<body>
<script>
function submitForm(){


var name=document.form1.username.value;
var email=document.form1.useremailId.value;
var description=document.form1.comment.value;


//alert(subid);
//alert(topicname);
//alert(description);


//var tid=document.form1.topicId.value;


if(name=="" || name=="null"){
alert("Please fill Name");
document.form1.username.focus();
return;
}

//var x=document.forms["myForm"]["email"].value;
var atpos=email.indexOf("@");
var dotpos=email.lastIndexOf(".");
if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length)
  {
  alert("Please Enter a valid e-mail Id");
  return false;
  }
  
if(description=="" || description=="null"){
alert("Please Give a Description");
document.form1.comment.focus();
return;
}

document.form1.action="FeedbackHandler.jsp?username="+name+"&useremailId="+email+"&pageFlag=0";
document.form1.submit();
}
</script>



<!-- start header -->
<div id="header">
	<div id="logo">
		<h1><a href="#"><span>Power</span>aptitude</a></h1>
		<p>Designed By KP INFOTECH LTD. </p>
	</div>
	<div class="men" >
		<ul>
<li><a href="index.jsp" >Home</a></li>
<li><a href="index.jsp" >Subject</a>

</li>

<li><a href="OnlineTestHome.jsp" >Online Test</a>

</li>
<li><a href="#">Online Book Store </a>
    
</li>

<li><a href="#" >About Us</a></li>
<li><a href="Feedback.jsp" >Feedback</a></li>
<li><a href="#" >Contact Us</a></li>
</ul>
  </div>
	
</div>
<!-- end header -->
<div id="wrapper">
	<!-- start page -->
	<div id="page"><!-- start content -->
      <!-- end content -->
      <!-- start sidebars -->
      <!-- end sidebars -->


<div style="clear: both;">

<form name="form1" method="post" >

      <div>
        <table  align="center" width="70%"  bgcolor="#F7AEC0" cellspacing="9" cellpadding="2">
          <tr>
            <td width="13%" rowspan="3" background="images/SM234316.jpeg">&nbsp;</td>
            <td width="87%" height="20" bgcolor="#333333" ><span class="style8">Last Comment</span></td>
          </tr>
          <tr>
            <td height="25" ><label><span class="stylegrey"><%=submitfeedback.getUsername()%></span></label></td>
          </tr>
          <tr>
            <td height="21"><%="at"+"  "+submitfeedback.getDateofcomment() %></td>
          </tr>
          <tr>
            <td height="40"     colspan="2" ><label><span class="stylegrey"><%=submitfeedback.getComment()%></span></label></td>
            </tr>
		   
        </table>
		
        
</div>    
        <table  align="center" width="70%" height="150px">
		</table>
	
	<div>
	<table width="40%" cellspacing="9" cellpadding="2">
    <tr>
      <td height="45" bgcolor="#333333"><span class="style2">Leave a Reply </span></td>
    </tr>
    <tr>
      <td height="25"><span class="style3">Name</span></td>
    </tr>
	
    <tr>
      <td height="41"   bgcolor="#F17292" > <input class="style4" type="text" name="username"   id="username" />
      </td>
    </tr>
    <tr>
      <td height="25"><span class="style3">Email</span></td>
    </tr>
    <tr>
      <td height="40" bgcolor="#F17292" ><input  type="text" name="useremailId" class="style4" id="useremailId" /></td>
    </tr>
    <tr>
      <td height="25"><span class="style3">Comment</span></td>
    </tr>
	  
    <tr>
      <td height="139" bgcolor="#F17292"><textarea name="comment" cols="65" rows="8" class="style4" id="comment"></textarea></td>
    </tr>
    <tr>
      <td height="27"><input type="button"  class="style6"name="Post Comment" id="Post Comment" value="Post Comment" onClick="submitForm();"/>
      </td>
	  <td>
	 

 
	  </td>
    </tr>
  </table>
	</div>
	
	</form>
	
	
	
</div>
  </div>
	<!-- end page -->
</div>
<div id="footer">
	<p class="copyright">&copy;&nbsp;&nbsp;2013 All Rights Reserved &nbsp;&bull;&nbsp; Design by <a href="http://www.freecsstemplates.org/">Kp Infotech Ltd </a>.</p>
	<p class="link"><a href="#">Privacy Policy</a>&nbsp;&#8226;&nbsp;<a href="#">Terms of Use</a></p>
</div>
</body>
</html>
