<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  
  
  <body>
  a;${list[0].text}<br>
  b:${list2[0].text}
  

<app:ui_leftMenu>
<c:forEach var="student"  items="${list}" >
  <tr>
	<td>${student.name}</td>
	<td>${student.text}</td>
  </tr>
</c:forEach> 
</app:ui_leftMenu>


  </body>
</html>
