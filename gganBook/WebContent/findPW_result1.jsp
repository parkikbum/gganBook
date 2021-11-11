<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>findPW_result1</title>
</head>
<body>
<% 
	String id = "a";
	String nickName = "b";
	String residence = "daejeon";
	String college = "engineering";

	String _id = request.getParameter("id");
	String _nickName = request.getParameter("nickName");
	String[] _residence = request.getParameterValues("residence");
	String[] _college = request.getParameterValues("college");

	String redirectUrl = "findPW.jsp";
	
	if(id.equals(_id)){
		if(nickName.equals(_nickName)){
			for(int i=0; i<_residence.length; i++){
				if(_residence[i].equals(residence)){
					for(int j=0; j<_college.length; j++){
						if(_college[j].equals(college)){
     						session.setAttribute("nickName",_nickName);
      						redirectUrl = "findPW_result2.jsp";
						}
					}
				}
   			}
		}
	}

	response.sendRedirect(redirectUrl);
%>	
</body>
</html>