<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>회원가입폼</title>
        <link rel="stylesheet" href="signIn.css"> 
    </head>
        <div class="main-container">
            <header>
                <div class="logo-wrap">
                    <img src="./images/logo2.PNG" id="logo2">
                </div>
            </header>
            <form action="chkLogin.jsp" method="post">
	            <section class="imformation-section-wrap">
	                <div class="nickname-input-wrap">
	                    <input placeholder="닉네임을 입력해주세요" id="nickname" type="text">
	                </div>
	                <div class="id-input-wrap">
	                    <input placeholder="아이디를 입력해주세요" id="id" type="text">
	                </div>
	                <div class="password-input-wrap">
	                    <input placeholder="비밀번호를 입력해주세요" id="password" type="password">
	                </div>
	                <div class="check-password-input-wrap">
	                    <input placeholder="비밀번호를 확인해주세요" id="checkPassword" type="password">
	                </div> 
	                <div class="additional-imformation-wrap">
	                    <select class="location-select">
	                        <option selected="selected">거주지역</option>
	                        <option>경기도</option>
	                        <option>서울시</option>
	                    </select>
	                    <select class="college-select">
	                        <option selected="selected">단과대학</option>
	                        <option>불교대학</option>
	                        <option>문과대학</option>
	                        <option>이과대학</option>
	                        <option>법과대학</option>
	                        <option>사회과학대학</option>
	                        <option>경찰사법대학</option>
	                        <option>경영대학</option>
	                        <option>바이오시스템대학</option>
	                        <option>공과대학</option>
	                        <option>사범대학</option>
	                        <option>예술대학</option>
	                        <option>약학대학</option>
	                        <option>미래융합대학</option>
	                        <option>AI융합학부</option>
	                        <option>연계정보</option>
	                    </select>
                 </form>
                </div>  
                <input id="btnsubmit" value="회원가입" type="submit">
            </section>
        </div>
    <body>

    </body>
</html>