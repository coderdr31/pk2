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
		String coursename = request.getParameter("coursename");
		classInfo cou = couSer.queryStubyID(coursename);
	%>
	<form action="modifyOneClass_result.jsp" method="post">
		<table bgColor="#c0c0c0">
			<tr>
				<td>其他：</td>

			</tr>
			<tr>
				<td align="center" colspan="2"><input type="hidden" name="coursename"
					value="<% %>" /><input type="submit" value="提交">&nbsp;&nbsp;
					<input type="reset" value="重置"></td>
			</tr>

		</table>
	</form>
</body>
</html>