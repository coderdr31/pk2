<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8");  %>
<jsp:useBean id="courseInfo" class="com.pk.model.courseInfo"></jsp:useBean>
<jsp:setProperty property="*" name="courseInfo" />
<jsp:useBean id="courseServer" class="com.pk.service.courseInfoService"></jsp:useBean>

	
<%
	if(courseServer.addCourse(courseInfo))
	out.print("success");
	else
	out.print("failure"); 
 %>	
</body>
</html>