<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<!DOCTYPE html>
<html>

<head>
    <title>salesList</title>
    <link rel="stylesheet" href="Header.css" type="text/css">
    <link rel="stylesheet" href="salesList.css" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
        type="text/css">
</head>

<body>
    <!-- 헤더부분 -->
    <div id="header">
        <input type="image" src="../images/logo.png">
        <input type="text" class="searchTerm" placeholder="책이름을 입력해봐요">
        <button type="submit" class="searchButton"> <i class="fa fa-search"></i> </button>
        <input type="image" src="../images/profile.png" class="profile">
        <p class="userName"><%=session.getAttribute("userNickname") %></p>
    </div>
        
        
        
     <%
     int pageNumber = 1;
 	 String userID = null;
	 if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
     
     BoardDAO boardDAO = new BoardDAO();
     ArrayList<Board> list = boardDAO.getMyList(pageNumber, userID);
 
     
     for(int i = 0; i < 3; i++){
     %>
         
    <!-- 뷰 부분 -->
    <br>
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

</body>

</html>