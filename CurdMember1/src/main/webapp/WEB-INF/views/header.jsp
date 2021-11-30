<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>

		<header>
            <div id="logo"></div>
            <div id="title">CINEMA</div>
            
            <c:if test="${dto == null}">
            <div id="sign">
                <button onclick="location='login.do'">로그인</button>
                <button onclick="location='signup.do'">회원가입</button>
            </div>
            </c:if>
            <c:if test="${dto != null}">
            <div id="sign">
            	${dto.id}
            	<button>마이페이지</button>
            	<button onclick="location='logout.do'">로그아웃</button>
            </div>
            </c:if>
        </header>
        
        <nav>
            <ul id="menu">
                <li>예매
                    <div>
                        <ul class="sub">
                            <li>예매하기</li>
                        </ul>
                    </div>
                </li>
                <li>영화
                    <div>
                        <ul class="sub">
                            <li><a href="list.do">현재상영작</a></li>
                        </ul>
                    </div>
                </li>
                <li>영화관
                    <div>
                        <ul class="sub">
                            <li>영화관찾기</li>
                        </ul>
                    </div>
                </li>
                <li>이벤트
                    <div>
                        <ul class="sub">
                            <li>진행중인이벤트</li>
                        </ul>
                    </div>
                </li>
            </ul>
        </nav>
        <br><br>