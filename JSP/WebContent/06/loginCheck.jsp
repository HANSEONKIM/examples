<%@page import="kr.or.ddit.utiles.CryptoGenerator"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String mem_id = request.getParameter("mem_id");
	String mem_pass = request.getParameter("mem_pass");
	
	mem_id = CryptoGenerator.decryptRSA(session,mem_id);
	mem_pass = CryptoGenerator.decryptRSA(session,mem_pass);
	
	Map<String, String> params = new HashMap<String,String>();
	params.put("mem_id", mem_id);
	params.put("mem_pass", mem_pass);

	
	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberInfo = service.memberInfo(params);
	
	if(memberInfo == null){
		String message = URLEncoder.encode("회원이 아닙니다.", "UTF-8") ;
		response.sendRedirect(request.getContextPath()+"/06/loginForm.jsp?message=" + message);
	}else{
		session.setAttribute("LOGIN_MEMBERINFO", memberInfo);
		response.sendRedirect(request.getContextPath()+"/06/main.jsp");
	}
	
	
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
