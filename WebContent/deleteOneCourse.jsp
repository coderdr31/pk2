<%@page import="com.pk.model.courseInfo"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="couSer" class="com.pk.service.courseInfoService"></jsp:useBean>
		<%
		String coursename = request.getParameter("coursename");
// 		courseInfo cou = couSer.queryStubyID(coursename);
		if(couSer.deleteCou(coursename))
		out.print("success");
		else
		out.print("failure");
	%>
</body>
</html>