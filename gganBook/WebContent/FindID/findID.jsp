<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.user" %>
<%@ page import="user.UserDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>

<head>
    <title>findID</title> 
    <link rel="stylesheet" href="findID.css" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
        type="text/css">
</head>

<body>
    <div class="mainContainer">
        <div class="iconWrap">
            <img src="../images/icon.PNG">
        </div>
        <br>
        <form method="post" action="findID_result2.jsp">
            <input id="nickNameInput" name="nickName" type="text" placeholder="닉네임을 입력해 주세요">
            <br><br>
            <div class="formWrap"></div>
            <select name="userLocation">
                <option hidden>거주지역</option>
                <option value="seoul">서울특별시</option>
                <option value="busan">부산광역시</option>
                <option value="daejeon">대전광역시</option>
                <option value="incheon">인천광역시</option>
                <option value="daegu">대구광역시</option>
                <option value="gwangju">광주광역시</option>
                <option value="gyeonggi">경기도</option>
                <option value="gangwon">강원도</option>
                <option value="chungcheongbuk">충청북도</option>
                <option value="chungcheongnam">충청남도</option>
                <option value="jeollabuk">전라북도</option>
                <option value="jeollanam">전라남도</option>
                <option value="gyeongsangbuk">경상북도</option>
                <option value="gyeongsangnam">경상남도</option>
                <option value="jeju">제주특별자치도</option>
            </select>
            <select name="userUniv">
                <option hidden>단과대학</option>
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
            <div class="buttonWrap">
                <input id="btnFindID" type="submit" value="아이디 찾기">
            </div>
    </div>
    </form>
</body>

</html>