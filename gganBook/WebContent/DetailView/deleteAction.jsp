<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		System.out.println(session.getAttribute("userID"));
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href='/login/login.jsp'");
			script.println("</script>");
		} else{
				
			
			
				BoardDAO boardDAO = new BoardDAO();
				int result = boardDAO.delete(String.valueOf(session.getAttribute("boardID")));
				
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글을 삭제하지 못했습니다.')");
					script.println("location.href='../Main/main.jsp'");
					script.println("</script>");
				}else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 삭제 성공!')");
					script.println("location.href='../Main/main.jsp'");
					script.println("</script>");
				}
			}



%>

</body>
</html>