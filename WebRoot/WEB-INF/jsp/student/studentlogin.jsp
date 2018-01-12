<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />	
<title>学生登录</title>
	<link href="css/StuLoginStyle.css" type="text/css" rel="stylesheet" />
    <link href="/scripts/register/register.dialog.css" type="text/css" rel="stylesheet" />
  	<style>
  	.login_top{ background:url(images/studentloginhead.jpg) repeat-x; width:101%; height:58px; overflow:hidden;}
	#main{background:url(images/stuloginleft.jpg) repeat-x; width:100%; height:400px; overflow:hidden;}
	#right{width: 255px;
    float: right;
    padding: 150px;
    border: 0px solid #d9d9d9;}
	
	
	</style>
	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.1.2.2.js"></script>
    <link href="js/laydate/need/laydate.css" rel="stylesheet" type="text/css" media="screen" />
	<script type="text/javascript" src="js/laydate/laydate.js"></script>
	
    

</head>

<body>

<div class="clearboth" ></div>
<div id="content">
    <div class="clearboth" ></div>
    <div class="login_top"  ></div>
    <div id="main">
        <div id="right">
        	<div class="login">
        	   		<form id="loginform" action="${pageContext.request.contextPath}/gostudentcontroller.action" method="post">
		            	<table width="99%" height="180" border="0" cellpadding="0" cellspacing="0">
		                  <tr><td height="37" colspan="2" class="title2"></td></tr>
		                  <tr>
		                  <td colspan="2">
		                  	<span id="error" style="color: red;font-size: 11;text-align: center;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${error}</span>
		                  </td></tr>
		                  <tr>
		                    <td height="33" align="right" style="color:#5b5b5b;">用户名：</td>
		                    <td><input type="text" name="stunum" maxlength="120" value="" id="username" class="textborder" style="width:110px;"/></td>
		                  </tr>
		                  <tr>
		                    <td height="32" align="right" style="color:#5b5b5b;">密&nbsp;码：</td>
		                    <td><input type="password" name="stuloginpwd" maxlength="30" id="password" class="textborder" style="width:110px;"/></td>
		                  </tr>
		                  
		                  
		                  <tr>
		                  <td height="44"></td>
		                  <td ><label><input type="submit" name="button" id="btn2" class="btn btn2" value=" " /></label>
		                  </td></tr>
		                  <tr><td colspan="2" align="center" class="forgetpsw">
		                  </tr>		  
		              	</table>
	            	</form>
        	   
        	   
          	</div>
            
        </div>
        </div>
        <div style="clear:both"></div>
        <div class="login-introduce">
        	<div class="login-intro1">
            	<h5>一站式注册，轻松覆盖各站点</h5>
                <p>教育部、省市和高校就业网间互联互通，只需在教育部、省市和毕业高校就业网任何一点注册成为用户，即可将求职信息一站式发布到指定站点。</p>
            </div>
            <div class="login-intro1">
            	<h5>信息专享、共享相结合</h5>
                <p>除了注册站点信息，只需激活，即可检索所有激活站点发布的招聘信息，实现最大限度共享，获得更多求职机会。</p>
            </div>
            <div class="login-intro1">
            	<h5>多手段实现与用人单位高效交互</h5>
                <p>系统提供站内交互、手机短信、邮件系统、视频面试等方式实现与用人单位的便捷高效交互。</p>
            </div>
            <div class="login-intro1">
            	<h5>权威学籍验证 推动诚信就业</h5>
                <p>依托教育部全国高校学籍数据库和各高校的学籍库，实现学籍信息实时验证，验证通过的简历将显示“学籍验证成功”标识，推动诚信就业。</p>
            </div>
            <div class="login-intro2">
            	<h5>第一时间参与网上招聘会</h5>
                <p>第一时间接收教育部、省市、学校举办的网上招聘会信息。</p>
            </div>
            <div style="clear:both;"></div> 
        </div>
    	<div style="clear:both;"></div>
    
	
		<div class="bottomdiv">
    		<br />
                                           版权所有：
            
    		
    				张俊
    		
    	</div>
     
</div>

<c:remove var="error" scope="session" />
</body>

</html>

