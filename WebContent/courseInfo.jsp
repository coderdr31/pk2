<%@ page import="java.util.*"%>
<%@ page import="com.pk.model.courseInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="CouSer" class="com.pk.service.courseInfoService"></jsp:useBean>
<%
	List cous = CouSer.queryAllCou();
	// out.print(stus.size());  
	Iterator iter = cous.iterator();
%>

<body>
	<table>
		<tr>
			<th>课程名</th>
			<th>总课时数</th>
			<td></td>
			<td></td>
		</tr>
		<%
			int i = 0;
			while (iter.hasNext()) {
				courseInfo cou = (courseInfo) iter.next();
		%>
		<tr <%if (i % 2 == 0) {%> bgcolor="#F0F8FF" <%}%>>
			<td><%=cou.getCoursename()%></td>
			<td><%=cou.getCoursehour()%></td>
			<td><a
				href="modifyOneCourse.jsp?coursename=<%=cou.getCoursename()%>">修改</a></td>
			<td><a
				href="deleteOneCourse.jsp?coursename=<%=cou.getCoursename()%>">删除</a></td>

		</tr>
		<%
			i++;
			}
		%>

		<form action="addOneCourse_result.jsp" method="post">
			<tr>
				<td><input type="text" name="coursename"></td>
				<td><input type="number" name="coursehour"></td>
				
				<td align="center" colspan="2"><input type="submit" value="提交">&nbsp;&nbsp;
						<input type="reset" value="重置"></td>
			</tr>
		</form>

	</table>
</body>
</html>