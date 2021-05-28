<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
String id = request.getParameter("myid");
String pw = request.getParameter("mypw");

System.out.println(pw);

Connection conn = null;
ResultSet rs = null;
PreparedStatement pstmt = null;
%>


<sql:setDataSource var="dataSource"
   url= "jdbc:mysql://localhost:3306/worldcup"
   driver="com.mysql.jdbc.Driver" user="root" password="1234" />
  
  <sql:query dataSource="${dataSource}" var="resultSet">
    SELECT * FROM MEMBER WHERE id=? and pw=? 
   <sql:param value="<%=id%>"/>
   <sql:param value="<%=pw%>"/>
</sql:query>

<c:forEach var="row" items="${resultSet.rows}">   
   <c:set var="sessionId" value="${row.id}" scope="session"  />
   <c:set var="sessionName" value="${row.name}" scope="session"  />
</c:forEach>

<c:redirect url="index.jsp" /> 






<!-- 
try {
	/*
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/worldcup", "root", "1234");
	String sql = "select count(*) as cnt from member where id=? and pw=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pw);
	rs = pstmt.executeQuery();
	rs.next();
	 
	if (rs.getString("cnt").equals("1")) {
	session.setAttribute("id", id);
	response.sendRedirect("index.jsp");
	} else {
		out.println("<script> alert('가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.'); history.back(); </script>");
	}
 
} catch (Exception e) {
	System.out.println("db 저장 부분에서 오류가 발생하였습니다");
	response.sendRedirect("index.jsp");
}
%> -->