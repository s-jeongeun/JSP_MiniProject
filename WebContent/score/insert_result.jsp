<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<c:if test="${result gt 0 }">
	<script type="text/javascript">
		alert("감상평 작성 완료!");
		location.href = "/miniProject/board.do";
	</script>
</c:if>

<c:if test="${result eq 0 }">
	<script type="text/javascript">
		alert("감상평 작성이 실패했습니다.");
		location.href = "/miniProject/board.do";
	</script>
</c:if>
