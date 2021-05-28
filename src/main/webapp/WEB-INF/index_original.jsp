<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
if(session.getAttribute("id")!=null) {
%>
 
<%= session.getAttribute("id")%>님 안녕하세요. 
<a href=logout.jsp>로그아웃</a> <a href=game.jsp>게임시작</a>
 
 
 
<%
} else {
%>
 
<form action="loginaction.jsp" >
아이디 : <input type="text" name="myid"/>
비번 : <input type="password" name="mypw"/>
<input type="submit" value="로그인" />
<a href="join.jsp">회원가입</a>
 
 
 
 
<%
}
%>
 
<h1>이상형 월드컵</h1>
 
<table border=1>
<tr>
<td>번호</td>
<td width=200>이름</td>
<td width=120>전적</td>
</tr>
<%
Connection conn = null;
Statement stmt = null;
 
try {
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/worldcup","root","apmsetup");
stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("select num, name, win, lose from person order by num asc");
 
while(rs.next()) {
%>
<tr>
<td><img src=images/<%=rs.getInt("num")%>.jpg /></a></td>
<td><%=rs.getString("name") %></a></td>
<td><%=rs.getInt("win") %>승<%=rs.getInt("lose") %>패(%)</td>
</tr>
<%
}
 
}catch(Exception e) {
 
}
 
%>
</table>
</body>
</html>