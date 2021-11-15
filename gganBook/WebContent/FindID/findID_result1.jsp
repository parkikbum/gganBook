<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>findID_result1</title>
</head>
<body>
<% 
	String nickName = "a";
	String residence = "daejeon";
	String college = "engineering";

	String _nickName = request.getParameter("nickName");
	String[] _residence = request.getParameterValues("residence");
	String[] _college = request.getParameterValues("college");

	String redirectUrl = "findID.jsp";

	if(nickName.equals(_nickName)){
		for(int i=0; i<_residence.length; i++){
			if(_residence[i].equals(residence)){
				for(int j=0; j<_college.length; j++){
					if(_college[j].equals(college)){
     					session.setAttribute("nickName",_nickName);
      					redirectUrl = "findID_result2.jsp";
					}
				}
			}
   		}
	}

	response.sendRedirect(redirectUrl);
%>	
</body>
</html>