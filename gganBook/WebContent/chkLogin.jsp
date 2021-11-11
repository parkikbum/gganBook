<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		String id = "1", pwd="1";
		String user_id = request.getParameter("inputId");
		String user_pwd = request.getParameter("inputPassword");
		
		if(id.equals(user_id) && pwd.equals(user_pwd)){
			response.sendRedirect("main.html");
		}
		else{
			out.println("<script>alert('회원정보가 올바르지 않습니다');</script>");
			if(!id.equals(user_id)){
				out.println("<script>alert('아이디를 확인해 주세요');</script>");
			}
			else if(!pwd.equals(user_pwd)){
				out.println("<script>alert('비밀번호를 확인해 주세요');</script>");
			}
			out.println("<script>location.href = 'login.html';</script>");
		}
		
	%>
</body>
</html>