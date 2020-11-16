<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">  <!-- 반응형 웹에 사용하는 메타태그 -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css"> 
<title>달서구 시민 정책 포럼 게시판</title>
</head>
<body>
<%
    String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
    if (session.getAttribute("userID") != null)
    {
        userID = (String)session.getAttribute("userID");
    }
%>
    <nav class ="navbar navbar-default">
        <div class="navbar-header"> <!-- 홈페이지의 로고 -->
            <button type="button" class="navbar-toggle collapsed"
                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                aria-expand="false">
                <span class ="icon-bar"></span> <!-- 줄였을때 햄버거바 -->
                <span class ="icon-bar"></span>
                <span class ="icon-bar"></span>
            </button>
            <a class ="navbar-brand" href="main8.jsp">달서구 시의원 게시판</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="main8.jsp">메인</a></li>
                <li><a href="bbs8.jsp">게시판</a></li>
            </ul>
            <%
            // 접속하기는 로그인이 되어있지 않은 경우만 나오게한다
                if(userID == null)
                {
            %>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                <a href="#" class = "dropdown-toggle"
                    data-toggle="dropdown" role ="button" aria-haspopup="true"
                    aria-expanded="false">접속하기<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="login.jsp">로그인</a></li>
                        <li class="active"><a href="join.jsp">회원가입</a></li>                    
                    </ul>
                </li>
            </ul>
            <%
            // 로그인이 되어있는 사람만 볼수 있는 화면
                } else {
            %>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                <a href="#" class = "dropdown-toggle"
                    data-toggle="dropdown" role ="button" aria-haspopup="true"
                    aria-expanded="false">회원관리<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="logoutAction.jsp">로그아웃</a></li>
                    </ul>
                </li>
            </ul>
            <%
                }
            %>
        </div>
    </nav>
 	<div class="container">
 		<div class="jumbotron">
 			<div class="container">
 				<h1>국민의힘/이영애</h1>
 				<p>달서구 제 1선거구. 소통 게시판에 오신 걸 환영합니다. </p>
 				<p><a class="btn btn-primary btn-pull" href="https://www.facebook.com/youngae.lee.794" role="button">의원님 자세히 알아보기</a></p>
 				<p><a class="btn btn-primary btn-pull" href="#" role="button">메인 홈페이지로.</a></p>
 			</div>
 		</div>
 	</div>
 	<div class="container">
 		<div id="myCarousel" class="carousel slide" data-ride="carousel">
 			<ol class="carousel-indicators">
 				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
 				<li data-target="#myCarousel" data-slide-to="1"></li>
 				<li data-target="#myCarousel" data-slide-to="2"></li>
 			</ol>
 			<div class="carousel-inner">
 				<div class="item active">
 					<img src="images/yung1.jpg">
 				</div>
 				<div class="item">
 					<img src="images/yung2.jpg">
 				</div>
 				<div class="item">
 					<img src="images/yung3.jpg">
 				</div>
 			</div>
 			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
 				<span class="glyphicon glyphicon-chevron-left"></span>
 			</a>
 			<a class="right carousel-control" href="#myCarousel" data-slide="next">
 				<span class="glyphicon glyphicon-chevron-right"></span>
 			</a>
 		</div>
 	</div>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>
