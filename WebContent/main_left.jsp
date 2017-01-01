<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My JSP 'main_left.jsp' starting page</title>
</head>
 </head>
<%--   <jsp:include page="islogin.jsp"></jsp:include> --%>
  <body>
   <a href="displayClassScheduler.jsp" target="main_right">查看班级课表</a><br>
   <a href="displayTcScheduler.jsp" target="main_right">查看教师课表</a><br>
   <a href="addTeacherInfo.jsp" target="main_right">录入教师信息</a><br>
   <a href="modifyTcInfo.jsp" target="main_right">修改或删除教师信息</a><br>
   <a href="courseInfo.jsp" target="main_right">课程列表</a><br>
   <a href="classInfo.jsp" target="main_right">班级列表</a><br>
   
   <a href="index.jsp" target="top.jsp">退出</a><br>
<!--    <a href="index.jsp">退出</a><br> -->
  </body>
</html>