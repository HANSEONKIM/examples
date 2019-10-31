<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//http://localhost/ddit/06/main.jsp
	//http://localhost/ddit/06/main.jsp?contentPage=/06/memberForm.jsp
	//http://localhost/ddit/06/main.jsp?contentPage=/06/memberView.jsp?mem_id=a001
	//http://localhost/ddit/06/main.jsp?contentPage=/06/memberList.jsp
	//http://localhost/ddit/06/insertMemberInfo.jsp
	//http://localhost/ddit/06/updateMemberInfo.jsp	
	//http://localhost/ddit/06/deleteMemberInfo.jsp		
	String contentPage = request.getParameter("contentPage");
	if(contentPage==null){
		contentPage ="/06/memberList.jsp";
		
	}
%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.indigo-pink.min.css">
<script
	src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style type="text/css">
.mdl-layout__container {
	width: 240px;
}
</style>
</head>
<body>
<center>
	<div id="wrap">
		<div id="header">
		<!--
			포워드 : 컨텍스트 루트|패스 배제(절대경로)
			jsp:include (액션테그) : UI 레이아웃을 구성시 활용.
		  -->
			<jsp:include page="/06/layout/header.jsp" />
		
		</div>
		<p style="clear: both;"></p>
		<div>
			<div class="left">
				<jsp:include page="/06/layout/left.jsp" />
			</div>
			<div id="content" style="height: 600px; margin-left: 250px; overflow: scroll;">
				<jsp:include page="<%=contentPage %>" />
			</div>
		</div>
		<div>
			<jsp:include page="/06/layout/footer.jsp" />
		</div>
	</div>
</center>
</body>
</html>









