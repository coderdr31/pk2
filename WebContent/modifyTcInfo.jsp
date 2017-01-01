<%@ page import="java.util.*"%>
<%@ page import="com.pk.model.tcInfo"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="TcSer" class="com.pk.service.tcInfoService"></jsp:useBean>
<%
	List tcs = TcSer.queryAllTc();
	Iterator iter = tcs.iterator();
%>
<body>
	<table>
		<tr>
			<th>记录号</th>
			<th>教工号</th>
			<th>姓名</th>
			<th>所教课程</th>
			<th>权值</th>
			<td></td>
			<td></td>

		</tr>
		<%
			int i = 0;
			while (iter.hasNext()) {
				tcInfo tc = (tcInfo) iter.next();
		%>
		<tr <%if (i % 2 == 0) {%> bgcolor="#F0F8FF" <%}%>>
			<td><%=tc.getTcid()%></td>
			<td><%=tc.getTcjgh()%></td>
			<td><%=tc.getTcname()%></td>
			<td><%=tc.getTccourse()%></td>
			<td><%=tc.getCourseWeight()%></td>
			<td><a href="modifyOneTc.jsp?tcid=<%=tc.getTcid()%>">修改</a></td>
			<td><a href="deleteOneTc.jsp?tcid=<%=tc.getTcid()%>">删除</a></td>

		</tr>
		<%
			i++;
			}
		%>
	</table>
</body>
</html>