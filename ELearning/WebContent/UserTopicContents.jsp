<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*,el.*" errorPage="" %>
<jsp:useBean id="topic"  class="el.Topic"></jsp:useBean>
<!DOCTYPE html >
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Premium Series by Free CSS Templates</title>
<meta name="keywords" content="" />
<meta name="Premium Series" content="" />
<link href="default.css" rel="stylesheet" type="text/css" media="screen" />
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
.style1 {color: #000000}
a:hover {
	color: #6A00D5;
}
a:active {
	color: #8C033C;
}
-->
</style>
</head>
<body>
<!-- start header -->
<div id="header">
	<div id="logo">
		<h1><a href="#"><span>Power</span>aptitude</a></h1>
		<p>Designed By KP INFOTECH LTD. </p>
	</div>
	<div class="men" >
		<ul>
<li><a href="AdminHome.jsp" >Home</a></li>
<li><a href="#" >Subject</a>
<ul>
    <li><a href="AddSubject.jsp" >Add</a></li>
    <li><a href="SubjectList.jsp" >View All</a></li>
    <li><a href="Search.jsp" >Search</a></li>
    
    </ul>
</li>

<li><a href="#" >Topic</a>
<ul>
    <li><a href="AddTopic.jsp" >Add</a></li>
    <li><a href="TopicList.jsp" >View All</a></li>
    <li><a href="Search.jsp" >Search</a></li>
    
    </ul>
</li>
<li><a href="#" >Add Contents</a>
    <ul>
    <li><a href="AddTopicContents.jsp">add</a></li>
    <li><a href="DoctorList.jsp" >Doctor Information</a></li>
    <li><a href="KioskList.jsp" >Kiosk Information</a></li>
    
    </ul>
</li>
<li><a href="AdminComplaintResponse.jsp" >Complaints</a></li>
<li><a href="AdminViewAppointmentList.jsp" >Appointment</a></li>
<li><a href="AdminFeedback.jsp" >Feedback</a></li>
<li><a href="Logout.jsp" >Logout</a></li>
</ul>
  </div>
	
</div>
<!-- end header -->
<div id="wrapper">
	<!-- start page -->
	<div id="page">
		<div id="sidebar1" class="sidebar">
			<ul>
				<li>
					<h2 align="center"><%=topic.getSubjectNameById(Integer.parseInt(request.getParameter("subjectId")))%></h2>
					
					<ul><div style="overflow:auto; height:300px; width:100%"   align="left"><jsp:include page="UserTopic.jsp"/></div>
						
					</ul>
				</li>
				<li>
					<h2>Recent Comments</h2>
					<ul>
						<li><a href="#">Free CSS Templates</a> on <a href="#">Aliquam libero</a></li>
						<li><a href="#">Free CSS Templates</a> on <a href="#">Consectetuer adipiscing elit</a></li>
						<li><a href="#">Free CSS Templates</a> on <a href="#">Metus aliquam pellentesque</a></li>
						<li><a href="#">Free CSS Templates</a> on <a href="#">Suspendisse iaculis mauris</a></li>
						<li><a href="#">Free CSS Templates</a> on <a href="#">Urnanet non molestie semper</a></li>
						<li><a href="#">Free CSS Templates</a> on <a href="#">Proin gravida orci porttitor</a></li>
					</ul>
				</li>
				<li>
					<h2>Categories</h2>
					<ul>
						<li><a href="#" class="style1">Aliquam libero</a></li>
						<li><a href="#">Consectetuer adipiscing elit</a></li>
						<li><a href="#">Metus aliquam pellentesque</a></li>
						<li><a href="#">Suspendisse iaculis mauris</a></li>
						<li><a href="#">Urnanet non molestie semper</a></li>
						<li><a href="#">Proin gravida orci porttitor</a></li>
					</ul>
				</li>
				<li>
					<h2>Archives</h2>
					<ul>
						<li><a href="#">September</a> (23)</li>
						<li><a href="#">August</a> (31)</li>
						<li><a href="#">July</a> (31)</li>
						<li><a href="#">June</a> (30)</li>
						<li><a href="#">May</a> (31)</li>
					</ul>
				</li>
			</ul>
		</div>
		<!-- start content -->
		<div id="content">
		  <!-- Start WOWSlider.com BODY section id=wowslider-container1 -->
<div id="wowslider-container1">
	  <div class="ws_shadow"></div>
	</div>
	<script type="text/javascript" src="engine1/wowslider.js"></script>
	<script type="text/javascript" src="engine1/script.js"></script>
<!-- End WOWSlider.com BODY section -->

<div class="post">
  <!-- Start WOWSlider.com BODY section id=wowslider-container2 -->
<div id="wowslider-container2"><a class="wsl" href="http://wowslider.com">Vertical Image Scroller jQuery by WOWSlider.com v2.9</a> <a href="#" class="ws_frame"></a>
<div class="ws_shadow"></div>
	</div>
	<script type="text/javascript" src="engine2/wowslider.js"></script>
	<script type="text/javascript" src="engine2/script.js"></script>
<!-- End WOWSlider.com BODY section -->

<div class="entry">
					<p>&nbsp;</p>
		</div>
		  </div>
			<div class="post">
				<h2 class="title"><a href="#">Sample Tags</a></h2>
				<p class="byline"><small>Posted on October 1st, 2009 by <a href="#">Free CSS Templates</a></small></p>
				<div class="entry">
					<h3>An H3 Followed by a Blockquote:</h3>
					<blockquote>
						<p>&#8220;Donec leo, vivamus nibh in augue at urna congue rutrum. Quisque dictum integer nisl risus, sagittis convallis, rutrum id, congue, and nibh.&#8221;</p>
					</blockquote>
					<h3>Bulleted List:</h3>
					<ul>
						<li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>
						<li>Phasellus nec erat sit amet nibh pellentesque congue.</li>
						<li>Cras vitae metus aliquam risus pellentesque pharetra.</li>
					</ul>
					<h3>Numbered List:</h3>
					<ol>
						<li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>
						<li>Phasellus nec erat sit amet nibh pellentesque congue.</li>
						<li>Cras vitae metus aliquam risus pellentesque pharetra.</li>
					</ol>
					<p class="links"><a href="#" class="more">&laquo;&laquo;&nbsp;&nbsp;Read More&nbsp;&nbsp;&raquo;&raquo;</a></p>
				</div>
			</div>
			<div class="post">
				<h2 class="title"><a href="#">Lorem Ipsum Dolor </a></h2>
				<p class="byline"><small>Posted on October 1st, 2009 by <a href="#">Free CSS Templates</a></small></p>
				<div class="entry">
					<p>Consectetuer adipiscing elit. Nam pede erat, porta eu, lobortis eget, tempus et, tellus. Etiam neque. Vivamus consequat lorem at nisl. Nullam non wisi a sem semper eleifend. Donec mattis libero eget urna. Duis pretium velit ac mauris. Proin eu wisi suscipit nulla suscipit interdum. Aenean lectus lorem, imperdiet at, ultrices eget, ornare et, wisi. </p>
					<p class="links"><a href="#" class="more">&laquo;&laquo;&nbsp;&nbsp;Read More&nbsp;&nbsp;&raquo;&raquo;</a></p>
				</div>
			</div>
	  </div>
		<!-- end content -->
		<!-- start sidebars -->
		<div id="sidebar2" class="sidebar">
			<ul>
				<li>
					<form id="searchform" method="get" action="#">
						<div>
							<h2>Site Search</h2>
							<input type="text" name="s" id="s" size="15" value="" />
						</div>
					</form>
				</li>
				<li>
					<h2>Tags</h2>
					<p class="tag"><a href="#">dolor</a> <a href="#">ipsum</a> <a href="#">lorem</a> <a href="#">sit amet</a> <a href="#">dolor</a> <a href="#">ipsum</a> <a href="#">lorem</a> <a href="#">sit amet</a></p></li>
				<li>
					<h2>Calendar</h2>
					<div id="calendar_wrap">
						<table summary="Calendar">
							<caption>
							October 2009
							</caption>
							<thead>
								<tr>
									<th abbr="Monday" scope="col" title="Monday">M</th>
									<th abbr="Tuesday" scope="col" title="Tuesday">T</th>
									<th abbr="Wednesday" scope="col" title="Wednesday">W</th>
									<th abbr="Thursday" scope="col" title="Thursday">T</th>
									<th abbr="Friday" scope="col" title="Friday">F</th>
									<th abbr="Saturday" scope="col" title="Saturday">S</th>
									<th abbr="Sunday" scope="col" title="Sunday">S</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<td abbr="September" colspan="3" id="prev"><a href="#" title="View posts for September 2009">&laquo; Sep</a></td>
									<td class="pad">&nbsp;</td>
									<td colspan="3" id="next">&nbsp;</td>
								</tr>
							</tfoot>
							<tbody>
								<tr>
									<td>1</td>
									<td>2</td>
									<td>3</td>
									<td id="today">4</td>
									<td>5</td>
									<td>6</td>
									<td>7</td>
								</tr>
								<tr>
									<td>8</td>
									<td>9</td>
									<td>10</td>
									<td>11</td>
									<td>12</td>
									<td>13</td>
									<td>14</td>
								</tr>
								<tr>
									<td>15</td>
									<td>16</td>
									<td>17</td>
									<td>18</td>
									<td>19</td>
									<td>20</td>
									<td>21</td>
								</tr>
								<tr>
									<td>22</td>
									<td>23</td>
									<td>24</td>
									<td>25</td>
									<td>26</td>
									<td>27</td>
									<td>28</td>
								</tr>
								<tr>
									<td>29</td>
									<td>30</td>
									<td>31</td>
									<td class="pad" colspan="4">&nbsp;</td>
								</tr>
							</tbody>
						</table>
					</div>
				</li>
				<li>
					<h2>Categories</h2>
					<ul>
						<li><a href="#">Aliquam libero</a></li>
						<li><a href="#">Consectetuer adipiscing elit</a></li>
						<li><a href="#">Metus aliquam pellentesque</a></li>
						<li><a href="#">Suspendisse iaculis mauris</a></li>
						<li><a href="#">Urnanet non molestie semper</a></li>
						<li><a href="#">Proin gravida orci porttitor</a></li>
						<li><a href="#">Aliquam libero</a></li>
						<li><a href="#">Consectetuer adipiscing elit</a></li>
						<li><a href="#">Metus aliquam pellentesque</a></li>
						<li><a href="#">Urnanet non molestie semper</a></li>
						<li><a href="#">Proin gravida orci porttitor</a></li>
						<li><a href="#">Aliquam libero</a></li>
						<li><a href="#">Consectetuer adipiscing elit</a></li>
						<li><a href="#">Metus aliquam pellentesque</a></li>
						<li><a href="#">Suspendisse iaculis mauris</a></li>
						<li><a href="#">Urnanet non molestie semper</a></li>
						<li><a href="#">Proin gravida orci porttitor</a></li>
						<li><a href="#">Metus aliquam pellentesque</a></li>
						<li><a href="#">Suspendisse iaculis mauris</a></li>
						<li><a href="#">Urnanet non molestie semper</a></li>
						<li><a href="#">Proin gravida orci porttitor</a></li>
						<li><a href="#">Metus aliquam pellentesque</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<!-- end sidebars -->
		<div style="clear: both;">&nbsp;</div>
	</div>
	<!-- end page -->
</div>
<div id="footer">
	<p class="copyright">&copy;&nbsp;&nbsp;2013 All Rights Reserved &nbsp;&bull;&nbsp; Design by <a href="http://www.freecsstemplates.org/">Kp Infotech Ltd </a>.</p>
	<p class="link"><a href="#">Privacy Policy</a>&nbsp;&#8226;&nbsp;<a href="#">Terms of Use</a></p>
</div>
</body>
</html>
