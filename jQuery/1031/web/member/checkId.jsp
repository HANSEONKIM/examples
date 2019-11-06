<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	String dbres = (String)request.getAttribute("id");
	String inputres = (String)request.getAttribute("input_id");
	
	if(dbres == null){
%>		
	{
		"sw" : "<%=inputres %>님 사용 가능"
		
	
	
	}
	


<%	}else{ %>
		
		{
		"sw" : "<%=inputres %>님 사용 불가능"
			
		}
		
<% 	}%>    

