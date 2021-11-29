<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="user.user" %>
<%@ page import="user.UserDAO" %>

<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>깐북</title>
        <link rel="stylesheet" href="../Header/Header.css?v=1.1"> 
        <link rel="stylesheet" href="main.css?v=1.1"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">        
    </head>
    <body>
    
    <%
			int id,ref;
			int rownum = 0;
			
			String[] urlArray = new String[5];
			
			int pageNumber = 1;
			if(request.getParameter("pageNumber") != null){
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			}

	   		 user us = new UserDAO().reccomendData((String)session.getAttribute("userID"));
	   		 session.setAttribute("userNickname", us.getNickname());
			session.setAttribute("userUniv", us.getuserUniv());

					
				
	%>

          <!-- 헤더부분 -->
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
        
     
   <div id="main">
         <div class="recommend-header-wrap1">
             <h1>[<%= (String)session.getAttribute("userNickname") %>님이 관심을 가질 것 같아요]</h1>
             <button type="submit" class="sellButton" onclick="javascript: form.action='../WriteView/WriteView.jsp'">판매하러가기</button>
   </div>
<%



%>
                <%
                
                BoardDAO boardDAO = new BoardDAO();
        		ArrayList<Board> list = boardDAO.getList(pageNumber);
        		ArrayList<Board> imageList = boardDAO.getRecommendImage((String)session.getAttribute("userUniv"));
                
                %>
            <!--슬라이더 부분-->
            <div class="slidebox">
                <input type="radio" name="slide" id="slide01" checked>
                <input type="radio" name="slide" id="slide02">
                <input type="radio" name="slide" id="slide03">
                <input type="radio" name="slide" id="slide04">
                <ul class="slidelist">
                    <li class="slideitem">
                    <%if (imageList.get(0).getBoardImage() != null){ %>
                        <a href="../DetailView/detail.jsp?boardID=<%=imageList.get(0).getBoardID()%>">
                        <img src="<%= imageList.get(0).getBoardImage()%>"></a>
                    <%} else{ %>
                        <img src="../images/NoImage.png">
                    <%} %>
                    </li>
                    <li class="slideitem">
                        <%if (imageList.get(1).getBoardImage() != null){ %>
                        <a href="../DetailView/detail.jsp?boardID=<%=imageList.get(1).getBoardID()%>">
                        <img src="<%= imageList.get(1).getBoardImage()%>"></a>
                    <%} else{ %>
                        <img src="../images/NoImage.png">
                    <%} %>
                    </li>
					<li class="slideitem">
                    <%if (imageList.get(2).getBoardImage() != null){ %>
                        <a href="../DetailView/detail.jsp?boardID=<%=imageList.get(2).getBoardID()%>">
                        <img src="<%= imageList.get(2).getBoardImage()%>"></a>
                    <%} else{ %>
                        <img src="../images/NoImage.png">
                    <%} %>
                    </li>
                    <li class="slideitem">
                       <%if (imageList.get(3).getBoardImage() != null){ %>
                        <a href="../DetailView/detail.jsp?boardID=<%=imageList.get(3).getBoardID()%>">
                        <img src="<%= imageList.get(3).getBoardImage()%>"></a>
                    <%} else{ %>
                        <img src="../images/NoImage.png">
                    <%} %>
                    </li>
                    
                </ul>
                
                <div class="slide-control">
                    <div class="control01">
                        <label for="slide04" class="prev"></label>
                        <label for="slide02" class="next"></label>
                    </div>
                    <div class="control02">
                        <label for="slide01" class="prev"></label>
                        <label for="slide03" class="next"></label>
                    </div>
                    <div class="control03">
                        <label for="slide02" class="prev"></label>
                        <label for="slide04" class="next"></label>
                    </div>
                    <div class="control04">
                        <label for="slide03" class="prev"></label>
                        <label for="slide01" class="next"></label>
                    </div>
                </div>
            </div>
            <p><p><p>
            <!--그냥 추천-->
            <div class="main-container">
                <div class="recommmend-wrap">
                    <div class="recommend-header-wrap2">
                        <h1>[이런 책도 있어요]</h1>
                    </div>
                    
                    <%	
                        		for (int i = 0; i < list.size(); i++){

                    %>
                    
                    <div class="container<%= i%5%>">
                    <a href="../DetailView/detail.jsp?boardID=<%=list.get(i).getBoardID() %>">
                        <div class="recommend-body-wrap1">
                        	<div class="profile-wrap">
	                            <img src="../images/profile_icon.PNG" id="profile_icon1">
	                            <div id="profileName1"><%=(String)list.get(i).getNickName() %></div>
                            </div>
	                            <div class="image-wrap">
	                            	<div class="image-div">
	                            	<div class="content-image">
			                            <img src="<%= list.get(i).getBoardImage() %>" id="booksample1"><p>
			                            <%System.out.println(list.get(i).getNickName()); %>
		                            </div>
	                            </div>
                            </div>
                            <div class="content-wrap">
	                            <h2 id="title1"><%= list.get(i).getBoardTitle() %></h2>
	        <!--여기서 1이 들어오면 판매중, 1이 아니라면 판매완료임 else가 안들어가서 일단 둘다  if문 처리해둠 ㅋㅋ-->
	                            <%if(list.get(i).getBoardAvailable() == 1){ %>
									<input id="isSale" value="판매중" disabled>
									<%} else{ %>
									<input id="isSold" value="판매완료" disabled>
									<%} %>    
	                            <div id="price1"><%= list.get(i).getBoardPrice() %></div>
	                            <div id="mainText1"><%= list.get(i).getBoardContent() %></div>
                            </div>
                        </div><p><p>
                        </a>
                    </div>
                    <%
                        		}
                    %>
  
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>