<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/mypage.css?aaa">
</head>

<body>
    <div id="wrap">
        <%@include file="header.jsp" %>
        <div class="hr-sect">내정보</div>
        <div id="profile">
        	<a>이름 : ${mdto.name } </a><br>
        	<a>아이디 : ${mdto.id } </a><br>
        </div>
        <div class="hr-sect">내예약</div>
        <div id="booklist">
        	<c:forEach var="bdto" items="${bdto}">
                <a>상영관 : ${bdto.cinema}   영화 : ${bdto.movie }</a> <br>
                <a>날짜 : ${bdto.bdate } 시간 : ${bdto.btime } 인원 : ${bdto.people }</a> <br>
            	<br>
            </c:forEach>
        </div>
        <%@include file="footer.jsp" %>
	</div>
</body>
</html>