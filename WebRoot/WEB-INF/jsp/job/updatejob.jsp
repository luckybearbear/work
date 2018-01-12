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
			location.href = "${pageContext.request.contextPath}/alljob.action";
		}
	</script>
	
  </head>
  
  <body>
    <center>
    <div style="width: 450">
    <form action="${pageContext.request.contextPath }/updatejob.action" method="post">
    <input type="hidden" name="jid" value="${job.jid}" />
    <input type="hidden" name="salary" value="${job.salary}" />
    <input type="hidden" name="jobdescription" value="${job.jobdescription}" />
    <input type="hidden" name="starttime" value="${job.starttime}" />
    <input type="hidden" name="deadline" value="${job.deadline}" />
    	<table>
    	
    		<tr>
    			<th>职位</th>
    			<td>
    				<input name="jobname" type="text" value="${job.jobname}" readonly="readonly">
    			</td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td>&nbsp;</td>
    		</tr>
    		<tr>
    			<th>审批状态</th>
    			
    				<c:choose>
			             <c:when test="${job.jobstatus== '已审核'}">
			             	<td>
			             		<input name="jobstatus" type="radio" value="已审核" checked/>已审核
			             		<input name="jobstatus" type="radio" value="未审核"/>未审核
			             	</td>
			             </c:when>
			             <c:otherwise>
			             	<td>
				             	<input name="jobstatus" type="radio" value="已审核"/>已审核
				             	<input name="jobstatus" type="radio" value="未审核" checked/>未审核
			             	</td>
			             </c:otherwise>
			        </c:choose>
    			
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td>&nbsp;</td>
    		</tr>
    		
    		
    		<tr>
    			<td colspan="2" style="text-align: center;">
    				<input type="submit" value="确认"/>
    				<input type="reset" value="重置"/>
    				<input type="button" value="返回" onclick="backalljob()"/>
    			</td>
    		</tr>
    	</table>
    </form>
    </div>
    </center>
  </body>
</html>
