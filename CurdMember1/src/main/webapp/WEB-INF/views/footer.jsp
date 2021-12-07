<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>
	<br><hr><br>
		<footer>
            <p style="font-size: 18px;">CINEMA</p>
            <p style="text-indent: 5px;">회원약관 |
                개인정보처리방침 |
                이메일무단수집거부 |
                영상정보처리기기 운영 및 관리방침
            <p style="text-indent: 5px;">땡땡시 땡땡구 땡땡로 | 고객센터 123-4567</p>
        </footer>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script>
    	$(function () {
    		for (var i = 0; i < 3; i++) {
                $("#menu>li").eq(i).css("border-right", "3px solid black");
            }

            //메뉴 hover
            $("#menu>li").mouseenter(function () {
                $(this).css("border-bottom", "5px solid red");
                $(this).children().css("display", "block");
            })
            $("#menu>li").mouseleave(function () {
                $(this).css("border-bottom", "none");
                $(this).children().css("display", "none");
            })

            //세부메뉴 hover
            $(".sub>li>a").mouseenter(function () {
                $(this).css("color", "red");
            })
            $(".sub>li>a").mouseout(function () {
                $(this).css("color", "white");
            })
    	})
    </script>