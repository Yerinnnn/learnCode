<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.free_BbsDAO"%>
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
<link rel="stylesheet" href="assets/css/bbs.css">
</head>

<body class="is-preload homepage">
	<%
		String username = null;
		if (session.getAttribute("username") != null) {
			username = (String) session.getAttribute("username");
		}
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'bbs.jsp");
			script.println("</script>");
		}
		Bbs bbs = new free_BbsDAO().getBbs(bbsID);
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
						<li><a href="#" id="active">board</a>
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
							</ul></li>
						<%
							}
						%>
					</ul>
				</nav>


			</header>
		</div>

		<!-- Main -->
		<div id="main-wrapper">
			<div class="container">
				<div class="row gtr-200">
					<div class="sidebar col-12-medium">
						<div id="sidebar">

							<!-- Sidebar -->
							<section>
								<div class="filter">
									<h3 class="filter-title">board</h3>
									<ul>
										<li><a class="filter-item filter-item-active">자유 게시판<span
												class="count">253</span></a></li>
										<li><a class="filter-item">취업/진로 게시판<span
												class="count">253</span></a></li>
										<li><a class="filter-item">QnA<span class="count">253</span></a></li>
										<li><a></a></li>
									</ul>
								</div>
								<footer>
									<a href="#" class="button icon fa-info-circle"
										style="font-size: 1.3em">Find out more</a>
								</footer>
							</section>

							<section>
								<h3>Subheading</h3>
								<ul class="style2">
									<li><a href="#">HTML5</a></li>
									<li><a href="#">JAVA</a></li>
									<li><a href="#">C, C#, C++</a></li>
									<li><a href="#">Python</a></li>
									<li><a href="#">Amet ornare in hendrerit in lectus</a></li>
									<li><a href="#">Semper mod quisturpis nisi</a></li>
								</ul>
							</section>

						</div>
					</div>
					<div class="col-8 col-12-medium imp-medium">
						<div id="content">

							<!-- Content -->
							<article>
								<div>
									<table class="bbs-list">
										<thead>
											<tr class="">
												<td style="font-weight: 400;"><%=bbs.getBbsID()%></td>
												<td style="width:100%;text-align: left; font-weight: 700;font-size:1.4em"><%=bbs.getBbsTitle()%></td>
											</tr>
											<tr class="table-head">
												<th style="font-weight: 400;text-align: left"><%=bbs.getUsername()%></th>
												<th style="font-weight: 400;text-align: right"><%=bbs.getBbsDate()%></th>
												<th style="font-weight: 400;text-align: right">12</th>
											</tr>
										</thead>
										<tbody>
											<tr class="table-content">
												<td colspan="3" style="text-align: left;height:30em"><%=bbs.getBbsContent()%></td>
											</tr>
										</tbody>
									</table>

								</div>
								<%
									if (username != null && username.equals(bbs.getUsername())) {
								%>

								<a href="update.jsp?bbsID=<%=bbsID%>"><input type="submit"
									class="submit-button" value="Edit"
									style="font-size: 1em; float: left; margin-right: 5px"></a>
								<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%=bbsID%>"><input
									type="submit" id="delete-button" value="delete"
									style="font-size: 1em; float: left;"> </a>
								<%
									}
								%>
								<a href="bbs.jsp"> <input type="submit"
									class="submit-button" value="list"
									style="font-size: 1em; float: right;">
								</a>
							</article>
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