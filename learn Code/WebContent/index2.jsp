<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE HTML>
<!--
	Verti by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>

<head>
<title>learn Code</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>

<body class="is-preload homepage">
	<%
		String username = null;
		if (session.getAttribute("username") != null) {
			username = (String) session.getAttribute("username");
		}
	%>
	<div id="page-wrapper">

		<!-- Header -->
		<div id="header-wrapper">
			<header id="header" class="container">

				<!-- Logo -->
				<div id="logo">
					<h1>
						<a href="index2.jsp">learn Code</a>
					</h1>
				</div>

				<!-- Nav -->
				<nav id="nav">
					<ul>
						<!-- <li class="current"><a href="index.html">Welcome</a></li> -->
						<li><a href="left-sidebar.html">code</a></li>
						<li><a href="#">roadmap</a>
							<ul>
								<li><a href="#">웹 개발자 로드맵</a></li>
								<li><a href="#">앱 개발자 로드맵</a></li>
								<li><a href="#">보안 전문가 로드맵</a></li>
								<li><a href="#">#</a></li>
							</ul></li>
						<li><a href="#">board</a>
							<ul>
								<li><a href="bbs.jsp">자유 게시판</a></li>
								<li><a href="#">취업/진로 게시판</a></li>
								<li><a href="#">QnA</a></li>
								<!-- <li>
									<a href="#">Phasellus consequat</a>
									<ul>
										<li><a href="#">Lorem ipsum dolor</a></li>
										<li><a href="#">Phasellus consequat</a></li>
										<li><a href="#">Magna phasellus</a></li>
										<li><a href="#">Etiam dolore nisl</a></li>
									</ul>
								</li> -->
							</ul></li>
						<!-- <li>
							<a href="#"><img src="images/search.png" alt="" style="width:13px"></a>
							<ul>
								<li>
									<form action="#">
										<input type="text">
										<input type="submit">
									</form>
								</li>
							</ul>
						</li> -->
						<%
							if (username == null) {
						%>
						<li class="current"><a href="login.jsp">login</a></li>

						<%
							} else {
						%>
						<li class="current"><a href="#">my account</a>
							<ul>
								<li><a href="#">my page</a></li>
								<li><a href="logoutAction.jsp">logout</a></li>
							</ul>
						</li>
						<%
							}
						%>
					</ul>
				</nav>


			</header>
		</div>

		<!-- Banner -->
		<div id="banner-wrapper">
			<div id="banner" class="box container">
				<div class="row">

					<%
						if (username == null) {
					%>

					<div class="col-7 col-12-medium">
						<h2>Welcome!</h2>
						<p>It's a free web site for study OPEN-SOURCE</p>
					</div>
					<div class="col-5 col-12-medium">
						<ul>
							<li><a href="#"
								class="button large icon fa-arrow-circle-right">Road Map</a></li>
							<li><a href="#"
								class="button alt large icon fa-question-circle">Login</a></li>
						</ul>
					</div>
					<%
						} else {
					%>
					<div class="col-7 col-12-medium">
						<h2>
							Hi,
							<%=username%>!
						</h2>
						<p>Let's study hard</p>
						<p>together :)</p>
					</div>
					<div class="col-5 col-12-medium">

						<!-- <div><img src="images/search.png"></div> -->
						<ul>
							<li><a href="#"
								class="button large icon fa-arrow-circle-right">Road Map</a></li>
							<li><a href="#"
								class="button alt large icon fa-question-circle">My Page</a></li>
						</ul>
					</div>
					<%
						}
					%>

				</div>
			</div>
		</div>

		<!-- Features -->
		<div id="features-wrapper">
			<div class="container">
				<div class="row">
					<div class="col-4 col-12-medium">
						<!-- Box -->
						<section class="box feature">
							<a href="#" class="image featured"><img
								src="images/pic01.jpg" alt="" /></a>
							<div class="inner">
								<header>
									<a>
										<h2>JAVA Tetris Game Open Source</h2>
									</a> <a>
										<p>JAVA</p>
									</a>
								</header>
								<p>description</p>
							</div>
						</section>

					</div>
					<div class="col-4 col-12-medium">
						<!-- Box -->
						<section class="box feature">
							<a href="#" class="image featured"><img
								src="images/pic01.jpg" alt="" /></a>
							<div class="inner">
								<header>
									<a>
										<h2>JAVA Tetris Game Open Source</h2>
									</a> <a>
										<p>JAVA</p>
									</a>
								</header>
								<p>description</p>
							</div>
						</section>

					</div>
					<div class="col-4 col-12-medium">
						<!-- Box -->
						<section class="box feature">
							<a href="#" class="image featured"><img
								src="images/pic01.jpg" alt="" /></a>
							<div class="inner">
								<header>
									<a>
										<h2>JAVA Tetris Game Open Source</h2>
									</a> <a>
										<p>JAVA</p>
									</a>
								</header>
								<p>description</p>
							</div>
						</section>
					</div>
				</div>
			</div>
			<div class="lead-btn">
				<button class="button">lead more</button>
			</div>
		</div>

		<!-- Main -->
		<div id="main-wrapper">
			<div class="container">
				<div class="row gtr-200">
					<div class="sidebar col-12-medium">

						<!-- Sidebar -->
						<div id="sidebar">
							<section class="widget thumbnails">
								<h3>Interesting stuff</h3>
								<div class="grid">
									<div class="row gtr-50">
										<div class="col-6">
											<a href="#" class="image fit"><img src="images/pic04.jpg"
												alt="" /></a>
										</div>
										<div class="col-6">
											<a href="#" class="image fit"><img src="images/pic05.jpg"
												alt="" /></a>
										</div>
										<div class="col-6">
											<a href="#" class="image fit"><img src="images/pic06.jpg"
												alt="" /></a>
										</div>
										<div class="col-6">
											<a href="#" class="image fit"><img src="images/pic07.jpg"
												alt="" /></a>
										</div>
									</div>
								</div>
								<a href="#" class="button icon fa-file-text-o">More</a>
							</section>
						</div>

					</div>
					<div class="col-8 col-12-medium imp-medium">

						<!-- Content -->
						<div id="content">
							<section class="last">
								<h2>So what's this all about?</h2>
								<p>
									This is <strong>Verti</strong>, a free and fully responsive
									HTML5 site template by <a href="http://html5up.net">HTML5
										UP</a>. Verti is released under the <a
										href="http://html5up.net/license">Creative Commons
										Attribution license</a>, so feel free to use it for any personal
									or commercial project you might have going on (just don't
									forget to credit us for the design!)
								</p>
								<p>Phasellus quam turpis, feugiat sit amet ornare in,
									hendrerit in lectus. Praesent semper bibendum ipsum, et
									tristique augue fringilla eu. Vivamus id risus vel dolor auctor
									euismod quis eget mi. Etiam eu ante risus. Aliquam erat
									volutpat. Aliquam luctus mattis lectus sit amet phasellus quam
									turpis.</p>
								<a href="#" class="button icon fa-arrow-circle-right">Continue
									Reading</a>
							</section>
						</div>

					</div>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<div id="footer-wrapper">
			<footer id="footer" class="container">
				<div class="row">
					<div class="col-3 col-6-medium col-12-small">

						<!-- Links -->
						<section class="widget links">
							<h3>Random Stuff</h3>
							<ul class="style2">
								<li><a href="#">Etiam feugiat condimentum</a></li>
								<li><a href="#">Aliquam imperdiet suscipit odio</a></li>
								<li><a href="#">Sed porttitor cras in erat nec</a></li>
								<li><a href="#">Felis varius pellentesque potenti</a></li>
								<li><a href="#">Nullam scelerisque blandit leo</a></li>
							</ul>
						</section>

					</div>
					<div class="col-3 col-6-medium col-12-small">

						<!-- Links -->
						<section class="widget links">
							<h3>Random Stuff</h3>
							<ul class="style2">
								<li><a href="#">Etiam feugiat condimentum</a></li>
								<li><a href="#">Aliquam imperdiet suscipit odio</a></li>
								<li><a href="#">Sed porttitor cras in erat nec</a></li>
								<li><a href="#">Felis varius pellentesque potenti</a></li>
								<li><a href="#">Nullam scelerisque blandit leo</a></li>
							</ul>
						</section>

					</div>
					<div class="col-3 col-6-medium col-12-small">

						<!-- Links -->
						<section class="widget links">
							<h3>Random Stuff</h3>
							<ul class="style2">
								<li><a href="#">Etiam feugiat condimentum</a></li>
								<li><a href="#">Aliquam imperdiet suscipit odio</a></li>
								<li><a href="#">Sed porttitor cras in erat nec</a></li>
								<li><a href="#">Felis varius pellentesque potenti</a></li>
								<li><a href="#">Nullam scelerisque blandit leo</a></li>
							</ul>
						</section>

					</div>
					<div class="col-3 col-6-medium col-12-small">

						<!-- Contact -->
						<section class="widget contact last">
							<h3>Contact Us</h3>
							<ul>
								<li><a href="#" class="icon fa-twitter"><span
										class="label">Twitter</span></a></li>
								<li><a href="#" class="icon fa-facebook"><span
										class="label">Facebook</span></a></li>
								<li><a href="#" class="icon fa-instagram"><span
										class="label">Instagram</span></a></li>
								<li><a href="#" class="icon fa-dribbble"><span
										class="label">Dribbble</span></a></li>
								<li><a href="#" class="icon fa-pinterest"><span
										class="label">Pinterest</span></a></li>
							</ul>
							<p>
								1234 Fictional Road<br /> Nashville, TN 00000<br /> (800)
								555-0000
							</p>
						</section>

					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div id="copyright">
							<ul class="menu">
								<li>&copy; Untitled. All rights reserved</li>
								<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
							</ul>
						</div>
					</div>
				</div>
			</footer>
		</div>

	</div>

	<!-- Scripts -->

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>

</html>