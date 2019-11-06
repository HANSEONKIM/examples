<%@page import="kr.or.ddit.member.vo.ZipVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 [   
<%

	List<ZipVO> donglist = (List<ZipVO>)request.getAttribute("vo");
	
	for(int i=0; i<donglist.size();i++){
		
		ZipVO vo = donglist.get(i);
		if(i>0) out.print(",");
		
%>
	{
	
		"zipcode" : "<%= vo.getZipcode() %>",
		"addr" : "<%= vo.getSido() %><%= vo.getGugun() %><%= vo.getDong() %>",		
		"bunji" : "<%= vo.getBunji() %>"	
								
	
	
	}


<% 

	}
%>	

]	
