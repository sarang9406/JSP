<%@page import="com.my.model.dao.MyDao"%>
<%@page import="com.my.model.dto.MyDto"%>
<%@page import = "java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tableofcontent.jsp</title>
</head>
<%
	MyDao dao = new MyDao();
	List<MyDto> list = dao.selectList();
%>
<body>
	<h1>Table Of Contents</h1>
	
	<table border = "1">
		<col width = "50px">
		<col width = "100px">
		<col width = "200px">
		<col width = "200px">
		<tr>
			<th>Number</th>
			<th>Name</th>
			<th>Title</th>
			<th>Date</th>
		</tr>
		<%
		for(int i = 0; i<list.size(); i++){
		%>
		<tr>
			<td><%=list.get(i).getMyno() %></td>			
			<td><%=list.get(i).getMyname() %></td>
			<td>
			<a href = "showone.jsp?myno=<%=list.get(i).getMyno()%>"><%=list.get(i).getMytitle() %></a>
			</td>
			<td><%=list.get(i).getMydate() %></td>	
		</tr>
		<%	
		}
		%>
		<tr>
			<td align = "right" colspan = 4 style = "border : none" >
			 <input type ="button" value = "add" onclick="location.href='insert.jsp'">
			</td>
		</tr>
	</table>
	
</body>
</html>