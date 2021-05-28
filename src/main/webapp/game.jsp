<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" import="java.sql.*"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
try {
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/worldcup","root","1234");
stmt = conn.createStatement();
rs = stmt.executeQuery("select * from member where id='"+session.getAttribute("id")+"'");
rs.next();
 

%>
 
<%=session.getAttribute("id")%>
님의 선택은?????
<%=rs.getInt("gamecount")+1%>
 
 
 
 
<%
if(rs.getInt("gamecount")==0) {
%>
<form action="voteaction.jsp">
<input type=hidden name=gamecount value=<%=rs.getInt("gamecount")%>>
<input type=hidden name=who1 value=1> 
<input type=hidden name=who2 value=2>
<table>
<tr>
<td><img src=images/1.jpg></td>
<td><img src=images/2.jpg></td>
</tr>
<tr>
<td align="center"><input type="radio" name="result" value="1"></td>
<td align="center"><input type="radio" name="result" value="2"></td>
</tr>
<tr>
<td colspan="2"><center>
<input type="submit" value="투표하기">
</center></td>
</tr>
 
</table>
</form>
 
<%
}else if(rs.getInt("gamecount")<8) {
%>
 
<form action="voteaction.jsp">
<input type=hidden name=gamecount value=<%=rs.getInt("gamecount")%>>
<input type=hidden name=who1 value=<%=rs.getInt("gamecount")*2+1%>>
<input type=hidden name=who2 value=<%=rs.getInt("gamecount")*2+2%>>
<table>
<tr>
<td><img src=images/<%=rs.getInt("gamecount")*2+1%>.jpg></td>
<td><img src=images/<%=rs.getInt("gamecount")*2+2%>.jpg></td>
</tr>
<tr>
<td align="center"><input type="radio" name="result"
value=<%=rs.getInt("gamecount")*2+1%>></td>
<td align="center"><input type="radio" name="result"
value=<%=rs.getInt("gamecount")*2+2%>></td>
</tr>
<tr>
<td colspan="2"><center>
<input type="submit" value="투표하기">
</center></td>
</tr>
 
</table>
</form>

<% 
} else {
   
response.sendRedirect("index.jsp"); 
String id = session.getAttribute("id").toString();
%>

<sql:setDataSource var="dataSource"
   url="jdbc:mysql://localhost:3306/worldcup"
   driver="com.mysql.jdbc.Driver" user="root" password="1234" />
   
<sql:update dataSource="${dataSource}" var="resultSet">
   UPDATE MEMBER SET GAMECOUNT=? WHERE ID=?;
   <sql:param value="0" />
   <sql:param value="<%=id%>" />
   
</sql:update>

<%
}
 
}catch(Exception e) {
 
}
 
%>
</body>

</html>