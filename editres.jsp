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
<title>editres.jsp</title>
</head>
<body>
<%
	int myno = Integer.parseInt(request.getParameter("myno"));
	String myname = request.getParameter("myname");
	String mytitle = request.getParameter("mytitle");
	String mycontent = request.getParameter("mycontent");
	
	MyDao dao = new MyDao();
	MyDto dto = new MyDto(myno, myname, mytitle, mycontent);
	int res = dao.update(dto);
	
	if (res>0){
%>
	<script type ="text/javascript">
		alert("edit succeed")
		location.href ="showone.jsp?myno=<%=dto.getMyno()%>";
	</script>
<%

	} else {
%>
	<script type ="text/javascript">
		alert("edit failed")
		location.href ="edit.jsp";
	</script>
<%
	}
%>

</body>
</html>