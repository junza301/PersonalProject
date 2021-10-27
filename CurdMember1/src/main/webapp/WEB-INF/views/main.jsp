<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
        <header>
            <div id="logo"></div>
            <div id="title">CINEMA</div>
            
            <c:if test="${dto == null}">
            <div id="sign">
                <button onclick="location='login.do'">�α���</button>
                <button onclick="location='signup.do'">ȸ������</button>
            </div>
            </c:if>
            <c:if test="${dto != null}">
            <div id="sign">
            	${dto.id}
            	<button>����������</button>
            	<button onclick="location='logout.do'">�α׾ƿ�</button>
            </div>
            </c:if>
        </header>
        <nav>
            <ul id="menu">
                <li>����
                    <div>
                        <ul class="sub">
                            <li>�����ϱ�</li>
                            <li>�󿵽ð�ǥ</li>
                        </ul>
                    </div>
                </li>
                <li>��ȭ
                    <div>
                        <ul class="sub">
                            <li>�������</li>
                            <li>�󿵿�����</li>
                        </ul>
                    </div>
                </li>
                <li>��ȭ��
                    <div>
                        <ul class="sub">
                            <li>��ȭ��ã��</li>
                        </ul>
                    </div>
                </li>
                <li>�̺�Ʈ
                    <div>
                        <ul class="sub">
                            <li>���������̺�Ʈ</li>
                        </ul>
                    </div>
                </li>
            </ul>
        </nav>
        <br><br>
        <div class="hr-sect">FILM</div> <br>
        <div id="film">
            <div id="showbox">
                <div id="movebox">
                    <div><img src="resources/image/cat1.jpg"></div>
                    <div><img src="resources/image/cat2.jpg"></div>
                    <div><img src="resources/image/cat3.jpg"></div>
                    <div><img src="resources/image/cat4.jpg"></div>
                </div>
            </div>
        </div>
        <br><br>
        <div class="hr-sect">BOOKING</div>
        <div id="booking">
            <button id="left"> �� </button>
            <button id="right"> ��</button>
            <div id="bshow">
                <div id="bmove">
                    <div>
                        <img src="resources/image/cat1.jpg" class="bimg">
                        <div class="detail">
                            <input type="button" class="bbutton" value="�����ϱ�">
                        </div>
                    </div>
                    <div>
                        <img src="resources/image/cat2.jpg" class="bimg">
                        <div class="detail">
                            <input type="button" class="bbutton" value="�����ϱ�">
                        </div>
                    </div>
                    <div>
                        <img src="resources/image/cat3.jpg" class="bimg">
                        <div class="detail">
                            <input type="button" class="bbutton" value="�����ϱ�">
                        </div>
                    </div>
                    <div>
                        <img src="resources/image/cat4.jpg" class="bimg">
                        <div class="detail">
                            <input type="button" class="bbutton" value="�����ϱ�">
                        </div>
                    </div>
                    <div>
                        <img src="resources/image/cat5.jpg" class="bimg">
                        <div class="detail">
                            <input type="button" class="bbutton" value="�����ϱ�">
                        </div>
                    </div>
                    <div>
                        <img src="resources/image/cat6.jpg" class="bimg">
                        <div class="detail">
                            <input type="button" class="bbutton" value="�����ϱ�">
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
                        <p>��ȭ, ����, �������!</p>
                    </div>
                </div>
                <div id="event2">
                    <img src="resources/image/event2.jpg">
                    <div>
                        <p style="color: purple;">�ְ��� ���԰�!</p>
                        <p>����ؼ� ��������!</p>
                    </div>
                </div>
                <div id="event3">
                    <img src="resources/image/event3.png">
                    <div>
                        <p style="color: purple;">�ް�ö �Ǽ���</p>
                        <p>�̺�Ʈ �����ϰ� ķ�ο�ǰ ����!</p>
                    </div>
                </div>
                <div id="event4">
                    <img src="resources/image/event4.jpg">
                    <div>
                        <p style="color: purple;">���ù� ��� ������?</p>
                        <p>�㿡�� ��ȭ����!</p>
                        <p>�߰����� OPEN!</p>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <hr>
        <footer>
            <p style="font-size: 18px;">CINEMA</p>
            <p style="text-indent: 5px;">ȸ����� |
                ��������ó����ħ |
                �̸��Ϲ��ܼ����ź� |
                ��������ó����� � �� ������ħ
            <p style="text-indent: 5px;">������ ������ ������ | ������ 123-4567</p>
        </footer>
    </div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script>
        $(function () {
            for (var i = 0; i < 3; i++) {
                $("#menu>li").eq(i).css("border-right", "3px solid black");
            }

            //�޴� hover
            $("#menu>li").mouseenter(function () {
                $(this).css("border-bottom", "5px solid red");
                $(this).children().css("display", "block");
            })
            $("#menu>li").mouseleave(function () {
                $(this).css("border-bottom", "none");
                $(this).children().css("display", "none");
            })

            //���θ޴� hover
            $(".sub>li").mouseenter(function () {
                $(this).css("color", "red");
            })
            $(".sub>li").mouseout(function () {
                $(this).css("color", "white");
            })

            //���� hover
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