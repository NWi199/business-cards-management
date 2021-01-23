<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="staff.StaffDAO"%>
<%@ page import="staff.Staff"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>명함 관리 사이트</title>
</head>
<body>

	<% 
		int idstaff = 0;
		if(request.getParameter("idstaff") != null){
			idstaff = Integer.parseInt(request.getParameter("idstaff"));
		}
		if(idstaff == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다')");
			script.println("location.href='select.jsp'");
			script.println("</script>");
		}else{
			StaffDAO staffDAO = new StaffDAO();
			int result = staffDAO.delete(idstaff);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 삭제에 실패했습니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='select.jsp'");
				script.println("</script>");
			}
		}
	%>

</body>

</html>