<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.user" scope="page"/>
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userUniv" />
<jsp:setProperty name="user" property="nickName" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <body>
 <%
 String userID = null;
 if(session.getAttribute("userID") != null){
	 userID = (String) session.getAttribute("userID");
 }
 if(userID != null){
	 PrintWriter  script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("location.href='../Main/main.jsp'");
		script.println("</script>");

 }

 		UserDAO userDAO = new UserDAO(); 
 		int result = userDAO.login(user.getuserID(), user.getuserPassword());
 		if(result == 1){
 			session.setAttribute("userID", user.getuserID());
 			session.setAttribute("userUniv", user.getuserUniv());
 			session.setAttribute("userNickname", user.getNickname());
 			PrintWriter  script = response.getWriter();
 			script.println("<script>");
 			script.println("location.href='../Main/main.jsp'");
 			script.println("</script>");
 		}
 		else if(result == 0){
 			PrintWriter  script = response.getWriter();
 			script.println("<script>");
 			script.println("alert('비밀번호가 틀립니다.')");
 			script.println("history.back()");
 			script.println("</script>");
 		}
 		else if(result == -1){
 			PrintWriter  script = response.getWriter();
 			script.println("<script>");
 			script.println("alert('아이디가 존재하지 않습니다.')");
 			script.println("history.back()");
 			script.println("</script>");
 		}
 		else if(result == -2){
 			PrintWriter  script = response.getWriter();
 			script.println("<script>");
 			script.println("alert('데이터 베이스에 오류가 발생하였습니다.')");
 			script.println("history.back()");
 			script.println("</script>");
 		}
 		
 		%>
      
    </body>
</html>