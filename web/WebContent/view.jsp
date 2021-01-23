<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="staff.Staff"%>
<%@ page import="staff.StaffDAO"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width" initial-scale="1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css">
	<title>명함 관리 사이트</title>
</head>
<body>
	<%
	int idstaff = 0;
	if (request.getParameter("idstaff") != null) {
		idstaff = Integer.parseInt(request.getParameter("idstaff"));
	}
	if (idstaff == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글 입니다.')");
		script.println("location.href = 'select.jsp'");
		script.println("</script>");
	}
	
		Staff staff = new StaffDAO().getBbs(idstaff);
	%>

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
			    <li><a href="insert.jsp">입력</a></li>
			    <li class="active"><a href="select.jsp">확인</a></li>
			</ul>
		</div>
	</nav>
	
	<!-- 게시판 -->
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">명함</th>
					</tr>
				</thead>
				<tbody>
				
					<tr>
						<td>저장일자</td>	
						<td colspan="2"><%= staff.getDate()%></td>
					</tr>
					<tr>
						<td>이름</td>
						<td colspan="2"><%= staff.getStaffname()%></td>
					</tr>
					<tr>
						<td>휴대전화</td>	
						<td colspan="2"><%= staff.getCellphone()%></td>
					</tr>
					<tr>
						<td>이메일</td>	
						<td colspan="2"><%= staff.getEmail()%></td>
					</tr>
					<tr>
						<td>직책</td>	
						<td colspan="2"><%= staff.getPosition()%></td>
					</tr>
					<tr>
						<td>부서</td>	
						<td colspan="2"><%= staff.getDepartment()%></td>
					</tr>
					<tr>
						<td>회사명</td>	
						<td colspan="2"><%= staff.getCompanyname()%></td>
					</tr>
					<tr>
						<td>회사전화번호</td>	
						<td colspan="2"><%= staff.getPhone()%></td>
					</tr>
					<tr>
						<td>회사팩스번호</td>	
						<td colspan="2"><%= staff.getFax()%></td>
					</tr>
					<tr>
						<td>회사우편번호</td>	
						<td colspan="2"><%= staff.getPoscalcode()%></td>
					</tr>
					<tr>
						<td>회사주소</td>	
						<td colspan="2"><%= staff.getAddress()%></td>
					</tr>
					<tr>
						<td>업종</td>	
						<td colspan="2"><%= staff.getIndustry()%></td>
					</tr>
					<tr>
						<td>주식여부</td>	
						<td colspan="2"><%= staff.getStock()%></td>
					</tr>
					
				</tbody>
			</table>	
			<a href = "select.jsp" class="btn btn-primary">목록</a>
			<a href = "update.jsp?idstaff=<%= idstaff %>" class="btn btn-primary"> 수정 </a>
			<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?idstaff=<%=idstaff %>" class="btn btn-primary"> 삭제 </a>	
			
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>