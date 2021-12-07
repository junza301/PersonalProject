<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <link rel="stylesheet" href="resources/css/book.css?molaaaaa">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
</head>

<body>
	<div id="wrap">
		<%@include file="header.jsp" %>
		<div id="book">
			<form action="bookproc.do" method="post">
			<input type="hidden" name = cinema id="SaveCinema">
            <input type="hidden" name = movie id="SaveMovie">
            <input type="hidden" name = time id="SaveTime">
		
            <div class="titlediv" onclick="Show(1)">
                <div class="titlefont">01. 영화관선택</div>
                <hr>
            </div>
            <div class="contentdiv" id="div1" style="overflow: auto;">
            	<c:forEach var="Clist" items="${Clist }">
                	<input type="button" class="cinema" value="${Clist.branch}">
                </c:forEach>
            </div>

            <div class="titlediv" onclick="Show(2)">
                <div class="titlefont">02. 영화선택</div>
                <hr>
            </div>
            <div class="contentdiv" id="div2" style="display: none; overflow: auto;">
            	<c:forEach var="Mlist" items="${Mlist }">
                	<input type="button" class="movie" value="${Mlist.name}">
                </c:forEach>
            </div>

            <div class="titlediv" onclick="Show(3)">
                <div class="titlefont">03. 시간선택</div>
                <hr>
            </div>
            <div class="contentdiv" id="div3" style="display: none;">
            	<input type="text" name="date" value="날짜를 선택하세요" id="datepicker"> <br><br>
            	<input type="button" class="time" value="9:00">
            	<input type="button" class="time" value="12:00">
            	<input type="button" class="time" value="15:00">
            	<input type="button" class="time" value="18:00">
            	<input type="button" class="time" value="21:00">
            </div>
            
            <div class="titlediv" onclick="Show(4)">
                <div class="titlefont">04. 인원선택</div>
                <hr>
            </div>
            <div class="contentdiv" id="div4" style="display: none; height:150px;">
            	성인
            	<input type="button" value="-" id="adown">
            	<input type="text" name="adult" value="1" id="adult">
            	<input type="button" value="+" id="aup"> <br>
            	아동
            	<input type="button" value="-" id="cdown">
            	<input type="text" name="children" value="0" id="children">
            	<input type="button" value="+" id="cup"> <br><br>
            	총액
            	<input type="text" value="13000" id="amount">
            </div>
            
            <div class="titlediv">
            	<input type="submit" value="예매하기">
            </div>
            </form>
        </div>
		<%@include file="footer.jsp" %>
	</div>
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <script>
    
	    function Show(num) {
	        switch (num) {
	            case 1: $("#div1").css("display", "block"); $("#div2").css("display", "none"); $("#div3").css("display", "none"); $("#div4").css("display", "none"); break;
	            case 2: $("#div1").css("display", "none"); $("#div2").css("display", "block"); $("#div3").css("display", "none"); $("#div4").css("display", "none"); break;
	            case 3: $("#div1").css("display", "none"); $("#div2").css("display", "none"); $("#div3").css("display", "block"); $("#div4").css("display", "none"); break;
	            case 4: $("#div1").css("display", "none"); $("#div2").css("display", "none"); $("#div3").css("display", "none"); $("#div4").css("display", "block"); break;
	        }
	    }

        $.datepicker.setDefaults({
            dateFormat: 'yy-mm-dd',
            prevText: '이전 달',
            nextText: '다음 달',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            showMonthAfterYear: true,
            yearSuffix: '년'
        });

        $(function () {
            $("#datepicker").datepicker();
            $("#adown").click(function () {
                var tmp = $("#adult").val();
                if (tmp > 0) {
                    tmp--;
                    var tmp2 = parseInt($("#amount").val());
                    tmp2 -= 13000;
                    $("#amount").val(tmp2);
                }
                $("#adult").val(tmp);
            })

            $("#aup").click(function () {
                var tmp = $("#adult").val();
                if (tmp != 99) {
                    tmp++;
                    var tmp2 = parseInt($("#amount").val());
                    tmp2 += 13000;
                    $("#amount").val(tmp2);
                }
                $("#adult").val(tmp);
            })
            
            $("#cdown").click(function () {
                var tmp = $("#children").val();
                if (tmp > 0) {
                    tmp--;
                    var tmp2 = parseInt($("#amount").val());
                    tmp2 -= 10000;
                    $("#amount").val(tmp2);
                }
                $("#children").val(tmp);
            })

            $("#cup").click(function () {
                var tmp = $("#children").val();
                if (tmp != 99) {
                    tmp++;
                    var tmp2 = parseInt($("#amount").val());
                    tmp2 += 10000;
                    $("#amount").val(tmp2);
                }
                $("#children").val(tmp);
            })
            
            $(".cinema").click(function() {
            	Show(2);
            	$("#SaveCinema").val($(this).val());
            	console.log($("#SaveCinema").val());
            })
            
            $(".movie").click(function() {
            	Show(3);
            	$("#SaveMovie").val($(this).val());
            })
            
            $(".time").click(function() {
            	Show(4);
            	$("#SaveTime").val($(this).val());
            })
        });
    </script>
</body>

</html>