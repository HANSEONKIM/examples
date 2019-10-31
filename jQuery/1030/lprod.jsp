<%@page import="kr.or.ddit.lprod.vo.LprodVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

[
<%
	//servlet에서 지정해준 이름을 가져오기.
	List<LprodVO> list = (List<LprodVO>) request.getAttribute("list");

	for (int i = 0; i < list.size(); i++) {

		LprodVO vo = list.get(i);

		if (i > 0)
			out.print(",");
%>



{
	"id" : "<%=vo.getLprod_id() %>",
	"gu" : "<%=vo.getLprod_gu() %>",
	"nm" : "<%=vo.getLprod_nm() %>"
}






<%
	}
%>

]
