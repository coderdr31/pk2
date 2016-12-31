<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My JSP 'validate.jsp' starting page</title>
</head>
<body>
	<jsp:useBean id="user" class="com.pk.model.userTable"></jsp:useBean>
	<jsp:useBean id="userService" class="com.pk.service.userService"></jsp:useBean>
	<jsp:setProperty property="*" name="user" />
	<%
		if (userService.valiUser(user)) {
			session.setAttribute("user",user);
// 			user: session字段， jsp实例
	%>
	<jsp:forward page="main.jsp"></jsp:forward>
	<%
		} else {
	%>
	<jsp:forward page="index.jsp"></jsp:forward>
	<%
		}
	%>
</body>
</html>