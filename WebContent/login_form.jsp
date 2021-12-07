<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%
	request.setCharacterEncoding("uft-8");
	MemberInfo memberInfo = (MemberInfo)session.getAttribute("memberInfo");
	
	if (memberInfo != null) {
		out.println("<script>");
		out.println("alert('잘못된 경로로 들어오셨습니다.');");
		out.println("history.back();");
		out.println("</script>");
		out.close();
	}
	String url = request.getParameter("url");

	if (url == null)	url = "";
	// 로그인 후 이동할 페이지 주소로 없는 경우 빈 문자열로 지정
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<h2>로그인</h2>
<form name="frmLogin" action="login" method="post">
<input type="hidden" name="url" value="<%=url %>" />
<label for="uid">아이디 : </label><input type="text" name="uid" value="test1" /><br />
<label for="pwd">비밀번호 : </label><input type="password" name="pwd" value="1111" /><br />
<input type="submit" value="로그인" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" value="다시 입력" />
</form>
</body>
</html>