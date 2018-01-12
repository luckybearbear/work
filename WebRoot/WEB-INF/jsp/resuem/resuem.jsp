<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'resuem.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.1.2.2.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		table {width: 80%;margin-bottom: 20px;border-collapse: collapse;}
		table tr .css-b {width: 120px;}
		table tr td {border: 1px solid #ddd;border-top: 1px solid #ddd;position: relative;text-align: center;width: 120px;}
		.required {color: red;}
		.css-textarea1 {
    width: 94%;
    height: 95px;
    background-color: #fff;
    background-image: none;
    overflow: auto;
    margin: 0;
    font: inherit;
    padding: 2px 12px;
    font-size: 14px;
}
select{
    width: 90%;
    padding: 2px 0px;
}

	</style>
  </head>
  
  <body>
    <center>
    <div>
    	<h1>毕业生简历表</h1>
    </div>
   </center>
    <table align="center" width="80%">
    <tr height="40">
    	<td class=".css-b"><b>姓名</b></td>
    	<td align="center">${resuem.student.stuname}</td>
    	<td class=".css-b" ><b>性别</b></td>
    	<td align="center">
    		${resuem.sex}
    	</td>
    	<td class=".css-b"><b>民族</b></td>
    	<td align="center">
    		${resuem.nation }
    	</td>
    	
    	<td rowspan="4" style="width: 135px">
    		<img src="/images/${resuem.img} " style="width: 120px;height: 150px"/>
    	</td>
    </tr>
    <tr height="40">
    	<td class=".css-b"><b>身份证</b></td>
    	<td align="center">${resuem.identity}</td>
    	<td class=".css-b"><b>政治面貌</b></td>
    	<td align="center">
    		${resuem.political}
    	</td>
    	<td class=".css-b"><b>学历</b></td>
    	<td align="center" class=".css-b">
    		${resuem.education}
    	</td>
    
    
    	
    </tr>
    <tr height="40">
    	<td class=".css-b"><b>学院</b></td>
    	<td align="center">${resuem.school}</td>
    	<td class=".css-b"><b><b>专业</b></b></td>
    	<td align="center">${resuem.major}</td>
    	<td class=".css-b"><b>班级</b></td>
    	<td align="center">${resuem.classes}</td>
    	
    </tr>
    <tr height="40">
    	
    	<td class=".css-b"><b>联系电话</b></td>
    	<td align="center">${resuem.tel}</td>
    	<td class=".css-b"><b>电子邮箱</b></td>
    	<td align="center">
    		${resuem.student.email}
    	</td>
    	<td class=".css-b"><b>毕业时间</b></td>
    	<td align="center">${resuem.graduatetime}</td>
    </tr>
    <tr height="100">
    	<td class=".css-b"><b>工作经历</b></td>
    	<td colspan="6">
    		<textarea  class="css-textarea1"  name="workhistory" id="workhistory">${resuem.workhistory}</textarea>
    	</td>
    </tr>
    <tr height="100">
    	<td class=".css-b"><b>兴趣爱好</b></td>
    	<td colspan="6">
    		<textarea  class="css-textarea1" name="enjoy" id="enjoy">${resuem.enjoy}</textarea>
    	</td>
    </tr>
    <tr height="100">
    	<td class=".css-b"><b>奖惩情况</b></td>
    	<td colspan="6">
    		<textarea  class="css-textarea1" name="reward" id="reward">${resuem.reward}</textarea>
    	</td>
    </tr>
    <tr height="100">
    	<td class=".css-b"><b>求职意向</b></td>
    	<td colspan="6">
    		<textarea class="css-textarea1"  name="jobinterntion" id="jobinterntion">${resuem.jobinterntion}</textarea>
    	</td>
    </tr>
    
    
    </table>
  </body>
</html>
