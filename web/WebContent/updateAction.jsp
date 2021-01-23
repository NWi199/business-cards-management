<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="staff.StaffDAO"%>
<%@ page import="staff.Staff"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="staff" class="staff.Staff" scope="page" />
<jsp:setProperty name="staff" property="*" />
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>SPEAKER</title>
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
	staff = new StaffDAO().getBbs(idstaff);
			if (request.getParameter("staffname") == null || request.getParameter("cellphone") == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				StaffDAO staffDAO = new StaffDAO(); //인스턴스생성
				int result = staffDAO.update(idstaff, request.getParameter("staffname"), request.getParameter("cellphone"), 
						request.getParameter("email"), request.getParameter("position"), request.getParameter("department"), 
						request.getParameter("companyname"), request.getParameter("phone"), request.getParameter("fax"), 
						request.getParameter("poscalcode"), request.getParameter("address"), request.getParameter("industry"), 
						request.getParameter("stock"));
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글수정에 실패했습니다')");
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