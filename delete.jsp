<%@page import="com.my.model.dao.MyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete.jsp</title>
</head>
<body>
<%
	int myno = Integer.parseInt(request.getParameter("myno"));
	MyDao dao = new MyDao();
	int res = dao.delete(myno);
	
	if(res>0){
		
%>
	<script type ="text/javascript">
		alert("delete succeed")
		location.href ="tableofcontent.jsp";
	</script>
<%

	} else {
%>
	<script type ="text/javascript">
		alert("delete failed")
		location.href ="showone.jsp?myno=<%=myno%>";
	</script>
<%
	}
%>

</body>
</html>