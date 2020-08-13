<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.content1{
		text-align: center;
	    padding: 14px 16px 22px;
	}
	.thumbnail{
		width: 150px;
		height: 220px;
	}
	.info{
    	margin: 0px 0px 0px 160px;
	}
	.info h1{
		font-size: 25px;
  		font-weight: 700;
	}
	
</style>
</head>
<body>
	<div class="header">
	</div>
	<div class="content1">
	 	<div class="img">
	 		<img src="upload/${ldto.img}" class="thumbnail" />
	 	</div>	
	 	<div class="info">
		 	<h1>${ldto.title }</h1>
		 	<div>
		 		<h1>${ldto.score }</h1>
		 	</div>
		</div>
	</div>

 	<div class="middle2">
 	 	<span>${ldto.u_comment }</span>
 	</div>
</body>
</html>