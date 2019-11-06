<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String res = (String)request.getAttribute("member");


	if(res != null){
%>

	{
		
		
		"sw" : "<%=res %>님 환영합니다"
	
	}
	



<%	}else{%>	



	{
		
		"sw"		: "가입실패"
			
	}
	
	
	
	
	
	
		
<%		
	}

%>
