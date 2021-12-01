<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>

<jsp:useBean id="board" class="board.Board" scope="page"/>
<jsp:setProperty name="board" property="boardImage" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
		PrintWriter script = response.getWriter();
  	 	 String uploadDir =this.getClass().getResource("/").getPath();
		 if(uploadDir.indexOf(".metadata") == -1){
			 File file = new File(".");
			 String rootPath = file.getAbsolutePath();
			 uploadDir = rootPath.substring(0,rootPath.indexOf("bin"))+"webapps/gganBook/uploadImage";
			 uploadDir = "/"+uploadDir;
			 }
		 else{
			 System.out.println("절대경로 : " + uploadDir); 		
			 uploadDir = uploadDir.substring(1,uploadDir.indexOf(".metadata"))+"gganBook/WebContent/uploadImage";
			 System.out.println("절대경로 : " + uploadDir); 		
		 }
		 
		 
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";		
		MultipartRequest multipartRequest = new MultipartRequest(request, uploadDir, maxSize, encoding, new DefaultFileRenamePolicy());
		String fileName = multipartRequest.getOriginalFileName("file");
		session.setAttribute("imageURL", uploadDir + "/" + fileName);
		script.println("<script>");
		script.println("alert('이미지가 업로드 되었습니다.')");
		script.println("history.back()");
		script.println("</script>");

	%>
</body>
</html>