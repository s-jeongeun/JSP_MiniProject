<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<div>
		<form action="/miniProject/signUp.do">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="u_id" /></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="text" name="pw" /></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="회원가입" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>