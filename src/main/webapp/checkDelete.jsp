<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<html>
<head>
<script type="text/javascript">
	function goDelete() {
		opener.location.href="deleteMember.jsp";
		window.close();
	}
</script>
<title>회원탈퇴 재확인</title>
</head>
<body>
	<form method="post" onsubmit="return goDelete()">
		<table align="center">
			<tr>
				<td align="center">
					<h5>정말 탈퇴하시겠습니까?</h5>
				</td>
			</tr>
			<tr>
				<td align="center">
					<input type="button" value="아니오" onclick="window.close()">
					&nbsp;
					<input type="submit" value="예">
				</td>
		</table>
	</form>
</body>
</html>
