<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
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

	BoardDAO boardDAO = new BoardDAO();
System.out.println((String)session.getAttribute("userID")+(String)request.getParameter("boardID"));
	if(boardDAO.isSold((String)session.getAttribute("userID"),(String)request.getParameter("boardID")) == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글 수정에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('판매완료로 변경되었습니다.')");
		script.println("location.href='../SalesList/salesList.jsp'");
		script.println("</script>");
	}



%>

</body>
</html>