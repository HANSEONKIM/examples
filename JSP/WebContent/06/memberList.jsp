<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	IMemberService service = IMemberServiceImpl.getInstance();
List<MemberVO> memberList = service.memberList();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type='text/javascript'
	src='http://code.jquery.com/jquery-latest.js'></script>
<script type='text/javascript'>
	$(function() {
		$('table tr:gt(0)').click(function() {

			var mem_id = $(this).find('td:eq(0)').text();
			location.href = '/ddit/06/main.jsp?contentPage=/06/memberView.jsp?mem_id=' + mem_id;

		});

	});
</script>
</head>
<body>
	<div id="list">
		<table
			class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp"
			style="width: 100%;">
			<thead>
				<tr>
					<th class="mdl-data-table__cell--non-numeric">아이디</th>
					<th class="mdl-data-table__cell--non-numeric">패스워드</th>
					<th class="mdl-data-table__cell--non-numeric">이름</th>
					<th class="mdl-data-table__cell--non-numeric">주민번호1</th>
					<th class="mdl-data-table__cell--non-numeric">주민번호2</th>
				</tr>
			</thead>
			<tbody>
			<%
				for (MemberVO memberInfo : memberList) {
			%>
			<tr>
				<td class="mdl-data-table__cell--non-numeric"><%=memberInfo.getMem_id()%></td>
				<td class="mdl-data-table__cell--non-numeric"><%=memberInfo.getMem_pass()%></td>
				<td class="mdl-data-table__cell--non-numeric"><%=memberInfo.getMem_name()%> 	</td>
				<td class="mdl-data-table__cell--non-numeric"><%=memberInfo.getMem_regno1()%></td>
				<td class="mdl-data-table__cell--non-numeric"><%=memberInfo.getMem_regno2()%></td>
			</tr>
			<%
				}
			%>
			<!-- 	<tr>
					<td class="mdl-data-table__cell--non-numeric">a001</td>
					<td class="mdl-data-table__cell--non-numeric">asdfasdf</td>
					<td class="mdl-data-table__cell--non-numeric">김은대</td>
					<td class="mdl-data-table__cell--non-numeric">111111</td>
					<td class="mdl-data-table__cell--non-numeric">1111111</td>
				</tr>
				<tr>
					<td class="mdl-data-table__cell--non-numeric">b001</td>
					<td class="mdl-data-table__cell--non-numeric">1004</td>
					<td class="mdl-data-table__cell--non-numeric">이쁜이</td>
					<td class="mdl-data-table__cell--non-numeric">111111</td>
					<td class="mdl-data-table__cell--non-numeric">1111111</td>
				</tr> -->
			</tbody>
		</table>
	</div>
	<div class="searchForm" align="right" style="margin-top: 10px;">
		<form method="post"
			action="${pageContext.request.contextPath }/18_1/main.jsp?contentPage=boardList.jsp">
			<select name="search_keycode">
				<option value="ALL">전체</option>
				<option value="TITLE">제목</option>
				<option value="CONTENT">컨텐츠</option>
			</select> <input type="text" id="search_keyword" name="search_keyword">
			<button
				class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent"
				type="submit">검색</button>
			<button
				class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent"
				type="button">글쓰기</button>
		</form>
	</div>
</body>
</html>








