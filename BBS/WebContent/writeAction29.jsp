<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ page import="bbs.BbsDAO" %> 

<%@ page import="java.io.PrintWriter" %> <!-- 자바 클래스 사용 -->

<% request.setCharacterEncoding("UTF-8"); %>





<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />

<jsp:setProperty name="bbs" property="bbsTitle" />

<jsp:setProperty name="bbs" property="bbsContent" /> 




<!DOCTYPE html>

<html>

<head>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 

<title>달서구 시민 정책 포럼 게시판</title>

</head>

<body>

	<%

			//라긴된 회원들은 페이지에 접속 할 수 없도록

			String userID = null;

			if(session.getAttribute("userID") != null ){

				userID = (String) session.getAttribute("userID");

			}

			if(userID == null){

				PrintWriter script = response.getWriter();

				script.println("<script>");

				script.println("alert('로그인을 하세요.')");

				script.println("location.href = 'login.jsp'");

				script.println("</script>");	

			} else {
				if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) 

						{

							PrintWriter script = response.getWriter();

							script.println("<script>");

							script.println("alert('입력이 안 된 사항이 있습니다.')");

							script.println("history.back()");

							script.println("</script>");

						} else{

							BbsDAO bbsDAO = new BbsDAO(); //인스턴스생성

							int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());				

							

							if(result == -1){ // 아이디가 기본키기. 중복되면 오류.

								PrintWriter script = response.getWriter();

								script.println("<script>");

								script.println("alert('글쓰기에 실패했습니다.')");

								script.println("history.back()");

								script.println("</script>");

							}

							//가입성공

							else {
								
								PrintWriter script = response.getWriter();

								script.println("<script>");

								script.println("location.href = 'bbs28.jsp'");

								script.println("</script>");
							

							}
				
			}


		
			}

			%>


</body>

</html>



