<%@page import="javax.security.auth.callback.ConfirmationCallback"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="staff.StaffDAO"%>
<%@ page import="staff.Staff"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>명함 관리 사이트</title>
<style type="text/css">
		a, a:hover {
			color: #000000;
			text-decoration: none;
		}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	int pageNumber = 1; //기본 페이지 넘버
	//페이지넘버값이 있을때
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
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
			<table class="table table-striped" style="text-align: center;border: 1px solid #dddddd">
				<thead>
					<tr>
						<td style="background-color: #eeeeee; text-align: center;">번호</td>
						<td style="background-color: #eeeeee; text-align: center;">이름</td>
						<td style="background-color: #eeeeee; text-align: center;">휴대전화</td>
						<td style="background-color: #eeeeee; text-align: center;">일자</td>
					</tr>
				</thead>
				<tbody>
					<%
						StaffDAO staffDAO = new StaffDAO();
						ArrayList<Staff> list_s = staffDAO.getList(pageNumber);
						for(int i=0;i<list_s.size();i++) {
					%>
						<tr>
							<td><%=list_s.get(i).getIdstaff() %></td>
							<td><a href="view.jsp?idstaff=<%=list_s.get(i).getIdstaff()%>"><%=list_s.get(i).getStaffname() %></a></td>
							<td><%=list_s.get(i).getCellphone() %></td>
							<td><%=list_s.get(i).getDate() %></td>
					
						</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<%
				if(pageNumber!=1) {
			%>
				<a href="select.jsp?pageNumber=<%=pageNumber - 1 %>" class = "btn btn-success btn-arrow-left">이전</a>			
			<%
				}
			%>
			<%
				if(staffDAO.nextPage(pageNumber)){
			%>
				<a href="select.jsp?pageNumber=<%=pageNumber + 1 %>" class = "btn btn-success btn arrow-left">다음</a>
			<%
				}
			%>
			
	
			<a href="insert.jsp" class="btn btn-primary pull-right">입력</a>



	</div>

</div>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

  
           
</body>
</html>
