<%@page import="kr.or.ddit.prod.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ProdVO vo = (ProdVO)request.getAttribute("vo");



%>

{

	"id"	 : "<%=vo.getProd_id() %>",
	"lgu"	 : "<%=vo.getProd_lgu() %>",
	"name"	 : "<%=vo.getProd_name() %>",
	"buyer"	 : "<%=vo.getProd_buyer() %>",
	"cost"	 : "<%=vo.getProd_cost() %>",
	"price"	 : "<%=vo.getProd_price() %>",
	"sale"	 : "<%=vo.getProd_sale() %>",
	"outline" : "<%=vo.getProd_outline() %>",
	"detail" : "<%=vo.getProd_detail()%>"

}

