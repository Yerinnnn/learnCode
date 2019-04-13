<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>    <!--건너오는 모든 데이터를 utf-8으로 인코딩 -->
<!-- scope="page": 현재 페이지에서만 자바 빈즈 사용 -->
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty property="username" name="user"/>
<jsp:setProperty property="password" name="user"/>
<jsp:setProperty property="email" name="user"/>
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
   		if (user.getUsername == null || user.getPassword == null || user.getEmail == null) {
   			PrintWriter script = response.getWriter();
        	script.println("<script>");
        	script.println("alert('입력되지 않은 사항이 있습니다.')");
        	script.println("location.href = 'main.jsp'");
        	script.println("</script>");
   		} else {
   			UserDAO userDAO = new UserDAO();
   	        int result = userDAO.register(user);
   	        if (result == -1) {
   	        	session.setAttribute("userID", user.getUsername());
   	        	PrintWriter script = response.getWriter();
   	        	script.println("<script>");
   	        	script.println("이미 존재하는 아이디입니다.");
   	        	script.println("</script>");
   	        }
   	        else {
   	        	PrintWriter script = response.getWriter();
   	        	script.println("<script>");
   	        	script.println("location.href = 'main.jsp'");
   	        	script.println("</script>");
   	        }
   		}
   %>
</body>
</html>