<%@page import="kr.or.ddit.member.vo.ZipVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
[

<% List<ZipVO> gugunList = (List<ZipVO>)request.getAttribute("vo");

	for(int i =0; i<gugunList.size(); i ++){
		
		ZipVO vo = gugunList.get(i);
		if(i>0) out.print(",");
	
	
%>


{

	"gugun" : "<%=vo.getGugun() %>"

}






<%} %>


]
