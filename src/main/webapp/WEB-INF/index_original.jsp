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
 
<%= session.getAttribute("id")%>�� �ȳ��ϼ���. 
<a href=logout.jsp>�α׾ƿ�</a> <a href=game.jsp>���ӽ���</a>
 
 
 
<%
} else {
%>
 
<form action="loginaction.jsp" >
���̵� : <input type="text" name="myid"/>
��� : <input type="password" name="mypw"/>
<input type="submit" value="�α���" />
<a href="join.jsp">ȸ������</a>
 
 
 
 
<%
}
%>
 
<h1>�̻��� ������</h1>
 
<table border=1>
<tr>
<td>��ȣ</td>
<td width=200>�̸�</td>
<td width=120>����</td>
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
<td><%=rs.getInt("win") %>��<%=rs.getInt("lose") %>��(%)</td>
</tr>
<%
}
 
}catch(Exception e) {
 
}
 
%>
</table>
</body>
</html>