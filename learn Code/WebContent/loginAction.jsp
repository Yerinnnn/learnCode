<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>    <!--�ǳʿ��� ��� �����͸� utf-8���� ���ڵ� -->
<!-- scope="page": ���� ������������ �ڹ� ���� ��� -->
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
<!-- userDAO Ŭ������ �̿��� �α��� �۾� ó�� -->
<!-- UserDAO�� username�� password�� ����� �Ѿ�ͼ� login �õ� -->
<!-- DAO���� ������ return -1 ���� 0������ ó������� result�� ���� �� -->
   <%
        String userID = null;
        if(session.getAttribute("userID") != null) {
        	userID = (String)session.getAttribute("userID");
        }
        if (userID != null) {
        	PrintWriter script = response.getWriter();
        	script.println("<script>");
        	script.println("alert('�̹� �α����� �Ǿ��ֽ��ϴ�.')");
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
        	script.println("alert('��й�ȣ�� Ʋ���ϴ�.')");
        	script.println("history.back()");
        	script.println("</script>");
        }
        else if (result == -1) {
        	PrintWriter script = response.getWriter();
        	script.println("<script>");
        	script.println("alert('�������� �ʴ� ���̵��Դϴ�.')");
        	script.println("history.back()");
        	script.println("</script>");
        	
        } else if (result == -2) {
        	PrintWriter script = response.getWriter();
        	script.println("<script>");
        	script.println("alert('�����ͺ��̽� ������ �߻��߽��ϴ�.')");
        	script.println("history.back()");
        	script.println("</script>");
        }
   %>
</body>
</html>