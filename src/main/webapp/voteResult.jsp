<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<head></head>

<body style=background-color:#FBF9AD>

<h1 align= center>밸런스 게임</h1>

<table border=1 align= center style=background-color:#FFFFFF color:white >
	<tr align= center>
		<td>그림</td>
		<td width=300>선택지</td>
		<td width=100>전적</td>
		<td>그림</td>
		<td width=300>선택지</td>
		<td width=100>전적</td>
	</tr>
	<%
			Connection conn = null;
			Statement stmt = null;

			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/worldcup", "root", "1234");
				stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("select num, opt, total, yes, per from question order by num asc");
				
				while (rs.next()) {
					int per = rs.getInt("per");
					
					if(rs.getInt("num") % 2 == 1) { %>
						<tr align= center>
							<td><img src=q_images/<%=rs.getInt("num")%>.jpg width="200"
								height="200"></td>
							<td><%=rs.getString("opt")%></td>
							<td><%=rs.getInt("per")%>% <c:set var="per" value="<%=per%>" />
								<c:if test="${per==Null}">
									<c:out value="0%" />
								</c:if> <br>(<%=rs.getInt("yes")%>/<%=rs.getInt("total")%>)</td>
						
					<%} else if(rs.getInt("num") % 2 == 0) { %>
							<td><img src=q_images/<%=rs.getInt("num")%>.jpg width="200"
								height="200"></td>
							<td><%=rs.getString("opt")%></td>
							<td><%=rs.getInt("per")%>% <c:set var="per" value="<%=per%>" />
								<c:if test="${per==Null}">
									<c:out value="0%" />
								</c:if> <br>(<%=rs.getInt("yes")%>/<%=rs.getInt("total")%>)</td>
						</tr>
					<%}
				}
 
			} catch(Exception e) {
				System.out.println(e);
			}
			 
%>
<div align= center>
	<a href="game.jsp" style="font-size:23px">게임 시작</a>
	&nbsp;
	<a href="index.jsp" style="font-size:23px">메인 화면</a>
</div>
</table>

<!-- index.jsp에 접속하면 로그인한 아이디의 DB에 있는 gamecount값이 초기화됨 -->
<%
	String id = (String) session.getAttribute("id");
%>
<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/worldcup"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />

<sql:update dataSource="${dataSource}" var="resultSet">
	UPDATE MEMBER SET GAMECOUNT=? WHERE ID=?;
<sql:param value="0" />
<sql:param value="<%=id%>" />
</sql:update>

</body>


