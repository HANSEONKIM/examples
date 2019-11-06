<%@page import="kr.or.ddit.member.vo.ZipVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

[

<%
	List<ZipVO> sido = (List<ZipVO>)request.getAttribute("vo");

	for(int i=0; i<sido.size();i++){
	
		ZipVO vo = sido.get(i);
		if(i>0) out.print(",");
%>
	{
		"sido" : "<%=vo.getSido() %>"
								
	
	}


<%
	}
%>


]
