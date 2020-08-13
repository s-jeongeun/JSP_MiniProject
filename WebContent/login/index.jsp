<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style type="text/css">
	body {
	    font-family: sans-serif;
	    padding: 0;
	    margin: 0;
	}
	
	.form-wrapper {
	    width: 320px;
	    height: 500px;
	    border-radius: 4px;
	    background: #2F366D;
	    color: #FDF3F8;
	    box-shadow: 0px 1px 10px 3px rgba(145, 125, 160, 1);
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    -webkit-transform: translate(-50%, -50%);
	    transform: translate(-50%, -50%);
	    overflow: hidden;
	}
	
	.form-wrapper img {
	    height: 100%;
	    position: absolute;
	    top: 0;
	    left: -50%;
	    opacity: .3;
	    -webkit-filter: blur(3px);
	    filter: blur(3px);
	}
	
	.form-wrapper .content-wrapper {
	    position: relative;
	    opacity: 1;
	    width: 320px;
	    height: 500px;
	    display: -webkit-box;
	    display: -webkit-flex;
	    display: -ms-flexbox;
	    display: flex;
	    -webkit-flex-flow: column;
	    -ms-flex-flow: column;
	    flex-flow: column;
	    -webkit-box-pack: center;
	    -webkit-justify-content: center;
	    -ms-flex-pack: center;
	    justify-content: center;
	    -webkit-box-align: center;
	    -webkit-align-items: center;
	    -ms-flex-align: center;
	    align-items: center;
	}
	
	.form-login {
	    margin: 4rem auto;
	}
	
	.form-login input {
	    margin: 5px auto;
	    display: block;
	    border-radius: 4px;
	    background: none;
	    color: rgba(253, 243, 248, 1);
	    border: 2px solid rgba(85, 112, 172, .8);
	    padding: 10px;
	    width: 200px;
	    font-weight: bolder;
	    -webkit-transition: all .3s ease;
	    transition: all .3s ease;
	}
	
	.form-login button {
	    width: 100%;
	    margin-top: 10px;
	    padding: 10px;
	    display: block;
	    font-weight: bolder;
	    color: #FDF3F8;
	    background: #ec6838;
	    border: none;
	    border-radius: 4px;
	    -webkit-transition: all .3s ease;
	    transition: all .3s ease;
	}
	
	.form-login input:focus {
	    outline: none;
	    color: rgba(253, 243, 248, 1);
	    background: rgba(85, 112, 172, .8);
	    border-width: 2px;
	    border-style: solid;
	    border-color: rgba(85, 112, 172, .8);
	}
	
	.form-login input:hover {
	    color: rgba(253, 243, 248, 1);
	    background: rgba(85, 112, 172, .8);
	    border-width: 2px;
	    border-style: solid;
	    border-color: rgba(85, 112, 172, .8);
	}
	
	.form-login button:hover {
	    cursor: pointer;
	    box-shadow: 0px 1px 10px 1px rgba(236, 104, 56, .6);
	}
	
	.form-wrapper .content-wrapper p {
	    font-size: .7rem;
	    color: rgba(223, 214, 217, .6);
	}
	
	.form-wrapper .content-wrapper a {
	    color: #FDF3F8;
	    text-decoration: none;
	}
	
	#wrapper-signup {
	    opacity: 0;
	    pointer-events: none;
	}
	
	#wrapper-signup:target {
	    display: block;
	    opacity: 1;
	    pointer-events: all;
	}
	
	#wrapper-signup:target #wrapper-login,
	#wrapper-signin:target #wrapper-signup {
	    opacity: 0;
	    pointer-events: none;
	}
</style>
</head>
<body>
	<div class="form-wrapper" id="wrapper-login">
		<img src='https://cdn.pixabay.com/photo/2020/06/30/11/11/landscape-5356009_960_720.jpg' alt='bg1' />
		<div class="content-wrapper" id="content-signin">
			<h1>로그인</h1>
			<form action="/miniProject/login.do" class="form-login">
				<input type="text" name="u_id" placeholder="ID" />
				<input type="password" name="pw" placeholder="Password" />
				<input type="submit" value="LOGIN" />
			</form>
			<p>계정이 없으신가요? <a href="#wrapper-signup">회원가입</a></p>
		</div>
	</div>
	<div class="form-wrapper" id="wrapper-signup">
		<img src='https://cdn.pixabay.com/photo/2020/06/30/11/11/landscape-5356009_960_720.jpg' alt='bg2' />
		<div class="content-wrapper" id="content-signin">
			<h1>회원가입</h1>
			<form action="/miniProject/signUp.do" class="form-login">
				<input type="text" name="u_id" placeholder="ID" />
				<input type="password" name="pw" placeholder="Password" />
				<input type="submit" value="회원가입" />
			</form>
			<p>이미 계정이 있으신가요? <a href="#wrapper-login">로그인</a></p>
		</div>
	</div>
</body>
</html>