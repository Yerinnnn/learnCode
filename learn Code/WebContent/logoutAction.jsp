<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>learn Code</title>
</head>
<body>
   <%  
   		session.invalidate();	//현재 이 페이지에 접속한 회원이 세션을 빼앗기도록 만들어서 로그아웃 시켜줌
   %>
   <script>
   		location.href = 'main.jsp';	
   </script>
</body>
</html>