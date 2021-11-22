<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="board.*" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="board" class="board.Board" scope="page"/>
<jsp:setProperty name="board" property="boardTitle" />
<jsp:setProperty name="board" property="boardContent" />
<jsp:setProperty name="board" property="boardUniv"/>
<jsp:setProperty name="board" property="boardLocation"/>
<jsp:setProperty name="board" property="boardPrice"/>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
			if (board.getBoardTitle() == null || board.getBoardContent() == null){
				System.out.println(board.getBoardImage() + board.getBoardContent());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else{
				BoardDAO boardDAO = new BoardDAO();
				int result = boardDAO.write(board.getBoardTitle(), userID, board.getBoardContent(), board.getBoardUniv(), board.getBoardLocation(), (String)session.getAttribute("imageURL"), board.getBoardPrice());
				
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else{
					PrintWriter script = response.getWriter();
					System.out.println(board.getBoardImage() + board.getBoardContent());
					script.println("<script>");
					script.println("alert('글쓰기 성공!')");
					script.println("location.href='../Main/main.jsp'");
					script.println("</script>");
				}
			}
		}



%>
</body>
</html>