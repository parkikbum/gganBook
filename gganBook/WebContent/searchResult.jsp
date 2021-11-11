<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>searchResult</title>
    <link rel="stylesheet" href="Header.css" type="text/css">
    <link rel="stylesheet" href="searchResult.css" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
        type="text/css">
</head>

<body>
    <!-- 헤더부분 -->
    <div id="header">
        <input type="image" src="./images/logo.png">
        <input type="text" class="searchTerm" placeholder="책이름을 입력해봐요">
        <button type="submit" class="searchButton"> <i class="fa fa-search"></i> </button>
        <input type="image" src="./images/profile.png" class="profile">
        <p class="userName">김김지지호호</p>
    </div>
        
    <!-- 뷰 부분 -->
    <br>
    <div class="mainContainer">
        <div class="resultContainer">
            <img src="./images/booksample.jpg" id="image">
            <div class="txtAreaWrap">
                <h2>파이썬 프로그래밍 책 팝니다.</h2>
                <input id="isSold" value="판매완료">
                               
            </div>
            <div class="txtArea">
                <h4>10000원</h4>
                <h5>사실분</h5>
            </div> 
        </div>

        <div class="resultContainer">
            <img src="./images/booksample2.jpg" id="image">
            <div class="txtAreaWrap">
                <h2>Java의 정석 책 팝니다.</h2>
                <input id="isSold" value="판매완료">
                               
            </div>
            <div class="txtArea">
                <h4>20000원</h4>
                <h5>사실분22</h5>
            </div> 
        </div>
    </div>

</body>

</html>