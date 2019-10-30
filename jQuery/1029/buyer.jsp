<%@page import="kr.or.ddit.buyer.vo.BuyerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	BuyerVO vo=	(BuyerVO)request.getAttribute("vo");


%>

{
	"id" 		: "<%=vo.getBuyer_id() %>",
	"name"   	: "<%=vo.getBuyer_name() %>",
	"gu" 		: "<%=vo.getBuyer_lgu() %>",
	"mail" 		: "<%=vo.getBuyer_mail() %>",
	"bankno"	: "<%=vo.getBuyer_bankno() %>",
	"bankname"  : "<%=vo.getBuyer_bankname() %>",
	"bank"      : "<%=vo.getBuyer_bank() %>",
	"zip"		: "<%=vo.getBuyer_zip() %>",
	"add1"		: "<%=vo.getBuyer_add1() %>",
	"add2"		: "<%=vo.getBuyer_add2() %>",			
	"comtel" 	: "<%=vo.getBuyer_comtel() %>"	


}
