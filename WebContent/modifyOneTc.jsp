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
		tcInfo tc = tcSer.queryTcbyID(tcid);
	%>
	<form action="modifyOneTc_result.jsp" method="post">
		<table bgColor="#c0c0c0">
			<tr>
				<td>教工号：</td>
				<td><input type="number" size=20 name="tcjgh"
					value="<%=tc.getTcjgh()%>"></td>
			</tr>
			<tr>
				<td>姓名：</td>
				<td><input type="text" size=20 name="tcname"
					value="<%=tc.getTcname()%>"></td>
			</tr>
			<tr>
				<td>所教课程	：</td>
				<td><input type="text" size=20 name="tccourse"
					value="<%=tc.getTccourse()%>"></td>
			</tr>
			<tr>
				<td>权值：</td>
				<td><input type="number" size=20 name="courseWeight"
					value="<%=tc.getCourseWeight()%>"></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input type="hidden" name="tcid"
					value="<%=tc.getTcid()%>" /><input type="submit" value="提交">&nbsp;&nbsp;
					<input type="reset" value="重置"></td>
			</tr>

		</table>
	</form>
</body>
</html>