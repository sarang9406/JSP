<%@page import="com.my.model.dao.MyDao"%>
<%@page import="com.my.model.dto.MyDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>showone.jsp</title>
</head>
<%
	int myno = Integer.parseInt(request.getParameter("myno"));
	MyDao dao = new MyDao();
	MyDto dto = dao.selectOne(myno);
%>
<body>

	<h1>Show One</h1>
	
	<table border = "1">
		<tr>
			<td>Name</td>
			<td><%=dto.getMyname() %></td>
		</tr>
		<tr>
			<td>Title</td>
			<td><%=dto.getMytitle() %></td>
		</tr>
		<tr>
			<td>Content</td>
			<td>
				<textarea rows = "10" cols = "40" readonly = "readonly"><%=dto.getMycontent() %></textarea>
			</td>
		</tr>
		<tr>
			<td colspan = "2" align = "right">
				<input type = "button" onclick = "location.href = 'edit.jsp?myno=<%=myno %>'" value = "edit">
				<input type = "button" onclick = "location.href = 'delete.jsp?myno=<%=myno %>'" value = "delete">
				<input type = "button" onclick = "location.href = 'tableofcontent.jsp'" value = "to the list">
			</td>
		</tr>
	</table>

</body>
</html>