<%@page import="com.my.model.dto.MyDto"%>
<%@page import="com.my.model.dao.MyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertres.jsp</title>
</head>
<body>
<%
	String myname = request.getParameter("myname");
	String mytitle = request.getParameter("mytitle");
	String mycontent = request.getParameter("mycontent");
	
	MyDao dao = new MyDao();
	MyDto dto = new MyDto(myname, mytitle, mycontent);
	int res = dao.insert(dto);
	
	if(res>0){
%>
	<script type ="text/javascript">
		alert("add complete");
		location.href = "tableofcontent.jsp"
	</script>
<%

	} else {
		
%>
	<script type ="text/javascript">
		alert("add failed");
		location.href = "insert.jsp"
	</script>
<%
}
			
%>

</body>
</html>