<%@page import="com.pk.model.tcInfo"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="tcSer" class="com.pk.service.tcInfoService"></jsp:useBean>
		<%
		int tcid = Integer.parseInt(request.getParameter("tcid"));
		if(tcSer.deleteTc(tcid))
		out.print("success");
		else
		out.print("failure");
	%>
</body>
</html>