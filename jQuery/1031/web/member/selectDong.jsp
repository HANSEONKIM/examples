<%@page import="kr.or.ddit.member.vo.ZipVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
[

<%
	List<ZipVO> dongList = (List<ZipVO>)request.getAttribute("vo");
	

	for(int i=0 ; i<dongList.size();i++){
	
	ZipVO vo = dongList.get(i);
	if(i>0) out.print(",");

%>



{

	"dong" : "<%=vo.getDong() %>"

	
}	




<%
	}
%>



]
