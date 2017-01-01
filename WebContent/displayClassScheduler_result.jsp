<%@ page import="java.util.*"%>
<%@ page import="com.pk.model.classInfo"%>
<%@ page import="com.pk.model.sdInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border-collapse: collapse;
}

td {
	border: 1px black solid;
	text-align: center;
}
</style>
</head>

<body>
	<%
		request.setCharacterEncoding("utf-8");

		String classname = request.getParameter("classname");
	%>

	<table>
	<caption><%=classname%>课程表</caption>
		<tr class="morning">
		<tr class="days">
			<td></td>
			<td>星期一</td>
			<td>星期二</td>
			<td>星期三</td>
			<td>星期四</td>
			<td>星期五</td>
			<td>星期六</td>
			<td>星期天</td>

		</tr>
		<tr class="m1">
			<td id="morning" rowspan="4">上午</td>
			<td id="id1"></td>
			<td id="id2"></td>
			<td id="id3"></td>
			<td id="id4"></td>
			<td id="id5"></td>
			<td id="id6"></td>
			<td>&nbsp;</td>


		</tr>

		<tr class="m2">
			<td id="id7"></td>
			<td id="id8"></td>
			<td id="id17"></td>
			<td id="id18"></td>
			<td id="id19"></td>
			<td id="id20"></td>
			<td>&nbsp;</td>
		</tr>
		<tr class="m3">
			<td id="id9"></td>
			<td id="id10"></td>
			<td id="id11"></td>
			<td id="id12"></td>
			<td id="id41"></td>
			<td id="id42"></td>
			<td>&nbsp;</td>
		</tr>
		<tr class="m4">
			<td id="id45"></td>
			<td id="id46"></td>
			<td id="id13"></td>
			<td id="id14"></td>
			<td id="id15"></td>
			<td id="id16"></td>
			<td>&nbsp;</td>
		</tr>
		</tr>

		<tr class="noon">
		<tr>
			<td id="noon" colspan="8">午休</td>
		</tr>
		</tr>
		<tr class="afternoon">
		<tr class="a1">
			<td id="afternoon" rowspan="4">下午</td>
			<td id="id21"></td>
			<td id="id22"></td>
			<td id="id23"></td>
			<td id="id24"></td>
			<td id="id33"></td>
			<td id="id34"></td>
			<td>&nbsp;</td>
		</tr>
		<tr class="a2">
			<td id="id35"></td>
			<td id="id36"></td>
			<td id="id37"></td>
			<td id="id38"></td>
			<td id="id39"></td>
			<td id="id40"></td>
			<td>&nbsp;</td>
		</tr>
		<tr class="a3">
			<td id="id25"></td>
			<td id="id26"></td>
			<td id="id27"></td>
			<td id="id28"></td>
			<td id="id43"></td>
			<td id="id44"></td>
			<td>&nbsp;</td>
		</tr>
		<tr class="a4">
			<td id="id47"></td>
			<td id="id48"></td>
			<td id="id29"></td>
			<td id="id30"></td>
			<td id="id31"></td>
			<td id="id32"></td>
			<td>&nbsp;</td>
		</tr>
		</tr>
	</table>



	<jsp:useBean id="SdSer" class="com.pk.service.schedulerService"></jsp:useBean>
	<%
		List sds = SdSer.showSdbycla(classname);
		Iterator iter = sds.iterator();

		while (iter.hasNext()) {
			sdInfo sd = (sdInfo) iter.next();
			String coursename = sd.getCoursename();
			String teachername = sd.getTeachername();
			int timeid = sd.getTimeid();
			String time = "id" + timeid;
	%>

	<script type="text/javascript">
          var_time = "<%=time%>";
          var_coursename = "<%=coursename%>";
          var_teachername = "<%=teachername%>";

		document.getElementById(var_time).innerHTML = var_coursename + "<br/>";
		document.getElementById(var_time).innerHTML += var_teachername;
	</script>

	<%
		}
	%>


</body>
</html>