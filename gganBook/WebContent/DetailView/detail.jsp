<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <title>상세보기</title>
        <link rel="stylesheet" href="Header.css"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="DetailView.css" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
    
    <!-- 로그인 됬을때 -->
    <%
    	String userID = null;
    if(session.getAttribute("userID") != null){
    		userID = (String) session.getAttribute("userID");
    }
    int boardID = 1;
    if (request.getParameter("boardID") != null){
    		boardID = Integer.parseInt(request.getParameter("boardID"));    				
    }
    if(boardID == 0){
    	PrintWriter script = response.getWriter();
    	script.println("<script>");
    	script.println("alert('유효하지 않은 글입니다.')");
    	script.println("location.href='main.jsp'");
    	script.println("</script>");
    }
    
    Board bbs = new BoardDAO().getBoard(boardID);
    
    %>
    
        <!-- 헤더부분 -->
        <form method="post">
            <div id="header"> 
                <input type="image" src="../images/logo.png">  
                <input type="text", class = "searchTerm", placeholder="책이름을 입력해봐요" name="search">
                <button type="submit" class="searchButton" onclick="javascript: form.action='../searchResult/searchResult.jsp'"> <i class="fa fa-search"></i> </button>
                <input type="image" src="../images/profile.png" class = "profile">
                <p class="userName"><%=(String)session.getAttribute("userNickname") %></p>
            </div>
        <!-- 뷰 부분 -->
        <div>
            <!-- 이미지 뷰 부분 -->
            <div class="left">
                <input type="image", src="../images/profile.png" class="sellerProfile">
                <p class="sellerName"><%=bbs.getUserID() %></p>
                    <input type="image", src="<%=bbs.getBoardImage() %>" class="productImage">   
            </div>
            <div class="right">
                <p class="productName"><%=bbs.getBoardTitle() %></p><br>
                <p class="price"><%=bbs.getBoardPrice() %></p>
                <%if (bbs.getBoardAvailable() == 1) { %>
                <input type="image" src="../images/sell_icon.PNG" class="cellTag">
                <%} else{%>
                <input type="image" src="../images/sell_icon.PNG" class="cellTag">
                <%} %>
                <p class="productExplain"><%=bbs.getBoardContent() %></p>
                <p>전화번호 : <%=bbs.getBoardPhoneNumber() %></p>
                <% if(bbs.getUserID().equals(session.getAttribute("userID"))){ %>
                <button onclick="javascript: form.action='../EditView/EditView.jsp?boardID=<%=bbs.getBoardID() %> '">게시글 수정하기</button>
                <% session.setAttribute("boardID", bbs.getBoardID()); %>
                <button type="button" onclick="delFunc()">게시글 삭제하기</button>
                <script>
                function delFunc(){
   					 if (!confirm("정말 삭제하시겠습니까?")) {
   					 } else {
   						location.href= "deleteAction.jsp";
   					 }
                }
				</script>
                
                <% System.out.println("글쓴 사람입니다.");} %>
                </div>
            </div>
            </form>

            
        </div>
    </body>
</html>