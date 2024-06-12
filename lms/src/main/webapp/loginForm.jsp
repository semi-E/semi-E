<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="css/style.css">

    <title>로그인</title>
  </head>
  <body>
  

  <div class="d-lg-flex half">
    <div class="bg order-1 order-md-2" style="background-image: url('/lms/upload/bg_2.jpg')"></div>
    <div class="contents order-2 order-md-1">

      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-7">
            <h3>Login to <strong>inno technology uni</strong></h3>
            <p class="mb-4">이노 기술대에 오신 것을 환영합니다.</p>
            <form action="/lms/loginAction.jsp" method="post">
              <div class="form-group first">
                <label for="username">ID</label>
                <input type="text" class="form-control" placeholder="아이디를 입력하세요" id="id" name="id" required>
              </div>
              <div class="form-group last mb-1">
                <label for="password">Password</label>
                <input type="password" class="form-control" placeholder="비밀번호를 입력하세요" id="pw" name="pw" required>
              </div>
              
              <div class="d-flex mb-3 align-items-center">
                <span class="ml-auto"><a href="/lms/findPwForm.jsp" class="forgot-pass">Forgot Password</a></span> 
              </div>
              
              

              <input type="submit" value="로그인" class="btn btn-block btn-primary">
				<h5>관리자ID:120240001</h5>
				<h5>교수ID:220240101</h5>
				<h5>학생ID:20240101</h5>
				<h5>공통PW:1234</h5>
            </form>
          </div>
        </div>
      </div>
    </div>

    
  </div>
    
    

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>