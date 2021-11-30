<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ page trimDirectiveWhitespaces="true" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="EUC-KR">
                <title>Insert title here</title>
                <meta charset="UTF-8">
                <title>Untitled</title>
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
                <link rel="stylesheet" href="resources/css/list.css?moluaaaaaaaaaaaaaaaaaaaaa">
            </head>

            <body>
                <div id="wrap">
                    <%@include file="header.jsp" %>
                        <div id="film">
                            <div id="showbox">
                                <div id="movebox">
                                    <c:forEach var="main" items="${main }">
                						<div><img src="${main.image }"></div>
                					</c:forEach>
                                </div>
                            </div>
                        </div>
                        <br><br>
                        <div id="filmlist">
                            <c:forEach var="dto" items="${list}">
                                <div class="film">
                                    <div class="filmimage">
                                        <img src="${dto.image}" class="fimg">
                                    </div>
                                    <div class="filmex">
                                        제목 : ${dto.name} <br>
                                        러닝타임 : ${dto.running_time} <br>
                                        개봉일 : ${dto.release_date} <br>
                                        줄거리 : ${dto.plot} <br>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div id = "page">
                            <ul class = "paging">
                                <c:forEach var="i" begin="${start}" end="${end}">
                                <c:choose>
	                                <c:when test="${i eq now }">
	                                	<li><a href="list.do?now=${i}" style="color: purple">[${i}]</a></li>
	                                </c:when>
	                                <c:otherwise>
	                                	<li><a href="list.do?now=${i}">[${i}]</a></li>
	                                </c:otherwise>
                                </c:choose>
                                </c:forEach>
                            </ul>
                        </div>
				<br><br>
                 <%@include file="footer.jsp" %>


                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
                <script>
                    $("#movebox").children().eq(0).addClass("noaccent");
                    $("#movebox").children().eq(1).addClass("accent");
                    $("#movebox").children().eq(2).addClass("noaccent");

                    var filmSize = document.querySelector("#showbox").clientWidth;
                    $("#movebox").children().css("width", filmSize / 3);

                    setInterval(function () {
                        $("#movebox").children().eq(0).removeClass("noaccent");
                        $("#movebox").children().eq(1).removeClass("accent");
                        $("#movebox").children().eq(2).removeClass("noaccent");

                        $("#movebox").stop().animate({
                            left: -filmSize / 3
                        }, 300, function () {
                            var tmp = $("#movebox").children().eq(0).detach();
                            $("#movebox").append(tmp);
                            $("#movebox").css("left", "0");
                            $("#movebox").children().eq(0).addClass("noaccent");
                            $("#movebox").children().eq(1).addClass("accent");
                            $("#movebox").children().eq(2).addClass("noaccent");
                        })
                    }, 3000);
                </script>
            </body>

            </html>