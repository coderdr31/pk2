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
<jsp:useBean id="ClaSer" class="com.pk.service.classInfoService"></jsp:useBean>
<%
	List clas = ClaSer.queryAllcla();
	// out.print(stus.size());  
	Iterator iter = clas.iterator();
%>

<body>
<form action="displayClassScheduler_result.jsp" method="post">
		<tr>
			<td>班级：</td>
			<td><select name="classname">
					<%
						while (iter.hasNext()) {
							classInfo cla = (classInfo) iter.next();
					%>

					<option><%=cla.getClassname()%></option>
					<%
						}
					%>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2"><input type="submit" value="提交">&nbsp;&nbsp;
				<input type="reset" value="重置"></td>
		</tr>
	</form>
</body>
</html>