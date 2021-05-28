<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*" %>
<%
 
String gamecount = request.getParameter("gamecount");
String result = request.getParameter("result");
String who1 = request.getParameter("who1");
String who2 = request.getParameter("who2");
int temp;
 
Connection conn = null;
PreparedStatement pstmt = null;
 
 
try {
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/worldcup","root","1234");
String query1 = "update member set gamecount=gamecount+1 where id='"+session.getAttribute("id")+"'";
pstmt = conn.prepareStatement(query1);
pstmt.executeUpdate();
String query2, query3, query4;
 
if(result.equals(who1)) {
query2= "update person set win=win+1 where num="+who1;
query3= "update person set lose=lose+1 where num="+who2;
temp=Integer.parseInt(who1);
}else {
query2= "update person set win=win+1 where num="+who2;
query3= "update person set lose=lose+1 where num="+who1;
temp=Integer.parseInt(who2);
}
 
pstmt = conn.prepareStatement(query2);
pstmt.executeUpdate();
 
pstmt = conn.prepareStatement(query3);
pstmt.executeUpdate();
 
query4 = "update member set g"+String.valueOf(Integer.parseInt(gamecount)+1)+"="+String.valueOf(temp)+ " where id='"+session.getAttribute("id")+"'";
pstmt = conn.prepareStatement(query4);
pstmt.executeUpdate();
 
response.sendRedirect("game.jsp");
}catch(Exception e) {
e.printStackTrace();
}
%>