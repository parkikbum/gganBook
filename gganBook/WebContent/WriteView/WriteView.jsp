<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>깐북</title>
        <link rel="stylesheet" href="../Header/Header.css?v=1.1"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="WriteView.css?v=1.1" type="text/css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
    <form action="writeAction.jsp" method="post">
        <div id="header"> 
			<input type="image" src="../images/logo.png" id="logo" onclick="javascript: form.action='../Main/main.jsp'">  
			<input type="text" id="searchTerm" placeholder="책이름을 입력해봐요" name="search">
			<button type="submit" id="searchButton" onclick="javascript: form.action='../searchResult/searchResult.jsp'"> <i class="fa fa-search"></i> </button>
			<div id="profile">
		        <input type="image" src="../images/profile.png" id="profileImage" onclick="javascript: form.action='../Mypage/Mypage.jsp'">
		        <p id="userName"><%= (String)session.getAttribute("userNickname") %></p>
	       </div> 		
        </div>

        <center>         
        <h2 class="title">내 책을 깐부들에게 판매 해봐요</h2>
        </center>
        <div class="box">
        	<div class="box_in">
	        	<div>
	            	<input type="text" class="textInput" placeholder="판매할 책의 이름을 입력해주세요" name="boardTitle">   
	            </div>
	            <div>
	         	    <input type="text" name="boardPrice" placeholder="가격을 입력해주세요" class="valueInput">
	         	    <input type="text" name="boardPhoneNumber" placeholder="전화번호를 입력해주세요" class="phoneNumberInput">
	            </div>    
	            <div>     
	          		<input type="file" class="image1" name="file">
	          	</div>
	          	<div>
	           	    <input type="submit" class="image2" value="사진 등록하기"  onclick="javascript: form.action='./uploadAction.jsp';  enctype='multipart/form-data'"> 
	           	</div>
           	<div>
            <select name="boardLocation" class="location-select">
                <option selected="selected">거래하고싶은 지역</option>
	                <option value="seoul">서울특별시</option>
                	<option value="busan">부산광역시</option>
          			<option value="daejeon">대전광역시</option>
			        <option value="incheon">인천광역시</option>
			        <option value="daegu">대구광역시</option>
			        <option value="gwangju">광주광역시</option>
			        <option value="gyeonggi">경기도</option>
			        <option value="gangwon">강원도</option>
			        <option value="chungbuk">충청북도</option>
			        <option value="chungnam">충청남도</option>
			        <option value="jeonbuk">전라북도</option>
			        <option value="jeonnam">전라남도</option>
			        <option value="gyeongbuk">경상북도</option>
			        <option value="gyeongnam">경상남도</option>
			        <option value="jeju">제주특별자치도</option>
            </select>     
            <select name="boardUniv" class="college-select">
                <option selected="selected">단과대학</option>
					<option selected="selected">단과대학</option>   
                	<option value="buddhist">불교대학</option>
			        <option value="liberalArts">문과대학</option>
			        <option value="science">이과대학</option>
			        <option value="law">법과대학</option>
			        <option value="socialSciences">사회과학대학</option>
			        <option value="policeJudicial">경찰사법대학</option>
			        <option value="business">경영대학</option>
			        <option value="biosystems">바이오시스템대학</option>
			        <option value="engineering">공과대학</option>
			        <option value="education">사범대학</option>
			        <option value="arts">예술대학</option>
			        <option value="pharmacy">약학대학</option>
			        <option value="futureConvergence">미래융합대학</option>
            </select>
            <div>
                <p><textarea cols="40" rows="10" class="explainText" name="boardContent"></textarea></p>
            </div>
            <div>
                <input type="submit" class="submitButton" value="판매글 올리기">
            </div>
            </div>
            </div>
       </div>
       </form>
    </body>
</html>