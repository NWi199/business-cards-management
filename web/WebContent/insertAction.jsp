<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="staff.StaffDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %> 
<jsp:useBean id="staff" class="staff.Staff" scope="page" />
<jsp:setProperty name="staff" property="*" />
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>명함 관리 사이트</title>
</head>
<body>
	<%
		if (staff.getStaffname() == null || staff.getCellphone() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} 
		else {
				StaffDAO staffDAO = new StaffDAO(); //인스턴스생성
				int result_staff = staffDAO.insert(staff);
				if(result_staff == -1){ // 아이디가 기본키기. 중복되면 오류.
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('이미 존재하는 명함 입니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				//가입성공
				else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'select.jsp'");
					script.println("</script>");
				}
			}
	%>
</body>
</html>