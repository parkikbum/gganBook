<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 파일업로드 위한 라이브러리 임포트 -->
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.io.File" %>
<!-- 파일 이름이 동일한게 나오면 자동으로 다른걸로 바꿔주고 그런 행동 해주는것 -->
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<!-- 실제로 파일 업로드 하기 위한 클래스 -->
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
		 // 해당 폴더에 이미지를 저장시킨다
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
		 
		 
		// 총 100M 까지 저장 가능하게 함
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";		
		// 사용자가 전송한 파일정보 토대로 업로드 장소에 파일 업로드 수행할 수 있게 함
		MultipartRequest multipartRequest = new MultipartRequest(request, uploadDir, maxSize, encoding, new DefaultFileRenamePolicy());
                // 중복된 파일이름이 있기에 fileRealName이 실제로 서버에 저장된 경로이자 파일
                // fineName은 사용자가 올린 파일의 이름이다
		// 이전 클래스 name = "file" 실제 사용자가 저장한 실제 네임
		String fileName = multipartRequest.getOriginalFileName("file");
		// 실제 서버에 업로드 된 파일시스템 네임
		String fileRealName = multipartRequest.getFilesystemName("file");
		// 디비에 업로드 메소드
		session.setAttribute("imageURL", "../uploadImage/" + fileRealName);
		System.out.println("파일명 : " + fileName);

		System.out.println("imageURL"+ "../uploadImage/" + fileName);
		System.out.println(board.getBoardImage());
		script.println("<script>");
		script.println("alert('이미지가 업로드 되었습니다.')");
		script.println("history.back()");
		script.println("</script>");

	%>
</body>
</html>