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
    <title>깐북</title> 
    <link rel="stylesheet" href="findID.css?v=3" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
</head>
<body>
<%
	String nickName = request.getParameter("nickName");
	String userLocation = request.getParameter("userLocation");
	String userUniv = request.getParameter("userUniv");
	
	String redirectUrl = "findID.jsp";
	
	user us = new UserDAO().findUserID(nickName, userUniv, userLocation);
	 
	if(us == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디를 찾을 수 없습니다. 입력한 정보를 확인해주세요')");
		script.println("location.href='../Login/login.html'");
		script.println("</script>");
	}
	else{
%>
	<div class="resultContainer">
		<h1><%= us.getNickname() %>님의 아이디는 <b>"<%= us.getuserID() %>" </b>입니다.</h1>
		<a href="../Login/login.html">다시 로그인</a>
	</div>
<%} %>	
</body>
</html>