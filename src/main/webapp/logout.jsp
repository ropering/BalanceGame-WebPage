<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
if(session!=null) session.invalidate();
response.sendRedirect("index.jsp");
System.out.println("index.jsp 이동");
%>