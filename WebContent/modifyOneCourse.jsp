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
		// 		out.print(id);
		courseInfo cou = couSer.queryStubyID(coursename);
		// 		out.print(stu.getId());
		// 		out.print(stu.getXqs());
	%>
	<form action="modifyOneCourse_result.jsp" method="post">
		<table bgColor="#c0c0c0">
			<tr>
				<td>总课时数：</td>
				<td><input type="text" size=20 name="coursehour"
					value="<%=cou.getCoursehour()%>"></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input type="hidden" name="coursename"
					value="<%=cou.getCoursename()%>" /><input type="submit" value="提交">&nbsp;&nbsp;
					<input type="reset" value="重置"></td>
			</tr>

		</table>
	</form>
</body>
</html>