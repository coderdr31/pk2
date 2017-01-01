<%@ page import="java.util.*"%>
<%@ page import="com.pk.model.classInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="CouSer" class="com.pk.service.classInfoService"></jsp:useBean>
<%
	List cous = CouSer.queryAllcla();
	Iterator iter = cous.iterator();
%>

<body>
	<table>
		<tr>
			<th>课程id</th>
			<th>课程名</th>
			<td></td>
			<td></td>
		</tr>
		<%
			int i = 0;
			while (iter.hasNext()) {
				classInfo cou = (classInfo) iter.next();
		%>
		<tr <%if (i % 2 == 0) {%> bgcolor="#F0F8FF" <%}%>>
			<td><%=cou.getClassid()%></td>
			<td><%=cou.getClassname()%></td>
			
			<td><a
				href="modifyOneClass.jsp?coursename=<%=cou.getClassname()%>">修改</a></td>
			<td><a
				href="deleteOneClass.jsp?classid=<%=cou.getClassid()%>">删除</a></td>

		</tr>
		<%
			i++;
			}
		%>

		<form action="addOneClass_result.jsp" method="post">
			<tr>
				<td><input type="number" name="classid"></td>
				<td><input type="text" name="classname"></td>
				
				
				<td align="center" colspan="2"><input type="submit" value="提交">&nbsp;&nbsp;
						<input type="reset" value="重置"></td>
			</tr>
		</form>

	</table>
</body>
</html>