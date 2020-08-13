<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<c:if test="${result gt 0 }">
	<script type="text/javascript">
		alert("회원가입이 성공했습니다. 로그인해주세요.");
		location.href="login/index.jsp";
	</script>
</c:if>

<c:if test="${result eq 0 }">
	<script type="text/javascript">
		alert("회원가입이 실패했습니다. 다시 시도해주세요.");
		location.href="/miniProject/signUp.jsp";
	</script>
</c:if>
