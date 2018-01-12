<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'allstudent.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.1.2.2.js"></script>
    <link href="css/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
	
	<script type="text/javascript">
		function backalljob()
		{
			location.href = "${pageContext.request.contextPath}/somejobbystudent.action";
		}
	</script>
  </head>
  
  <body>
    <center>
    <div style="width: 450">
    <form action="${pageContext.request.contextPath }/updatejob.action" method="post">
    <input type="hidden" name="jid" value="${detailjob.jid}" />
    	<table>
    	
    		<tr>
    			<th>职位</th>
    			<td>
    				<input name="jobname" type="text" value="${detailjob.jobname}" readonly="readonly">
    			</td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td>&nbsp;</td>
    		</tr>
    		<tr>
    			<th>薪资</th>
    			<td>
    				<input name="salary" type="text" value="${detailjob.salary}" readonly="readonly">
    			</td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td>&nbsp;</td>
    		</tr>
    		<tr>
    			<th>审批状态</th>
    			<td><input name="jobstatus" type="text" value="${detailjob.jobstatus}" readonly="readonly"/></td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td>&nbsp;</td>
    		</tr>
    		<tr>
    			<th>发布公司</th>
    			<td><input name="cname" type="text" value="${detailjob.company.cname}" readonly="readonly"/></td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td>&nbsp;</td>
    		</tr>
    		<tr>
    			<th>发布时间</th>
    			<td><input name="starttime" type="text" value="${detailjob.starttime}" readonly="readonly"/></td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td>&nbsp;</td>
    		</tr>
    		<tr>
    			<th>截止日期</th>
    			<td><input name="deadline" type="text" value="${detailjob.deadline}" readonly="readonly"/></td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td>&nbsp;</td>
    		</tr>
    		<tr>
    			<th>职业介绍</th>
    			<td><textarea name="jobdescription" type="text" rows="4" cols="40" readonly="readonly">${detailjob.jobdescription}</textarea></td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td>&nbsp;</td>
    		</tr>
    		
    		
    		<tr>
    			<td colspan="2" style="text-align: center;">
    				<input type="button" value="返回" onclick="backalljob()"/>
    			</td>
    		</tr>
    	</table>
    </form>
    </div>
    </center>
  </body>
</html>
