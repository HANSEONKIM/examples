<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String mem_id = request.getParameter("mem_id");
Map<String,String> params = new HashMap<String, String>();
params.put("mem_id", mem_id);
IMemberService service = IMemberServiceImpl.getInstance();
MemberVO	memberInfo = service.memberInfo(params);


String year =memberInfo.getMem_bir().substring(0,4);
String month = memberInfo.getMem_bir().substring(5,7);
String day = memberInfo.getMem_bir().substring(9,10);
String [] mem_mail = memberInfo.getMem_mail().toLowerCase().split("@");
String mail_id = mem_mail[0];
String mail = mem_mail[1].trim();

String [] home_tel = memberInfo.getMem_hometel().split("-");
String htel0 = home_tel[0];
String htel1 = home_tel[1];
String htel2 = home_tel[2];

String [] mem_hp = memberInfo.getMem_hp().split("-");
String hp0 = mem_hp[0];
String hp1 = mem_hp[1];
String hp2 = mem_hp[2];

String[] mem_zip = memberInfo.getMem_zip().split("-");
String zip1 = mem_zip[0];
String zip2 = mem_zip[1];

String email1=memberInfo.getMem_mail().split("@")[0];
String email2=memberInfo.getMem_mail().toLowerCase().split("@")[1];
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'></script>
<script type='text/javascript' src='/ddit/js/validation.js'></script>
<script type='text/javascript'>
	$(function() {
		$('#btn4').click(function() {
			$(location).attr('href', '/ddit/06/main.jsp');
		});
		
		$('select[name=mem_hometel1] option[value='+"<%=htel0%>"+']').attr('selected',true);
		$('select[name=mem_hp1] option[value='+"<%=hp0%>"+']').attr('selected',true);
		<%-- $('select[name=mem_mail2] option[value='+"<%=mail%>"+']').attr('selected',true); --%>
		  $('select[name=mem_mail2]').val("<%=email2%>").prop('selected',true);
		
		
		$('#btn3').click(function(){
			
			location.href = '<%=request.getContextPath()%>/06/deleteMemberInfo.jsp?mem_id=<%=memberInfo.getMem_id()%>';
			
		});
			
		$('form[name=memberForm]').submit(function(){
				$(this).attr('action', '<%=request.getContextPath()%>/06/updateMemberInfo.jsp?mem_id=<%=memberInfo.getMem_id()%>');
			<%-- 	$('input[name=mem_id]').attr('value','<%= memberInfo.getMem_id()%>'); --%>
				
			if(!$('input[name=mem_name]').val().validationNM()){
				alert('성명을 바르게 입력해주세요.');
				return false;
			}

			var regnos = $('input[name=mem_regno1]').val() + '-' +
			             $('input[name=mem_regno2]').val();
			if(!regnos.validationREGNO()){
				alert('무효한 주민등록번호입니다.');
				return false;
			}

			var mem_bir = $('input[name=mem_bir1]').val() + '-' +
			              $('input[name=mem_bir2]').val() + '-' +
			              $('input[name=mem_bir3]').val();
		
			$('input[name=mem_bir]').val(mem_bir);
			
			if(!$('input[name=mem_id]').val().validationID()){
				alert('아이디를 바르게 입력해주세요.');
				return false;
			}
			
			if(!$('input[name=mem_pass]').val().validationPWD()){
				alert('패스워드를 바르게 입력해주세요.');
				return false;
			}
			if($('input[name=mem_pass]').val() != 
				$('input[name=mem_pass_confirm]').val()){
				alert('비밀번호를 확인해주세요.');
				return false;
			}
			
			var mem_hometel = $('select[name=mem_hometel1]').val() + '-'
								+$('input[name=mem_hometel2]').val() + '-' 
								+$('input[name=mem_hometel3]').val();
			
			if(!mem_hometel.validationHOMETEL()){
				alert('집전화번호를 바르게 입력해주세요.');
				return false;	}
			$('input[name=mem_hometel]').val(mem_hometel);

		
			
			var mem_hp = $('select[name=mem_hp1]').val() + '-' +
						        $('input[name=mem_hp2]').val() + '-' +
						        $('input[name=mem_hp3]').val();
			$('input[name=mem_hp]').val(mem_hp);

			var mem_mail = $('input[name=mem_mail1]').val() + '@' +
			               $('select[name=mem_mail2]').val();
			if(!mem_mail.validationMAIL()){
				alert('메일 주소를 바르게 입력해주세요.');
				return false;
			}
			$('input[name=mem_mail]').val(mem_mail);
			
			var mem_zip = $('input[name=mem_zip1]').val() + '-' +
			              $('input[name=mem_zip2]').val();
			$('input[name=mem_zip]').val(mem_zip);
			
			return true;
			
			
		});	
			
		
		
		
	})
	
function zipcodePopup(){
		
		// 브라우저 documnet 팝업 : 모달리스 - 활성화된 팝업의 포커스가 자유롭게 이동.
		//						  모달	- 활성화된 팝업이 포커스를 점유하며, 해당팝업이 종료시에만 포커스가 자유롭게 이됭.
		
		var url = '<%= request.getContextPath()%>/06/zipcodeSearchForm.jsp';
		//location.href = '주소';   //브라우저의 히스토리(요청스택)에 해당 요청주소가 저장.(history back|forward)
		//location.replace('주소'); //브라우저 히스토리(요청스택)에 해당 요청 주소를 저장하지 않음.
		var options = 'copyhistory=no,width=380px,heigth=400px,status=no,resizable=no,scrollbar=no';
		window.open(url,'우편번호검색',options);	
		
		
		
	}	
	
	
</script>
</head>
<style>
.fieldName {
	text-align: center;
	background-color: #f4f4f4;
}

.tLine {
	background-color: #d2d2d2;
	height: 1px;
}

.btnGroup {
	text-align: right;
}

td {
	text-align: left;
}
</style>
<body>
	<form name="memberForm" method="post">

		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td class="tLine" colspan="2"></td>
			</tr>
			<tr>
				<td rowspan="13" class="pic" colspan="2"
					style="vertical-align: bottom; width: 150px; text-align: center;">
					<img src="${pageContext.request.contextPath }/image/btn_pic.gif"
					alt="사진올리기" class="btn" title="인적사항에 올릴 증명	을 검색합니다."
					style="cursor: pointer;" /><br />
					<div style="width: 100%" align="center">size : 235x315 이하</div>
				</td>
			</tr>
			<tr>
				<td class="tLine" colspan="2"></td>
			</tr>
			<tr>
				<td class="fieldName" width="100px" height="25">성 명</td>
				<td><input type="text" name="mem_name"
					value="<%=memberInfo.getMem_name()%>" disabled="disabled" /></td>
			</tr>
			<tr>
				<td class="tLine" colspan="2"></td>
			</tr>
			<tr>
				<td class="fieldName" width="100px" height="25">주민등록번호</td>
				<td><input type="text" name="mem_regno1" size="6"
					value="<%=memberInfo.getMem_regno1()%>" disabled="disabled" /> <input
					type="text" name="mem_regno2" size="7"
					value="<%=memberInfo.getMem_regno2()%>" disabled="disabled" /></td>
			</tr>
			<tr>
				<td class="tLine" colspan="2"></td>
			</tr>

			<tr>
				<td class="fieldName" width="100px" height="25">생년월일</td>
				<td><input type="hidden" name="mem_bir" /> <input type="text"
					name="mem_bir1" size="4" value="<%=year%>" disabled="disabled" />년
					<input type="text" name="mem_bir2" size="2" value="<%=month%>"
					disabled="disabled" />월 <input type="text" name="mem_bir3" size="2"
					value="<%=day%>" disabled="disabled" />일</td>
			</tr>
			<tr>
				<td class="tLine" colspan="2"></td>
			</tr>

			<tr>
				<td class="fieldName" width="100px" height="25">아이디</td>
				<td><input type="text" name="mem_id"
					value="<%=memberInfo.getMem_id()%>" disabled="disabled"></td>
			</tr>
			<tr>
				<td class="tLine" colspan="2"></td>
			</tr>

			<tr>
				<td class="fieldName" width="100px" height="25">비밀번호</td>
				<td><input type="text" name="mem_pass"
					value="<%=memberInfo.getMem_pass()%>" /> 8 ~ 20 자리 영문자 및 숫자 사용</td>
			</tr>
			<tr>
				<td class="tLine" colspan="2"></td>
			</tr>

			<tr>
				<td class="fieldName" width="100px" height="25">비밀번호확인</td>
				<td><input type="text" name="mem_pass_confirm"
					value="<%=memberInfo.getMem_pass()%>" /> 8 ~ 20 자리 영문자 및 숫자 사용</td>
			</tr>
			<tr>
				<td class="tLine" colspan="2"></td>
			</tr>
		</table>
		<table width="100%" border="0" cellpadding="0" cellspacing="0"
			style="margin-top: 10px;">
			<tr>
				<td class="fieldName" width="100px" height="25">전화번호</td>
				<td>
					<div>
						<input type="hidden" name="mem_hometel" /> 
						<select	name="mem_hometel1">
							<option value="02">02</option>
							<option value="031">031</option>
							<option value="032">032</option>
							<option value="033">033</option>
							<option value="041">041</option>
							<option value="042">042</option>
							<option value="043">043</option>
							<option value="051">051</option>
							<option value="052">052</option>
							<option value="053">053</option>
							<option value="061">061</option>
							<option value="062">062</option>
							<option value="063">063</option>
							<option value="064">064</option>
							<option value="070">070</option>
						</select>				 - 
			<input type="text" name="mem_hometel2" size="4"	value="<%=htel1%>" /> - 
			<input type="text" name="mem_hometel3"	size="4" value="<%=htel2%>" />
					</div>
				</td>
			</tr>
			<tr>
				<td class="tLine" colspan="2"></td>
			</tr>

			<tr>
				<td class="fieldName" width="100px" height="25">핸드폰</td>
				<td><input type="hidden" name="mem_hp" /> 
				<select	name="mem_hp1">
						<option value="010">010</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="019">019</option>
				</select> - 
				<input type="text" name="mem_hp2" size="4" value="<%=hp1%>" />	- 
				<input type="text" name="mem_hp3" size="4" value="<%=hp2%>" />
				</td>
			</tr>
			<tr>
				<td class="tLine" colspan="2"></td>
			</tr>

			<tr>
				<td class="fieldName" width="100px" height="25">이메일</td>
				<td><input type="hidden" name="mem_mail" />
				 <input type="text"	name="mem_mail1" value="<%=mail_id%>" /> @ 
				 <select name="mem_mail2">
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="lycos.co.kr">lycos.co.kr</option>
						<option value="pretty.net">pretty.net</option>
						<option value = "orgio.net">orgio.net</option>
						<option value = "unitel.co.kr">unitel.co.kr</option>
				</select></td>
			</tr>
			<tr>
				<td class="tLine" colspan="2"></td>
			</tr>

			<tr>
				<td class="fieldName" width="100px" height="25">주소</td>
				<td><input type="hidden" name="mem_zip" /> 
				<input type="text"	name="mem_zip1" id="mem_zip1" size="3" value="<%=zip1%>" /> - 
				<input	type="text" name="mem_zip2" id="mem_zip2" size="3"	value="<%=zip2%>" />
					<button	class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" type="button" onclick="zipcodePopup();">우편번호검색</button>
					<br> 
					<input type="text" name="mem_add1" id="mem_add1" value="<%=memberInfo.getMem_add1()%>" /> 
					<input type="text" name="mem_add2" id="mem_add2" value="<%=memberInfo.getMem_add1()%>" /></td>
			</tr>
			<tr>
				<td class="tLine" colspan="2"></td>
			</tr>
			<tr>
				<td class="fieldName" width="100px" height="25">직 업</td>
				<td><input type="text" name="mem_job"
					value="<%=memberInfo.getMem_job()%>" /></td>
			</tr>
			<tr>
				<td class="tLine" colspan="2"></td>
			</tr>
			<tr>
				<td class="fieldName" width="100px" height="25">취 미</td>
				<td><input type="text" name="mem_like"
					value="<%=memberInfo.getMem_like()%>" /></td>
			</tr>
			<tr>
				<td class="tLine" colspan="2"></td>
			</tr>

			<tr>
				<td colspan="2" height="20"></td>
			</tr>

			<tr>
				<td class="btnGroup" colspan="2">
					<button	class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored"	id="btn1" type="submit">수정하기</button>
					<button	class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored"	id="btn2" type="reset">취소</button>
					<button	class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored"	id="btn3" type="button">삭제</button>
					<button	class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored"	id="btn4" type="button">목록</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>








