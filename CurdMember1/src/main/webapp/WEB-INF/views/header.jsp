<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>

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
                        </ul>
                    </div>
                </li>
                <li>��ȭ
                    <div>
                        <ul class="sub">
                            <li><a href="list.do">�������</a></li>
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