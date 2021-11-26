<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<!DOCTYPE html>
<html>

<head>
    <title>salesList</title>
    <link rel="stylesheet" href="Header.css?v=1.1" type="text/css">
    <link rel="stylesheet" href="salesList.css?v=1.1" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
</head>

<body>
    <!-- 헤더부분 -->
    <form method="post" action='../searchResult/searchResult.jsp'>
  	<div id="header"> 
		<input type="image" src="../images/logo.png" id="logo">  
		<input type="text" id="searchTerm" placeholder="책이름을 입력해봐요" name="search">
		<button type="submit" id="searchButton" onclick="javascript: form.action='../searchResult/searchResult.jsp'"> <i class="fa fa-search"></i> </button>
		<div id="profile">
	        <input type="image" src="../images/profile.png" id="profileImage" onclick="javascript: form.action='../Mypage/Mypage.jsp'">
	        <p id="userName"><%= (String)session.getAttribute("userNickname") %></p>
        </div> 		
    </div>
    <%
	    int pageNumber = 1;
	 	String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
	    
	    BoardDAO boardDAO = new BoardDAO();
	    ArrayList<Board> list = boardDAO.getMyList(pageNumber, userID);	
	    
	    for(int i = 0; i < list.size(); i++){
    %>         
    <!-- 뷰 부분 -->
    <div class="mainContainer">    
    	<div class="resultContainer">
        	<a href="../DetailView/detail.jsp?boardID=<%=list.get(i).getBoardID() %>">
            <img src="<%= list.get(i).getBoardImage() %>" id="image">
            <div class="txtAreaWrap">
            	<h2><%=list.get(i).getBoardTitle() %></h2>
            	<%if(list.get(i).getBoardAvailable() == 1){ %>
            	<input id="isSold" value="판매중">
            	<%} else{ %>
            	<input id="isSold" value="판매완료">
            	<%} %>                  
            </div>
            <div class="txtArea">
            	<h4><%= list.get(i).getBoardPrice() %></h4>
            	<h5><%= list.get(i).getBoardContent() %></h5>
            	<%} %>
            </div> 
            </a>
        </div>
    </div>
    </form>
</body>
</html>