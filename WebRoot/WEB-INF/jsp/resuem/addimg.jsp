<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addimg.jsp' starting page</title>
    
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
  	<form action="${pageContext.request.contextPath}/addimg.action"  method="post" id="form"  enctype="multipart/form-data">
  		<center>
  		<table>
  			<tr>
  				<td><input type="file" name="image" id="image"/></td>
  			</tr>
  			<tr>
  				<td><input type="submit" value="提交"/></td>
  			</tr>
  		</table>
  		</center>
  		<input type="hidden" name="stunum" value="${stunum} "/>
  	</form>
  </body>
</html>
