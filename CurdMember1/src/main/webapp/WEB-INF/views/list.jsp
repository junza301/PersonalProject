<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	회원수 : ${total} <br><br>
	<c:forEach var = "dto" items = "${list}">
		${dto.idx}/${dto.id}/${dto.name}/${dto.email} <br>
	</c:forEach>
</body>
</html>