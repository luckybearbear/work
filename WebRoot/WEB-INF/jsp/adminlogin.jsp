<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.1.2.2.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		body{
			text-align: center;
		}
		input{
			width:300px;
			height:30px;
		}
	</style>
	  <script type="text/javascript">
  $(function(){
  	if($("#error").val() != null&& $("#error").val() != "")
  		alert($("#error").val());
  })
  </script>
  </head>
  
  <body>
  	<p>后台管理员登录</p>
  	
    <form action="${pageContext.request.contextPath }/goback.action" method="post" >
    		<input type="hidden"ext" id="error" value="${error}"/>
    	<input type="text" name="username" require="required" placeholder="请输入管理员账号"/><br/><br/>
    	<input type="password" name="password" require="required" placeholder="请输入管理员密码"/><br/>
    	<input type="submit" value="LOGIN" />
    </form>
  </body>

</html>
