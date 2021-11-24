<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.user" %>
<%@ page import="user.UserDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<title>findID_result2</title>
</head>
<body>
<%
			String nickName = request.getParameter("nickName");
			String userLocation = request.getParameter("userLocation");
			String userUniv = request.getParameter("userUniv");
			
			String redirectUrl = "findID.jsp";
			
			 user us = new UserDAO().findUserID(nickName, userUniv, userLocation);
			 
			 if(us == null){
				 PrintWriter  script = response.getWriter();
					script.println("<script>");
					script.println("alert('아이디를 찾을 수 없습니다. 입력한 정보를 확인해주세요')");
					script.println("location.href='../Login/login.jsp'");
					script.println("</script>");
			 }
			 else{

%>
	<h1><%= us.getNickname() %>님의 id는 <%= us.getuserID() %><small>입니다.</small></h1>
	<a href="findID_result3.jsp">다시 로그인</a>
	<%} %>	
</body>
</html>