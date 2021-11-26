<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>

<head>
    <title>searchResult</title>
    <link rel="stylesheet" href="Header.css?v=1.1" type="text/css">
    <link rel="stylesheet" href="searchResult.css?v=1.1" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
</head>

<body>    
    <form method="post" action='../searchResult/searchResult.jsp'>
    <!-- 헤더부분 -->
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
	String userID = null;
	int pageNumber = 1;
	if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
	}
	System.out.println(request.getParameter("search"));
	String searchString = null;
	if (request.getParameter("search") != null){
		searchString = request.getParameter("search");		
	}
	if(searchString == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}	
	BoardDAO boardDAO = new BoardDAO();
	ArrayList<Board> list = boardDAO.getSearchList(pageNumber, searchString);		
	
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