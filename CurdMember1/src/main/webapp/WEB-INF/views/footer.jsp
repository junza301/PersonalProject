<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>
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
            $(".sub>li>a").mouseenter(function () {
                $(this).css("color", "red");
            })
            $(".sub>li>a").mouseout(function () {
                $(this).css("color", "white");
            })
    	})
    </script>