<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.free_BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
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
<link rel="stylesheet" href="assets/css/bbs.css" />
</head>

<body class="is-preload homepage">
	<%
		String username = null;
		if (session.getAttribute("username") != null) {
			username = (String) session.getAttribute("username");
		}
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
								<p></p>
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
								<div class="bbs-description">
									<h2 class="bbs-title">자유 게시판</h2>
									<p>광고글을 올릴시 무단삭제, 활동정지 될 수 있습니다</p>
								</div>

								<%
									free_BbsDAO bbsDAO = new free_BbsDAO();

									ArrayList<Bbs> list = bbsDAO.getList(pageNumber);

									if (list.size() == 0) {
								%>
								<div>0</div>
								<div style="text-align: center;">
									<h4>등록된 글이 없습니다.</h4>
								</div>

								<%
									} else {
								%>
								<div>
									총 게시글:
									<%=list.size()%></div>
								<%
									}

									for (int i = 0; i < list.size(); i++) {
								%>

								<div class="bbs-list-item">
									<div class="item-main">
										<div class="item-number"><%=list.get(i).getBbsID()%></div>
										<div class="item-title">
											<a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle()%></a>
										</div>
										<span class="item-username"><i><%=list.get(i).getUsername()%></i></span>
										<span class="item-date"><%=list.get(i).getBbsDate()%></span>
									</div>

									<div class="item-sub">
										<div class="item-count">253</div>
										<div class="item-like">
											<!-- <svg></svg> -->
											12
										</div>
									</div>
								</div>
								<%
									}
								%>
								<div class="bbs-list-item-last"></div>




							</article>

							<%
								if (pageNumber != 1) {
							%>
							<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>" class="">이전</a>
							<%
								}
								if (bbsDAO.nextPage(pageNumber + 1)) {
							%>
							<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>" class="">다음</a>
							<%
								}
							%>

							<a href="write.jsp"><input type="submit"
								class="submit-button" value="Write"
								style="font-size: 1.2em; float: right;"></a>

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