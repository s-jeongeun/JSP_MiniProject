<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${u_id }님의 영화/드라마 평가</title>
<style type="text/css">
	body{
		width: 100vw;
		height: 100vh;
	}
	.tabmenu{ 
		max-width: 335px;
		height: 48px;
		padding: 0px, 16px;
		margin: 0px;
		position:relative; 
	}
	.tabmenu ul li{
		display: inline-flex;
		width:50%;
		height: 44px;
		float:left;  
		text-align: center;
	}
	.tabmenu label{
		display:block;
		width:100%; 
		height:40px;
		line-height:40px;
		height: 44px;
		padding: 0px 0px 3px;
	}
	.tabmenu input{
		display:none;
	}
	.content{
		display: none; 
		text-align: left; 
		position: absolute;
		top: 120px; 
	}
	.tabmenu input:checked ~ label{
		border-bottom: 3px solid #FF2F6E;
	}
	.tabmenu input:checked ~ .content{
		display: block;
	}
	
	/* 평점 */
	input[type="radio"] {
	  display: none;
	}
	
	label {
	  color: grey;
	}
	
	.clasificacion {
	  direction: rtl;
	  unicode-bidi: bidi-override;
	  text-align: center;
	  font-size: 20px;
	}
	
	label:hover,
	label:hover ~ label {
	  color: orange;
	}
	
	input[type="radio"]:checked ~ label {
	  color: orange;
	}
	
	/* 리스트 */
	.content{
		width: 10%;
	}
	
	/* 썸네일 */
	.thumbnail{
		width: 140px;
		height: 205px;
		border: 1px solid #eae9e8;
	    border-radius: 5px;
	}
	
	.content a:link{
		color: black; 
		text-decoration: none;
	}
	
	.content a:visited{
		color: black; 
		text-decoration: none;
	}

	.list-title{
		font-size: 16px;
	    font-weight: 500;
	    letter-spacing: -0.3px;
	    line-height: 22px;
	    white-space: nowrap;
	}
	
	.list-score{
		color: rgb(255, 161, 54);
	    font-size: 13px;
	    font-weight: 400;
	    letter-spacing: -0.2px;
	    line-height: 18px;
	    white-space: nowrap;
	}
	
</style>
<script type="text/javascript">
	function logout(){
		location.href = "/miniProject/logout.do"
	}
	
	function setThumbnail(event) { 
		var reader = new FileReader(); 
		reader.onload = function(event) { 
			var img = document.createElement("img"); 
			img.setAttribute("src", event.target.result); 
			document.querySelector("div#inimg").appendChild(img); 
		}; 
		reader.readAsDataURL(event.target.files[0]); 
	}

	function insert(f){
		if(f.title.value==""){
			alert("제목을 입력하세요.");
			f.title.focus();
			return;
		}
		if(f.score.value==""){
			alert("평점을 입력하세요.");
			f.score.focus();
			return;
		}
		if(f.comment.value==""){
			alert("감상평을 입력하세요.");
			f.comment.focus();
			return;
		}
		f.action = "/miniProject/insert.do";
		f.submit();
	}
</script>
</head>
<body>
	<!-- 상단 -->
	<div>
		<img>
		<span>
		</span>
		<input type="button" value="로그아웃" onclick="logout()" />
	</div>
	
	<div>
		<form method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td rowspan="2">
						<div id="inimg"></div><br/>
						<input type="file" class="img" name="img" value="이미지 삽입" onchange="setThumbnail(event);" />
					</td>
					<td>
						<input type="text" name="title" placeholder="작품명" />&nbsp;&nbsp;
						<span class="clasificacion">
							<input id="radio1" type="radio" name="score" value="5">
							<label for="radio1">&#9733;</label>
							<input id="radio2" type="radio" name="score" value="4">
							<label for="radio2">&#9733;</label>
							<input id="radio3" type="radio" name="score" value="3">
							<label for="radio3">&#9733;</label>
							<input id="radio4" type="radio" name="score" value="2">
							<label for="radio4">&#9733;</label>
							<input id="radio5" type="radio" name="score" value="1">
							<label for="radio5">&#9733;</label>
				 	   </span>
					</td>
					<td rowspan="2">
						<input type="button" value="업로드" onclick="insert(this.form)" />
						<input type="hidden" name="u_id" value="${u_id }" />
					</td>
				</tr>
				<tr>
					<td><textarea rows="8" cols="70" name="comment" placeholder="감상평"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
	
	<!-- 내용 -->
	<div class="tabmenu">
		<h3>평가한 작품들</h3>	
		<ul>
		    <li id="tab1" class="tabBtn">
				<input type="radio" name="tab" id="tabmenu1" checked/>
				<label for="tabmenu1">전체</label>
				<div class="content">
					<c:choose>
						<c:when test="${not empty list }">	
							<c:forEach var="ldto" items="${list }">
								<c:if test="${ldto.img ne null }">
									<p>
										<a href="/miniProject/view.do?idx=${ldto.idx }"><img src="upload/${ldto.img}" class="thumbnail" /></a>
										<a href="/miniProject/view.do?idx=${ldto.idx }"><span class="list-title">${ldto.title }</span></a><br/>
										<span class="list-score">★${ldto.score }</span>
									</p>
								</c:if>
								<c:if test="${ldto.img eq null }">
									<p>
										<a href="/miniProject/view.do?idx=${ldto.idx }"><img src="https://i.imgur.com/wOjUB7q.png" class="thumbnail" /></a>
										<a href="/miniProject/view.do?idx=${ldto.idx }"><span class="list-title">${ldto.title }</span></a>
										<span class="list-score">★${ldto.score }</span>
									</p>
								</c:if>
							</c:forEach>	
						</c:when>
						<c:otherwise>
							<div>
								게시물이 없습니다.
							</div>
						</c:otherwise>	
					</c:choose>
				</div>
			</li>
			<li id="tab2" class="tabBtn">
				<input type="radio" name="tab" id="tabmenu2">
				<label for="tabmenu2">별점 순</label>
				<div class="content">
					2번 탭 내용
				</div>
			</li>
		</ul>
	</div>
</body>
</html>