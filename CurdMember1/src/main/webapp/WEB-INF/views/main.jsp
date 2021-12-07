<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>Untitled</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/main.css">
</head>

<body>
    <div id="wrap">
    <%@include file = "header.jsp" %>
        <div class="hr-sect">FILM</div> <br>
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
        <div class="hr-sect">BOOKING</div>
        <div id="booking">
            <button id="left"> ◀ </button>
            <button id="right"> ▶</button>
            <div id="bshow">
                <div id="bmove">
                    <div>
                        <img src="resources/image/cat1.jpg" class="bimg">
                        <div class="detail">
                            <input type="button" class="bbutton" value="예매하기">
                        </div>
                    </div>
                    <div>
                        <img src="resources/image/cat2.jpg" class="bimg">
                        <div class="detail">
                            <input type="button" class="bbutton" value="예매하기">
                        </div>
                    </div>
                    <div>
                        <img src="resources/image/cat3.jpg" class="bimg">
                        <div class="detail">
                            <input type="button" class="bbutton" value="예매하기">
                        </div>
                    </div>
                    <div>
                        <img src="resources/image/cat4.jpg" class="bimg">
                        <div class="detail">
                            <input type="button" class="bbutton" value="예매하기">
                        </div>
                    </div>
                    <div>
                        <img src="resources/image/cat5.jpg" class="bimg">
                        <div class="detail">
                            <input type="button" class="bbutton" value="예매하기">
                        </div>
                    </div>
                    <div>
                        <img src="resources/image/cat6.jpg" class="bimg">
                        <div class="detail">
                            <input type="button" class="bbutton" value="예매하기">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="hr-sect">EVENT</div>
        <div id="event">
            <div id="ewrap">
                <div id="event1">
                    <img src="resources/image/event1.png">
                    <div>
                        <p style="color: purple;">SUMMER BARGAIN</p>
                        <p>영화, 팝콘, 굿즈까지!</p>
                    </div>
                </div>
                <div id="event2">
                    <img src="resources/image/event2.jpg">
                    <div>
                        <p style="color: purple;">최고의 몰입감!</p>
                        <p>대관해서 게임하자!</p>
                    </div>
                </div>
                <div id="event3">
                    <img src="resources/image/event3.png">
                    <div>
                        <p style="color: purple;">휴가철 피서지</p>
                        <p>이벤트 참여하고 캠핑용품 받자!</p>
                    </div>
                </div>
                <div id="event4">
                    <img src="resources/image/event4.jpg">
                    <div>
                        <p style="color: purple;">오늘밤 더운데 뭐하지?</p>
                        <p>밤에도 영화보자!</p>
                        <p>야간개장 OPEN!</p>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    
    <script>
        $(function () {

            //예매 hover
            $("#bmove>div").mouseenter(function () {
                $(this).children().css("display", "block");
            })
            $("#bmove>div").mouseleave(function () {
                $(this).children().eq(1).css("display", "none");
            })


            $(".bbutton").mouseenter(function () {
                $(this).css("text-decoration", "underline");
            })
            $(".bbutton").mouseout(function () {
                $(this).css("text-decoration", "none");
            })

            $("#movebox").children().eq(0).addClass("noaccent");
            $("#movebox").children().eq(1).addClass("accent");
            $("#movebox").children().eq(2).addClass("noaccent");

            var filmSize = document.querySelector("#showbox").clientWidth;
            $("#movebox").children().css("width", filmSize / 3);

            var bookSize = document.querySelector("#bshow").clientWidth;
            $("#bmove").children().css("width", filmSize / 4);


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

            $("#right").click(function () {
                $("#bmove").stop().animate({
                    left: -bookSize / 4
                }, 300, function () {
                    var tmp = $("#bmove").children().eq(0).detach();
                    $("#bmove").append(tmp);
                    $("#bmove").css("left", "0");
                })
            })

            $("#left").click(function () {
                $("#bmove").stop().animate({
                    left: bookSize / 4
                }, 300, function () {
                    var tmp = $("#bmove").children().eq(5).detach();
                    $("#bmove").prepend(tmp);
                    $("#bmove").css("left", "0");
                })
            })
        })
    </script>
</body>

</html>