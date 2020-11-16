<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
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
    int bbsID = 0;
    if (request.getParameter("bbsID") != null) {
    	bbsID = Integer.parseInt(request.getParameter("bbsID"));
    }
    if (bbsID == 0) {
    	PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('유효하지 않은 글입니다.')");

		script.println("location.href = 'bbs5.jsp'");

		script.println("</script>");
    }
    Bbs bbs = new BbsDAO().getBbs(bbsID);
%>
    <nav class ="navbar navbar-default">
        <div class="navbar-header"> <!-- 홈페이지의 로고 -->
            <button type="button" class="navbar-toggle collapsed"
                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                aria-expand="false">
                <span class ="icon-bar"></span> <!-- 줄였을때 옆에 짝대기 -->
                <span class ="icon-bar"></span>
                <span class ="icon-bar"></span>
            </button>
            <a class ="navbar-brand" href="main5.jsp">달서구 국회의원 게시판</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="main5.jsp">메인</a></li>
                <li class="active"><a href="bbs5.jsp">게시판</a></li>
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
 		<div class="row">
 		
 		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
 				<thead>
 					<tr>
 						<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글보기 </th>
 			
 					</tr>
 				</thead>
 				 <tbody>
 					<tr>
 						<td style="width: 20%;">글 제목</td>
 						<td colspan="2"> <%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
 					</tr>
 					<tr>
 						<td>작성자</td>
 						<td colspan="2"> <%= bbs.getUserID() %></td>
 					</tr>
 					<tr>
 						<td>작성일자</td>
 						<td colspan="2"> <%= bbs. getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시" + bbs.getBbsDate().substring(15, 16) + "분" %></td>
 					</tr>
 					<tr>
 						<td>내용</td>
 						<td colspan="2" style="min-height: 200px; text-align: left;"> <%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
 					</tr>
 				  </tbody>  
 				</table>
 				<a href="bbs5.jsp" class="btn btn-primary">목록</a>
 				<%
 					if(userID != null && userID.equals(bbs.getUserID())) {
 				%>		
 					  	<a href="update5.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">수정 </a>
 					  	<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction5.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제 </a>
 					<% 
 						}
 					%>		
 		</div>
 	</div>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>
