<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
   <jsp:useBean id="cou" class="com.pk.model.courseInfo"></jsp:useBean>
  <jsp:setProperty property="*" name="cou"/>
    <jsp:useBean id="couSet" class="com.pk.service.courseInfoService"></jsp:useBean>
  <%  
  
//   out.print(stu.getNicheng());
//   out.print(stu.getKcs());
//   out.print(stu.getXqs());
//   out.print(stu.getId());
   %> 
   <%
   
   if(couSet.updateCou(cou))
   out.print("success!!");
   else
   out.print("failure!!");
    %>
</body>
</html>