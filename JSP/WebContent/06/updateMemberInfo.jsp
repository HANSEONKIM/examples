<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="java.lang.reflect.InvocationTargetException"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	MemberVO memberInfo = new MemberVO();
	
	try {
		BeanUtils.populate(memberInfo, request.getParameterMap());
	}catch (IllegalAccessException e) {
		e.printStackTrace();
	}catch (InvocationTargetException e) {
		e.printStackTrace();
	}
	
	IMemberService service = IMemberServiceImpl.getInstance();
	service.updateMemberInfo(memberInfo);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("/06/main.jsp?contentPage=/06/memberList.jsp");
	dispatcher.forward(request, response);
%>    
