<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.ibatis.config.sqlMapClientFactory"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <%
    //ibatis환경설정 - SqlMapConfig.xml
    
  	//DB 연결
    SqlMapClient client = 	sqlMapClientFactory.getInstance();

   	//mapper로 접근해서 member 테이블에 데이터를 검색해서
   	List<MemberVO> list = client.queryForList("memberTest.getMemberAll");
%>  	
   	
   	
   	
	 <table border='2'>
		 <tr>
			<td>아이디</td>
			<td>이름</td>
			<td>생일</td>
			<td>전화번호</td>
			<td>우편번호</td>
			<td>주소</td>
			<td>상세주소</td>
			<td>메일</td>
		</tr>
   	
   	
   	
<%   	
   	//결과를 json형식의 object 배열로 생성한다.   //json 형태로 바꾸기
   	for(int i=0; i<list.size();i++){
   		if(i>0) 	out.print(",");
   	MemberVO vo = list.get(i); 	
%>   		
   		

			
					
		<tr>
				<td><%=vo.getMem_id() %></td>
				<td><%=vo.getMem_name()%></td>
				<td><%=vo.getMem_bir() %></td>
				<td><%=vo.getMem_hp() %></td>
				<td><%=vo.getMem_zip() %></td>
				<td><%=vo.getMem_add1() %></td>
				<td><%=vo.getMem_add2() %></td>
				<td><%=vo.getMem_mail() %></td>
		</tr>	
					
   		
<%  
	
   	} //for문 닫음
    
  %>
			
				
				</table>



		
