<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%-- <jsp:include page="islogin.jsp"></jsp:include> --%>
<body>
	<center>
		<form action="addTeacherInfo_result.jsp" method="post">
			<table bgColor="#c0c0c0">
				<tr>
					<td align="center" bgcolor=green colspan=2><font color=white>教师信息录入</font></td>
				</tr>
				<tr>
					<td>教工号：</td>
					<td><input type="number" size=20 name="tcid"></td>
				</tr>
				<tr>
					<td>姓名：</td>
					<td><input type="text" size=20 name="tcname"></td>
				</tr>
				<tr>
					<td>所教课程：</td>
					<td><select name="tccourse">
							<option selected>course1</option>
							<option>course2</option>
							<option>course3</option>
							<option>course4</option>
							<option>course5</option>
							<option>course6</option>
							<option>course7</option>
							<option>course8</option>
							<option>course9</option>
							<option>course10</option>


					</select></td>
				</tr>

				<tr>
					<td align="center" colspan="2"><input type="submit" value="提交">&nbsp;&nbsp;
						<input type="reset" value="重置"></td>
				</tr>
			</table>

		</form>
	</center>
</body>
</html>