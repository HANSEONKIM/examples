<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
td {f on t-family:"돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
}

td a {
	font-family: "돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
	text-decoration: none;
}

td a:hover {
	font-family: "돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
	text-decoration: underline;
}
</style>
<script type="text/javascript" src = "http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/validation.js"></script>
<script type="text/javascript">


	$(function(){
		
		$('input[type=image]').click(function(){
			if(!$('#dong').val().validationDONG()){
				alert("동을 바르게 입력해주세요 !");
				return;
			}
			
			// 쿼리스트링 전송방식 : GET
			// IE : 쿼리스트링의 한글 표현 문제로 에러가 발생.
			// 브라우저 주소창 직접 입력 : 주소?mem_name=encodeURIComponent('김은대')
			// location.href = "주소?mem_name=김은대"
			// location.replace ("주소?mem_name=김은대")
			// <a href ="주소?mem_name=김은대"> 하이퍼레퍼런스</a>
			
			// javascript 인코딩		: 		디코딩 				(유니코드기준)
			// escape()				: 	unescape()				 - 유니코드 형식으로 인코딩 또는 디코딩 
			//													 - URL 표현시 활용되는 기호 (: or/ or ? or etc...)를 포함
			// encodeURI()			: 	decodeURI()				 - 유니코드 형식으로 인코딩 또는 디코딩 
			//											 		 - URL 표현시 활용되는 기호 (: or/ or ? or etc...)를 불포함	
			// encodeURIComponent() : 	decodeURIComponent()	 - 유니코드 형식으로 인코딩 또는 디코딩 
			//													 - URL 표현을 배제한 단순한 문자열 대상으로 디코딩 수행.
			
			$.ajax({
				 type : "POST" 
			    , url : "<%=request.getContextPath()%>/06/searchedZipcode.jsp"
			    ,dataType : "json"
			    ,data : {	dong : $('#dong').val()	}
			    ,error : function(result) {
						alert("code : " + result.status + "\r\nmessage : "	+ request.reponseText);
					}
			    ,success : function(result) {
					//  TODO 취득한 json형식의 문자열을 활용해서 Table 태그의 tr을 반복적으로 작성 및 추가.
					//	TODO Table 태그의 tr에 클릭이벤트가 설정
					
					var htmls = '<table width="100%" height="200px" border="0" cellspacing="0" cellpadding="0" ' +
								' style="overflow:scroll;" id="zipcodeTBL" >' + 
								'<thead>' + 
									'<tr>' +
										'<th>우편번호</th>' + 
										'<th>시도</th>' + 					
										'<th>구(군)</th>' + 
										'<th>동</th>' + 
									'</tr>'+
								'</thead>'+
							   '<tbody>';
							   
					
							for (var i = 0; i < result.length; i++) {

								htmls += '<tr>' +
												'<td>' + result[i].zipcode + '</td>' +
												'<td>' + result[i].sido + '</td>' +
												'<td>' + result[i].gugun + '</td>' +
												'<td>' + result[i].dong + '</td>' +
										'</tr>';
							}
							htmls += '</tbody></table>';
							$('#viewTable').empty().html(htmls);
							$('#zipcodeTBL tr:gt(0)').click(function(){
								
							var zipcode = 	$(this).find('td:eq(0)').text();
							var addr = 	$(this).find('td:eq(1)').text() + " " +
										$(this).find('td:eq(2)').text() + " " +
										$(this).find('td:eq(3)').text()	;								
									
							
							// 팝업 오픈한 도큐맨트 : main.jsp?contentPage=/06/memberForm.jsp
									
							$('#mem_zip1',opener.document).val(zipcode.split('-')[0]);
							$('#mem_zip2',opener.document).val(zipcode.split('-')[1]);
							$('#mem_add1',opener.document).val(addr);
									
									
							//find)()사용하기		
// 							$(opener.document).find('#mem_zip1').val(zipcode.split('-')[0]);
// 							$(opener.document).find('#mem_zip2').val(zipcode.split('-')[1]);
// 							$(opener.document).find('#mem_add1').val(addr);



							
							
							// 팝업종료
							self.close();
							
							})
						}
			    

				});

		})

	})
</script>
</head>
<body>
	<table width="354" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="30"><img src="../image/open_post.gif" width="136"
				height="22"></td>
		</tr>
		<tr>
			<td><img src="../image/open_table01.gif" width="354" height="10"></td>
		</tr>
		<tr>
			<td height="10" background="../image/open_table02.gif" align="center">&nbsp;</td>
		</tr>
		<tr>
			<td height="300" align="center" valign="top"
				background="../image/open_table02.gif">
				<table width="300" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="25"><div align="center">찾고자 하는 지역의 동이름을
								입력해주십시오.</div></td>
					</tr>
					<tr>
						<td height="38" background="../image/open_tt.gif" align="center">
							<input type="text" id="dong">&nbsp;동(읍/면)&nbsp;
							<input type="image" src="<%=request.getContextPath() %>/image/bt_search.gif" border='0'
							align="middle">
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
							<div style="overflow: auto; white-space: nowrap; overflow-X: hidden; height: 200px;" id="viewTable">
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><img src="../image/open_table03.gif" width="354" height="10"></td>
		</tr>
	</table>
</body>
</html>
