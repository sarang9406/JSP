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
<title>edit.jsp</title>
</head>
<%
	int myno = Integer.parseInt(request.getParameter("myno"));
	MyDao dao = new MyDao();
	MyDto dto = dao.selectOne(myno);

%>
<body>
	<form action = "editres.jsp" method="get">
	
		<input type = "hidden" name = "myno" value ="<%=myno %>">
		
		<table border = "1">
			<tr>
				<td>Name</td>
				<td><%=dto.getMyname() %></td>
			</tr>
			<tr>
				<td>Title</td>
				<td><input type ="text" name = "mytitle" value = "<%=dto.getMytitle()%>">
				</td>
			</tr>
			<tr>
				<td>Content</td>
				<td><textarea rows = "10" cols = "60" name ="mycontent"></textarea> 
				
			</tr>
			<tr>
				<td align = "right" colspan="2">
					<input type= "submit" value ="submit">
					<input type= "button" value = "back" onclick="location.href = 'tableofcontent.jsp'">
				</td>
			</tr>
			
		</table>
	
	</form>
</body>
</html>