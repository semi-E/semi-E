<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학교 로그인 폼</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        display: flex;
        flex-direction: column;
        height: 100vh;
    }
    .header, .footer {
        background-color: #006700;
        color: white;
        text-align: center;
        padding: 10px 0;
        flex-shrink: 0;
    }
    .header {
        height: 80px;
    }
    .footer {
        height: 40px;
    }
    .content {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-grow: 1;
        background: url('/lms/upload/oo.jpg') no-repeat center center;
        background-size: cover;
        position: relative;
    }
    .content::before {
    position: absolute;
    content: "";
    top:0px;
    left:0px;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,0.4);
	}
    .login-form {
        background-color: rgba(255, 255, 255, 0.9);
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        z-index: 100;
        width: 350px;
        text-align: center;
    }
    .login-form h1 {
        margin-bottom: 20px;
        font-size: 24px;
        color: #333;
    }
    .login-form div {
        margin-bottom: 15px;
    }
    .login-form label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }
    .login-form input {
        width: calc(100% - 20px);
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    .login-form button {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
    }
    .login-form button:hover {
        background-color: #0056b3;
    }
    .overlay {
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        background-color: rgba(0, 0, 0, 0.5);
        z-index: 0;
    }
</style>
</head>
<body>
    <div class="header">
    	<h1>구디기술대</h1>
        <img src="/lms/upload/dd.jpg" alt="학교 로고" height="60">
    </div>
    <div class="content">
        <div></div>
        <div class="login-form">
            <h1>구디기술대학교 로그인</h1>
            <form method="post" action="/lms/loginAction.jsp">
                <div>
                    <label for="id">아이디</label>
                    <input type="text" id="id" maxlength="9" required="required" name="id" placeholder="아이디를 입력하세요">
                </div>
                <div>
                    <label for="pw">비밀번호</label>
                    <input type="password" id="pw" maxlength="9" required="required" name="pw" placeholder="비밀번호를 입력하세요">
                </div>
                <button type="submit">로그인</button>
            </form>
            <div>
                <a href="/forgot-password">비밀번호를 잊으셨나요?</a>
            </div>
        </div>
    </div>
    <div class="footer">
        <p>학교 번호 : 010 -2222- 2222</p>
    </div>
</body>
</html>