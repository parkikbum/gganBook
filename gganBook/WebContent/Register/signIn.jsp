<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="user" class="user.user" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="nickName"/>
<jsp:setProperty name="user" property="userUniv"/>
<jsp:setProperty name="user" property="userLocation"/>

<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
    <%
    
    System.out.println(user.getuserID() +  user.getuserPassword() + user.getNickname() + user.getuserUniv() +  user.getuserLocation());
		if(user.getuserID() == null || user.getuserPassword() == null || user.getNickname() == null || user.getuserUniv() == null || user.getuserLocation() == null){		
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('모두 입력이 되었는지 확인해 주세요')");
			script.println("history.back()");
			script.println("</script>");
		} else{
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('아이디가 이미 존재합니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('로그인 성공')");
				script.println("location.href='../Login/login.html'");
				script.println("</script>");
			}
			
		}
    
    
    %>

    </body>
</html>