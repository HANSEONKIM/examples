<%@page import="java.net.URLEncoder"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String mem_id = request.getParameter("mem_id");
	Map<String, String> params = new HashMap<String, String>();
	params.put("mem_id", mem_id);

	IMemberService service = IMemberServiceImpl.getInstance();
	service.deleteMemberInfo(params);

	String message = URLEncoder.encode("회원탈퇴가 완료되었습니다.");

	RequestDispatcher dispatcher = request
			.getRequestDispatcher("/06/loginForm.jsp?message=" + message);
	dispatcher.forward(request, response);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
