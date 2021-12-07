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
    <link rel="stylesheet" href="resources/css/successerror.css">
</head>

<body>
    <div id="wrap">
        <%@include file="header.jsp" %>
        <div style="width: 80%; height: 500px; position: relative; left: 10%; text-align: center; font-size: 40px;">
        	예매 실패! <br>
        	좌석이 부족합니다. <br>
        	<input type="button" value="홈으로" onclick="location.href='main.do';">
        </div>
        <%@include file="footer.jsp" %>
	</div>
</body>
</html>