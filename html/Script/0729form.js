/**
 * 
 */

function regCheck() {

	// 입력한 값 가져온다.

	// document.getElementsByName('name')[0];

	namevalue = f.name.value;

	if (namevalue.trim().length == 0) {
		alert("이름을 입력하세요");
		f.name.value = "";
		f.name.focus();
		return false;
	}
	if (namevalue.trim().length < 2 || namevalue.trim().length > 5) {
		alert("이름은 2~5자 사이입니다.");
		f.name.focus();
		return false;
	}
	//정규식
	namereg = /^[가-힣]{2,5}||[a-zA-Z]{8,15}$/;
	if(!(namereg.test(namevalue))){
		alert("이름형식오류입니다.");
		return false;
	}

	idvalue = f.id.value;

	if (idvalue.trim().length == 0) {
		alert("아이디를입력하세요");
		f.id.value = "";
		f.id.focus();
		return false;
	}
	if (idvalue.trim().length < 12 && idvalue.trim().length > 8) {
		alert("아이디는 8~12글자입니다.");
		f.id.focus();
		return false;
	}
	
	idreg = /^[a-z][a-zA-Z0-9]{7,11}/;
	if(!(idreg.test(idvalue))){
		alert("아이디형식 오류입니다.");
		return false;
	}

	pasvalue = f.pass.value;

	if (pasvalue.trim().length == 0) {
		alert("비밀번호를 입력하세요");
		f.pass.value = "";
		f.pass.focus();
		return false;
	}
	if (pasvalue.trim().length < 12 && pasvalue.trim().length > 8) {
		alert("비밀번호는 8~12글자입니다.");
		f.pass.focus();
		return false;
	}
	
	pasreg = /^[a-zA-Z0-9!@#$%^&*]{8,12}$/;
	if(!(pasreg.test(pasvalue))){
		alert("비밀번호 형식 오류입니다.");
		return false;
	}
	
	
	
	emailvalue = f.email.value;

	if (emailvalue.trim().length == 0) {
		alert("이메일을 입력해");
		f.email.value = "";
		f.email.focus();
		return false;
	}
	
	
	emailreg = /^[0-9a-zA-Z]+@[0-9A-Za-z]+(\.[0-9A-Za-z]+){1,2}$/;
	if(!(emailreg.test(emailvalue))){
		alert("이메일 형식 오류 입니다");ㅣ
	}

	telvalue = f.tel.value;
	if (telvalue.trim().length == 0) {
		alert("전화번호입력해")
		f.tel.value = "";
		f.tel.focus();
		return false;
	}
	
	telreg = /^\d{3}-\d{3,4}-\d{4}$/;
	if(!(telreg.test(telvalue))){
		alert("전화번호 형식 오류입니다.");
		return false;
	}
	
	// alert("입력완료");

	return true;

}
