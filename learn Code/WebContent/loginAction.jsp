<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>    <!--건너오는 모든 데이터를 utf-8으로 인코딩 -->
<!-- scope="page": 현재 페이지에서만 자바 빈즈 사용 -->
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty property="username" name="user"/>
<jsp:setProperty property="password" name="user"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>learn Code</title>
</head>
<body>
<!-- userDAO 클래스를 이용해 로그인 작업 처리 -->
<!-- UserDAO의 username과 password가 여기로 넘어와서 login 시도 -->
<!-- DAO에서 구현한 return -1 부터 0까지의 처리결과가 result에 담기는 것 -->
   <%
        String userID = null;
        if(session.getAttribute("userID") != null) {
        	userID = (String)session.getAttribute("userID");
        }
        if (userID != null) {
        	PrintWriter script = response.getWriter();
        	script.println("<script>");
        	script.println("alert('이미 로그인이 되어있습니다.')");
        	script.println("location.href = 'main.jsp'");
        	script.println("</script>");
        }
        UserDAO userDAO = new UserDAO();
        int result = userDAO.login(user.getUsername(),user.getPassword());
        if (result == 1) {
        	session.setAttribute("userID", user.getUsername());
        	PrintWriter script = response.getWriter();
        	script.println("<script>");
        	script.println("location.href = 'main.jsp'");
        	script.println("</script>");
        }
        else if (result == 0) {
        	PrintWriter script = response.getWriter();
        	script.println("<script>");
        	script.println("alert('비밀번호가 틀립니다.')");
        	script.println("history.back()");
        	script.println("</script>");
        }
        else if (result == -1) {
        	PrintWriter script = response.getWriter();
        	script.println("<script>");
        	script.println("alert('존재하지 않는 아이디입니다.')");
        	script.println("history.back()");
        	script.println("</script>");
        	
        } else if (result == -2) {
        	PrintWriter script = response.getWriter();
        	script.println("<script>");
        	script.println("alert('데이터베이스 오류가 발생했습니다.')");
        	script.println("history.back()");
        	script.println("</script>");
        }
   %>
</body>
</html>