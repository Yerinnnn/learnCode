<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>    <!--�ǳʿ��� ��� �����͸� utf-8���� ���ڵ� -->
<!-- scope="page": ���� ������������ �ڹ� ���� ��� -->
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
<!-- userDAO Ŭ������ �̿��� �α��� �۾� ó�� -->
<!-- UserDAO�� username�� password�� ����� �Ѿ�ͼ� login �õ� -->
<!-- DAO���� ������ return -1 ���� 0������ ó������� result�� ���� �� -->
   <%  
   		if (user.getUsername == null || user.getPassword == null || user.getEmail == null) {
   			PrintWriter script = response.getWriter();
        	script.println("<script>");
        	script.println("alert('�Էµ��� ���� ������ �ֽ��ϴ�.')");
        	script.println("location.href = 'main.jsp'");
        	script.println("</script>");
   		} else {
   			UserDAO userDAO = new UserDAO();
   	        int result = userDAO.register(user);
   	        if (result == -1) {
   	        	session.setAttribute("userID", user.getUsername());
   	        	PrintWriter script = response.getWriter();
   	        	script.println("<script>");
   	        	script.println("�̹� �����ϴ� ���̵��Դϴ�.");
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