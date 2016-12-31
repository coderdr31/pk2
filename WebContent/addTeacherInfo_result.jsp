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
<jsp:useBean id="tcInfo" class="com.pk.model.tcInfo"></jsp:useBean>
<jsp:setProperty property="*" name="tcInfo" />
<jsp:useBean id="tcServer" class="com.pk.service.tcInfoService"></jsp:useBean>

<%
// 		out.print(stuinfo.getNicheng());
// 		out.print(stuinfo.getXb());
// 		out.print(stuinfo.getCsrq());
// 		out.print(stuinfo.getXq());
// 		out.print(stuinfo.getXqs()); 
%>
	
<%
	if(tcServer.addTc(tcInfo))
	out.print("success");
	else
	out.print("failure"); 
 %>	
</body>
</html>