<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">
	function checkForm() {
		//아이디 유효성 검사 (영문소문자, 숫자만 허용)
       for (var i = 0; i < document.newMember.myid.value.length; i++) {
            ch = document.newMember.myid.value.charAt(i)
            if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') && (ch >= 'A' && ch <= 'Z')) {
			    var count = 0;
            	count ++;
                document.newMember.myid.focus();
                document.newMember.myid.select();
			    if (count > 0) {
			      	alert("아이디는 영문 대소문자, 숫자만 입력가능합니다.")
			    }
                return false;
            }
        }
		if (!document.newMember.myid.value) {
			alert("아이디를 입력하세요.");
			return false;
		}
		if (!document.newMember.mypw.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		if (document.newMember.mypw.value != document.newMember.mypw_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
		
		if (document.newMember.idDuplication.value != "idCheck") {
			alert("아이디 중복검사를 해주세요");
			return false;
		}
	}
	
	function inputIdChk(){
        document.newMember.idDuplication.value = "idUncheck";
    }
	
	function checkId() {
		
		if (!document.newMember.myid.value) {
			alert("아이디를 입력하세요.");
			return false;
		}
		
		window.name="IDCheckForm";
		window.open("./checkmember.jsp?myid="+ document.newMember.myid.value, "IDCheck", "width=300, height=160, resizable =no, scrollbars=no");
	}
	
</script>

<title>회원가입</title>
</head>
<body>

<div >
	<form name = "newMember" action="joinaction.jsp" method="post" onsubmit="return checkForm()">
		<div >
			<label>아이디</label>				
				<div>
				<table>
					<tr> 
					<td><input name="myid" type="text" placeholder="아이디를 입력하세요" onkeydown="inputIdChk()" ></td>			
					<td><input type="button"   onclick="checkId()" value="중복체크"></td>
					<td><input type="hidden"   name="idDuplication" value="idUncheck"></td>
					</tr>
				</table>					
				</div>
			</div>
			<div>
				<label>비밀번호</label>
				<div>
					<input name="mypw" type="text"  placeholder="비밀번호를 입력하세요" >
				</div>
			</div>
			<div>
				<label>비밀번호 확인</label>
				<div>
					<input name="mypw_confirm" type="text"  placeholder="비밀번호를 다시 입력하세요" >
				</div>
			</div>
			<div>
				<div>
					<input type="submit" value="회원가입" />
				</div>
			</div>

</body>
</html>