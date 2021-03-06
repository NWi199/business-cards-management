<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>명함 관리 사이트</title>
</head>
<body>
<!-- 네비게이션  -->
	<nav class="navbar navbar-default">
  		<div class="navbar-header">
   			<button type="button" class="navbar-toggle collapsed" 
   				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
    			aria-expaned="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
    		</button>
    		<a class="navbar-brand" href="main.jsp">명함 관리</a>
  		</div>
  		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
   			<ul class="nav navbar-nav">
			    <li><a href="main.jsp">메인</a></li>
			    <li class="active"><a href="insert.jsp">입력</a></li>
			    <li><a href="select.jsp">확인</a></li>
			</ul>
		</div>
	</nav>
	<!-- 로긴폼 -->
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="insertAction.jsp">
					<h3 style="text-align: center;">명함 정보 입력</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름" name="staffname" maxlength="20">
					</div>
					<div class="form-group">
						<input type="number" class="form-control" placeholder="휴대전화" name="cellphone" maxlength="20">
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일" name="email" maxlength="50">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="직책" name="position" maxlength="30">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="부서" name="department" maxlength="50">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="회사명" name="companyname" maxlength="50">
					</div>
					<div class="form-group">
						<input type="number" class="form-control" placeholder="회사전화번호" name="phone" maxlength="50">
					</div>
					<div class="form-group">
						<input type="number" class="form-control" placeholder="회사팩스번호" name="fax" maxlength="50">
					</div>
					<div class="form-group">
						<input type="number" class="form-control" placeholder="회사우편번호" name="poscalcode" maxlength="50">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="회사주소" name="address" maxlength="50">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="업종" name="industry" maxlength="50">
					</div>
					<div class="form-group" style="text-align: center;"> 주식 여부
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary"> <input type = "radio" name="stock" autocomplete="off" value="예" > 예</label>
							<label class="btn btn-primary"> <input type = "radio" name="stock" autocomplete="off" value="아니오" > 아니오</label>
						</div>
					</div> 
					<input type="submit" class="btn btn-primary form-control" value="저장">
				</form>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>