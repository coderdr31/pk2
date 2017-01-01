<%@page import="com.pk.model.classInfo"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="couSer" class="com.pk.service.classInfoService"></jsp:useBean>
		<%
		int classid = Integer.parseInt(request.getParameter("classid"));
		
		if(couSer.deleteClass(classid))
		out.print("success");
		else
		out.print("failure");
	%>
</body>
</html>