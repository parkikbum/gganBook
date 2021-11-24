<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>

<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>메인</title>
        <link rel="stylesheet" href="../FindID/Header.css"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="main.css"> 
    </head>
    <body>
    
    <%
			int id,ref;
			int rownum = 0;
			Connection conn = null;
			Statement stmt = null;
			String sql = null;
			ResultSet rs = null;
			
			String[] urlArray = new String[5];
			
			int pageNumber = 1;
			if(request.getParameter("pageNumber") != null){
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			}
			
			
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				String url = "jdbc:mysql://database-1-user.coimq8nymisd.us-east-2.rds.amazonaws.com/gganbook";
				conn = DriverManager.getConnection(url, "admin", "12345678");
				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				sql = " select nickName from user where userID = '" + session.getAttribute("userID") +"'";
				rs = stmt.executeQuery(sql);
			} catch(Exception e){
				out.println("DB 연동 오류 입니다. : " + e.getMessage());
			}
				rs.last();
				rownum = rs.getRow();
				rs.beforeFirst();
				
				while(rs.next())
				{
					session.setAttribute("userNickname", rs.getString("nickName"));
				}
			
				try{
					sql = " select userUniv from user where userID = '" + session.getAttribute("userID") +"'";
					rs = stmt.executeQuery(sql);
				}catch(Exception e){
					out.println("DB 연동 오류입니다. : " + e.getMessage());
				}
				rs.last();
				rownum = rs.getRow();
				rs.beforeFirst();
				while(rs.next()){
					session.setAttribute("userUniv", rs.getString("userUniv"));
				}
					
				
	%>

        <!--헤더 부분-->
                <form method ="post" action='../searchResult/searchResult.jsp'>
       		 <header>
            <div id="header"> 
                <input type="image" src="../images/logo.png">  
                <input type="text" class = "searchTerm" placeholder="책이름을 입력해봐요" name="search">
                <button type="submit" class="searchButton" onclick="javascript: form.action='../searchResult/searchResult.jsp'"> <i class="fa fa-search"></i> </button>
                <input type="image" src="../images/profile.png" class = "profile" onclick="javascript: form.action='../Mypage/Mypage.jsp'">
                <p class="userName"><%= (String)session.getAttribute("userNickname") %></p>
            </div>   
            </form>
            
        </header>  

        <div id="main">
            <div class="recommend-header-wrap1">
                <h1>[<%= (String)session.getAttribute("userNickname") %>님이 관심을 가질 것 같아요]</h1>
                <a href ='../WriteView/WriteView.html'>판매하러가기</a>
            </div>
<%

		try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				String url = "jdbc:mysql://database-1-user.coimq8nymisd.us-east-2.rds.amazonaws.com/gganbook";
				conn = DriverManager.getConnection(url, "admin", "12345678");
				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				sql = "select boardImage from board where boardUniv = '" + session.getAttribute("userUniv") +"'";
				rs = stmt.executeQuery(sql);
			} catch(Exception e){
				out.println("DB 연동 오류 입니다. : " + e.getMessage());
			}
				rs.last();
				rownum = rs.getRow();
				rs.beforeFirst();
				
				for(int i = 0; i < 4; i ++ ){
					if(rs.next())
					{
						urlArray[i] = rs.getString("boardImage");
					}
				}
				
	
%>


                <%
                
                BoardDAO boardDAO = new BoardDAO();
        		ArrayList<Board> list = boardDAO.getList(pageNumber);
                
                %>
            <!--슬라이더 부분-->
            <div class="slidebox">
                <input type="radio" name="slide" id="slide01" checked>
                <input type="radio" name="slide" id="slide02">
                <input type="radio" name="slide" id="slide03">
                <input type="radio" name="slide" id="slide04">
                <ul class="slidelist">
                    <li class="slideitem">
                        <a href="../DetailView/detail.jsp?boardID=<%=list.get(3).getBoardID()%>"><img src="<%= urlArray[0]%>"></a>
                    </li>
                    <li class="slideitem">
                        <a href="../DetailView/detail.jsp?boardID=<%=list.get(2).getBoardID() %>"><img src="<%= urlArray[1]%>"></a>
                    </li>
                    <li class="slideitem">
                        <a href="../DetailView/detail.jsp?boardID=<%=list.get(1).getBoardID() %>"><img src="<%= urlArray[2]%>"></a>
                    </li>
                    <li class="slideitem">
                        <a href="../DetailView/detail.jsp?boardID=<%=list.get(0).getBoardID() %>"><img src="<%= urlArray[3]%>"></a>
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
                        <select class="sort">
                            <option>최신순</option>
                            <option>인기순</option>
                        </select>
                    </div>
                    
                    <%	
                        		for (int i = 0; i < list.size(); i++){

                    %>
                    
                    <div class="container<%= i+1%>">
                    <a href="../DetailView/detail.jsp?boardID=<%=list.get(i).getBoardID() %>">
                        <div class="recommend-body-wrap1">
                            <img src="../images/profile_icon.PNG" id="profile_icon1">
                            <div id="profileName1"><%= list.get(i).getUserID() %></div>
                            <img src="<%= list.get(i).getBoardImage() %>" id="booksample1"><p>
                            <h2 id="title1"><%= list.get(i).getBoardTitle() %></h2>
        <!--여기서 1이 들어오면 판매중, 1이 아니라면 판매완료임 else가 안들어가서 일단 둘다  if문 처리해둠 ㅋㅋ-->
                            <% if(list.get(i).getBoardAvailable() == 1) {%>  
                            <img src="../images/sell_icon.PNG" id="sell_icon1"><%} %>
                            <% if(list.get(i).getBoardAvailable() == 0){ %>
                            <img src="../images/logo.png" id="sell_icon1"><%} %>
                            
                            <div id="price1"><%= list.get(i).getBoardPrice() %></div>
                            <div id="mainText1"><%= list.get(i).getBoardContent() %></div>
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