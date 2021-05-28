<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<%
String id = (String) session.getAttribute("id");
%>
<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/worldcup"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM MEMBER WHERE ID=?
   <sql:param value="<%=id%>" />
</sql:query>



<title>회원 수정</title>
</head>
<body onload="init()">
	<h1 class="display-3">회원 수정</h1>



	<div class="container">
		<form name="newMember" class="form-horizontal"
			action="processUpdateMember.jsp" method="post"
			onsubmit="return checkForm()">
			<div class="form-group  row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input name="pw" type="text" class="form-control"
						placeholder="password" value="<c:out value='${row.pw}'/>">
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">비밀번호확인</label>
				<div class="col-sm-3">
					<input name="password_confirm" type="text" class="form-control"
						placeholder="password_confirm">
				</div>
			</div>

			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="회원수정 ">
					<a href="deleteMember.jsp" class="btn btn-primary">회원탈퇴</a>
				</div>
			</div>
		</form>
	</div>

</body>
</html>
<script type="text/javascript">
	function checkForm() {
		if (!document.newMember.password.value) {
	 		alert("비밀번호를 입력하세요.");
			return false;
		}
		if (document.newMember.pw.value != document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			// 현재 페이지 그대로
			history.forward();
			return false;
		}
	}
</script>