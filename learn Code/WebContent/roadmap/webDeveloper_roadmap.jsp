<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!doctype html>
<html class="no-js" lang="ko">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>learn Code</title>
  <link rel="stylesheet" href="css/index.css">
</head>

<body>
   <%
		String username = null;
		if (session.getAttribute("username") != null) {
			username = (String) session.getAttribute("username");
		}
	%>
	
  <!-- header 부분 -->
  <div class="title-bar" data-responsive-toggle="realEstateMenu" data-hide-for="small">
    <button class="menu-icon" type="button" data-toggle></button>
    <div class="title-bar-title">Menu</div>
  </div>
  <div class="top-bar" id="realEstateMenu">
    <div class="top-bar-left">
      <ul class="menu" id="main-menu" data-responsive-menu="accordion">
        <li class="menu-text"><a href="main.jsp">learn Code</a></li>
        <li><a href="#">code</a></li>
        <li><a href="#">roadmap</a>
			<ul id="sub-menu">
                <li><a href="webDeveloper_roadmap.jsp" area-label="sub-menu">웹개발자</a></li>
                <li><a href="#" area-label="sub-menu">보안</a></li>
                <li><a href="#" area-label="sub-menu">인공지능</a></li>
            </ul>
        </li>
        <li><a href="#">board</a>
            <ul id="sub-menu">
                <li><a href="#" area-label="sub-menu">취업/진로 게시판</a></li>
                <li><a href="#" area-label="sub-menu">자유 게시판</a></li>
                <li><a href="#" area-label="sub-menu">QnA</a></li>
            </ul>
        </li>
        <li class="search"><a href="#"><image class="search_icon" src="images/search.png"></image></a></li>
      </ul>
    </div>
    <%
    	if(username == null) {
    		
    %>
    <div class="top-bar-right">
      <ul class="menu">
        <!-- <li><a href="#">My Account</a></li> -->
        <li><a class="button" href="login.jsp">Login</a></li>
        <!-- <li><a class="button" href="">Logout</a></li> -->
      </ul>
    </div>
  </div>
  <%
    	} else {
  %>
  <div class="top-bar-right">
      <ul class="menu">
        <li><a href="myAccount.jsp">My Account</a></li>
        <li><a class="button" href="logoutAction.jsp">Logout</a></li>
        <!-- <li><a class="button" href="">Logout</a></li> -->
      </ul>
    </div>
  </div>
  <%
    	}
  %>

  <!-- roadmap 부분 -->
  

  <!-- footer 부분 -->
  <footer>
    <div class="row expanded callout secondary">
      <div class="small-6 large-3 columns">
        <p class="lead">Offices</p>
        <ul class="menu vertical">
          <li><a href="#">One</a></li>
          <li><a href="#">Two</a></li>
          <li><a href="#">Three</a></li>
          <li><a href="#">Four</a></li>
        </ul>
      </div>
      <div class="small-6 large-3 columns">
        <p class="lead">Solar Systems</p>
        <ul class="menu vertical">
          <li><a href="#">One</a></li>
          <li><a href="#">Two</a></li>
          <li><a href="#">Three</a></li>
          <li><a href="#">Four</a></li>
        </ul>
      </div>
      <div class="small-6 large-3 columns">
        <p class="lead">Contact</p>
        <ul class="menu vertical">
          <li><a href="#"><i class="fi-social-twitter"></i> Twitter</a></li>
          <li><a href="#"><i class="fi-social-facebook"></i> Facebook</a></li>
          <li><a href="#"><i class="fi-social-instagram"></i> Instagram</a></li>
          <li><a href="#"><i class="fi-social-pinterest"></i> Pinterest</a></li>
        </ul>
      </div>
      <div class="small-6 large-3 columns">
        <p class="lead">Offices</p>
        <ul class="menu vertical">
          <li><a href="#">One</a></li>
          <li><a href="#">Two</a></li>
          <li><a href="#">Three</a></li>
          <li><a href="#">Four</a></li>
        </ul>
      </div>
    </div>

    <!-- 기타 부분 -->
    <div class="row">
      <div class="medium-6 columns">
        <ul class="menu">
          <li><a href="#">Legal</a></li>
          <li><a href="#">Partner</a></li>
          <li><a href="#">Explore</a></li>
        </ul>
      </div>
      <div class="medium-6 columns">
        <ul class="menu float-right">
          <li class="menu-text">Copyright</li>
        </ul>
      </div>
    </div>
  </footer>

  <!-- script -->

  <!-- load more 버튼 누르면 더 나오게 -->
  <!-- see load map -->
  <!-- start a free trial -->
  <!-- login -->
  <!-- search now -->
  <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
  <script src="https://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.js"></script>
  <script>
    $(document).foundation();
  </script>
</body>

</html>