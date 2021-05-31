<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String id = request.getParameter("myid");
	String pw = request.getParameter("mypw");

	Connection conn = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/worldcup", "root", "1234");
		String sql = "select count(*) as cnt from member where id=? and pw=BINARY(?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		rs = pstmt.executeQuery();
		rs.next();

		if (id.equals("")) {
			out.println("<script> alert('아이디를 입력하세요'); history.back(); </script>");
		} else if (pw.equals("")) {
			out.println("<script> alert('비밀번호를 입력하세요'); history.back(); </script>");
		} else if (rs.getString("cnt").equals("1")) {
			session.setAttribute("id", id);
			response.sendRedirect("index.jsp");
		} else {
			out.println("<script> alert('가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.'); history.back(); </script>");
		}

	} catch (Exception e) {

	}
%>
