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
                <li><a href="roadmap/webDeveloper_roadmap.jsp" area-label="sub-menu">웹개발자</a></li>
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
  <%
    	}
  %>

  <!-- 소개글 부분 -->
  <br>
  <div class="row">
    <div class="medium-7 large-6 columns">
      <h1>Close Your Eyes and Open Your Mind</h1>
      <p class="subheader">There is beauty in space, and it is orderly. There is no weather, and there is regularity. It
        is predictable. Everything in space obeys the laws of physics. If you know these laws, and obey them, space will
        treat you kindly.</p>
      <button class="button">See Road Map</button>
      <button class="button">Start a free trial</button>
    </div>
    <div class="show-for-large large-3 columns">
      <img src="https://placehold.it/400x370&text=PSR1257 + 12 C" alt="picture of space">
    </div>
    <div class="medium-5 large-3 columns">
      <div class="callout secondary">
        <form>
          <div class="row">
            <div class="small-12 columns">
              <label>Find Your Dream Code
                <input type="text" placeholder="Search destinations">
              </label>
            </div>
            <div class="small-12 columns">
              <label>Find Your Dream Language
                <!-- type number 바꾸기 -->
                <input type="number" placeholder="Moons required">
              </label>
              <button type="submit" class="button">Search Now!</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>

  <div class="row column">
    <hr>
  </div>

  <!-- main 부분 -->
  <div class="row column">
    <p class="lead">Trending Planetary Destinations</p>
  </div>
  <div class="row small-up-1 medium-up-2 large-up-3">
    <div class="column">
      <div class="callout">
        <!-- 언어 이름 -->
        <p>HTML</p>
        <!-- 코드 미리보기 사진 넣으면 어떨까 -->
        <p><img src="https://placehold.it/400x370&text=Pegasi B" alt="image of a planet called Pegasi B"></p>
        <p class="lead">Copernican Revolution caused an uproar</p>
        <p class="subheader">Find Earth-like planets life outside the Solar System</p>
      </div>
    </div>
    <div class="column">
      <div class="callout">
        <p>JAVA</p>
        <p><img src="https://placehold.it/400x370&text=Pegasi B" alt="image of a planet called Pegasi B"></p>
        <p class="lead">Copernican Revolution caused an uproar</p>
        <p class="subheader">Find Earth-like planets life outside the Solar System</p>
      </div>
    </div>
    <div class="column">
      <div class="callout">
        <p>C/C++/C#</p>
        <p><img src="https://placehold.it/400x370&text=Pegasi B" alt="image of a planet called Pegasi B"></p>
        <p class="lead">Copernican Revolution caused an uproar</p>
        <p class="subheader">Find Earth-like planets life outside the Solar System</p>
      </div>
    </div>
    <div class="column">
      <div class="callout">
        <p>JAVA</p>
        <p><img src="https://placehold.it/400x370&text=Pegasi B" alt="image of a planet called Pegasi B"></p>
        <p class="lead">Copernican Revolution caused an uproar</p>
        <p class="subheader">Find Earth-like planets life outside the Solar System</p>
      </div>
    </div>
    <div class="column">
      <div class="callout">
        <p>HTML</p>
        <p><img src="https://placehold.it/400x370&text=Pegasi B" alt="image of a planet called Pegasi B"></p>
        <p class="lead">Copernican Revolution caused an uproar</p>
        <p class="subheader">Find Earth-like planets life outside the Solar System</p>
      </div>
    </div>
    <div class="column">
      <div class="callout">
        <p>JAVA</p>
        <p><img src="https://placehold.it/400x370&text=Pegasi B" alt="image of a planet called Pegasi B"></p>
        <p class="lead">Copernican Revolution caused an uproar</p>
        <p class="subheader">Find Earth-like planets life outside the Solar System</p>
      </div>
    </div>
  </div>

  <!-- load 버튼 -->
  <div class="row column">
    <a class="button hollow expanded">Load More</a>
  </div>

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