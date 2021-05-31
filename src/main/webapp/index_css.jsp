<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
		<meta name="description" content="" />
		<meta name="author" content="" />
		<!-- Favicon-->
		<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
		<!-- Bootstrap Icons-->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
		<!-- Google fonts-->
		<link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
		<link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
		<!-- SimpleLightbox plugin CSS-->
		<link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
		<!-- Core theme CSS (includes Bootstrap)-->
		<link href="css/styles.css" rel="stylesheet" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>밸런스 게임</title>
	</head>

<body id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
	    <%
		if(session.getAttribute("id")!=null) {
		%>
		<%= session.getAttribute("id")%><a class="navbar-brand" >님 안녕하세요</a>
	    <div class="container px-4 px-lg-5">
	    	<!-- 로그인 상태 -->
			<a href=logout.jsp>로그아웃</a> <a href=game.jsp>게임시작</a>
			<!-- 비 로그인 상태 -->
			<%
			} else {
			%>
				<div>
                	<a href="javascript:void(window.open('./login.jsp', '_blank','top=230,left=550,width=380,height=300,resizable=1,scrollbars=no'))">로그인</a>
                 		        
		        </div>
				<%
			}
			%>
	        
	    </div>
	</nav>
	
	
	
	<!-- index.jsp에 접속하면 로그인한 아이디의 DB에 있는 gamecount값이 초기화됨 -->
	
	<%String id = (String) session.getAttribute("id");%>

	<sql:setDataSource var="dataSource"
	   url="jdbc:mysql://localhost:3306/worldcup"
	   driver="com.mysql.jdbc.Driver" user="root" password="1234" />
	   
	<sql:update dataSource="${dataSource}" var="resultSet">
	   UPDATE MEMBER SET GAMECOUNT=? WHERE ID=?;
	   <sql:param value="0" />
	   <sql:param value="<%=id%>" />
	   
	</sql:update>
	
	
	
	
	<!-- Masthead-->
	<header class="masthead">
<h1>밸런스 게임</h1>
 
<table border=1>
<tr>
<td>그림</td>
<td width=300>선택지</td>
<td width=100>전적</td>
</tr>
<%
Connection conn = null;
Statement stmt = null;
 
try {
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/worldcup","root","1234");
stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("select num, name, op_yes, op_no from question order by num asc");
 
while(rs.next()) {
%>
<tr>
<td><img src=images/<%=rs.getInt("num")%>.jpg width="200" height="200"></td>
<td><%=rs.getString("name") %></td>
<td><%=rs.getInt("op_yes") %>승<%=rs.getInt("op_no") %>패(%)</td>
</tr>
<%
}
 
}catch(Exception e) {
  System.out.println("오류 발생 " + e);
}
 
%>
</table>
	    <div class="container px-4 px-lg-5 h-100">
	        <div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">
	            <div class="col-lg-8 align-self-end">
	                <h1 class="text-white font-weight-bold">xxx 월드컵</h1>
	                <hr class="divider" />
	            </div>
	            <div class="col-lg-8 align-self-baseline">
	                <p class="text-white-75 mb-5">건드여야 할 부분</p>
	                <a class="btn btn-primary btn-xl" href="game.jsp">게임 시작</a>
	            </div>
	        </div>
	    </div>
	</header>
	
	<!-- Footer-->
	<footer class="bg-light py-5">
	    <div class="container px-4 px-lg-5"><div class="small text-center text-muted">Copyright &copy; 2021 - 임범수 김나경 전우민 오명균</div></div>
	</footer>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
	<!-- SimpleLightbox plugin JS-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
	<!-- Core theme JS-->
	    <script src="js/scripts.js"></script>
	    
	</body>

</html>