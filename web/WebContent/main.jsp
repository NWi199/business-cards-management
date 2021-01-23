<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> 
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
			    <li class="active"><a href="main.jsp">메인</a></li>
			    <li><a href="insert.jsp">입력</a></li>
			    <li><a href="select.jsp">확인</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1> 명함 관리 사이트 </h1>
				<p> 컴퓨터소프트웨어공학과 20174058 조유진 </p>
			</div>
		</div>
	</div>
 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
 <script src="js/bootstrap.js"></script>
</body>
</html>