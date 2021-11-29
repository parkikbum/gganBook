<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="user.user" %>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <title>깐북</title>
        <link rel="stylesheet" href="../Header/Header.css?v=1.1" type="text/css"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="Mypage.css?v1.1" type="text/css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
    
    <%
    	String userID = null;
   		if(session.getAttribute("userID") != null){
    		userID = (String)session.getAttribute("userID");
  		  }
   
    
   		 int result = new BoardDAO().getMypage(userID);
   		 user us = new UserDAO().userInfo(userID);
   		 
    
    %>
    <form method="post" action='../searchResult/searchResult.jsp'>
        <div id="header"> 
			<input type="image" src="../images/logo.png" id="logo" onclick="javascript: form.action='../Main/main.jsp'">  
			<input type="text" id="searchTerm" placeholder="책이름을 입력해봐요" name="search">
			<button type="submit" id="searchButton" onclick="javascript: form.action='../searchResult/searchResult.jsp'"> <i class="fa fa-search"></i> </button>
			<div id="profile">
		        <input type="image" src="../images/profile.png" id="profileImage" onclick="javascript: form.action='../Mypage/Mypage.jsp'">
		        <p id="userName"><%= (String)session.getAttribute("userNickname") %></p>
	        </div> 		
    	</div> 
   </form>
   <div class="box">
	        <div class="background">
	            <div class="line disable">
	                <input type="image" src="../images/profile.png" class="profileImage">
	            </div>
	            <div class="content">
		            <p class="myUserName">닉네임 : <%=session.getAttribute("userNickname") %></p>
		            <p class="profileMent">주 거래 지역 : <%= (String)us.getuserLocation() %></p>
		            <%if(result == -1) {%>
		            <p class="count">아직 거래를 하지 않으셧어요</p>
		            <%}else {%>
		            <p class="count"><%= result %>회 만큼 거래하셨어요!</p>
		            <%} %>
	            </div>
	        </div> 
	        <div class="buttonLocation">
	      	  <button class="showButton" onclick="location.href='../SalesList/salesList.jsp'">판매 게시글 보기</button>
	      	  <button onclick="location.href='logoutAction.jsp'" id="logOutButton">로그아웃</button>
      	  </div>
   </div>
   </body>

</html>