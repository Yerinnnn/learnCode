<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.free_BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>learn Code</title>
</head>
<body>
	<!-- userDAO 클래스를 이용해 로그인 작업 처리 -->
	<!-- UserDAO의 username과 password가 여기로 넘어와서 login 시도 -->
	<!-- DAO에서 구현한 return -1 부터 0까지의 처리결과가 result에 담기는 것 -->
	<%
		String username = null;
		if (session.getAttribute("username") != null) {
			username = (String) session.getAttribute("username");
		}
		if (username == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 후 이용하실 수 있습니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
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
		if (!username.equals(bbs.getUsername())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'bbs.jsp");
			script.println("</script>");
		} else {
			if ((request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null) 
					&& (request.getParameter("bbsTitle").equals("") || request.getParameter("bbsContent").equals(""))) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력되지 않은 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else if (request.getParameter("bbsTitle") == null || request.getParameter("bbsTitle").equals("")) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('제목을 입력해주세요.')");
				script.println("history.back()");
				script.println("</script>");
			} else if (request.getParameter("bbsContent") == null || request.getParameter("bbsContent").equals("")) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글을 입력해주세요.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				free_BbsDAO bbsDAO = new free_BbsDAO();
				int result = bbsDAO.update(bbsID, request.getParameter("bbsTitle"), request.getParameter("bbsContent"));

				if (result == -1) { //database username에 primary key 처리를 해놓았기 때문에 만약 값이 있다면 -1이 아닌 0~양수 값이 나옴
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 수정에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'bbs.jsp'");
					script.println("</script>");
				}
			}

		}
	%>
</body>
</html>