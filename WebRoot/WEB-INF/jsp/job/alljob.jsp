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
    
    <title>My JSP 'alljob.jsp' starting page</title>
    
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
	<script type="text/javascript" src="js/tablecloth.js"></script>
	<link href="js/laydate/need/laydate.css" rel="stylesheet" type="text/css" media="screen" />
	<script type="text/javascript" src="js/laydate/laydate.js"></script>
  </head>
   <script type="text/javascript">
	
		function deletejob(jid)
		{
			if(confirm("确认删除吗？")){
				location.href = "${pageContext.request.contextPath }/deletejob.action?jid="+jid;
			}
		}
		function goupdatejob(jid)
		{
			location.href = "${pageContext.request.contextPath}/goupdatejob.action?jid="+jid;
		}
		function godetailjob(jid)
		{
			location.href = "${pageContext.request.contextPath}/godetailjob.action?jid="+jid;
		}
	
	</script>
  <body>
  	<div>
  		<form action="${pageContext.request.contextPath }/alljob.action" method="post">
  			<center>
  				编号：<input class="select"  type="text" name="jid" value=""/>
	  			名称：<input class="select"  type="text" name="jobname" value=""/>
				审核状态：<select  name="jobstatus" />
							<option value="">请选择</option>
							<option value="已审核">已审核</option>
							<option value="未审核">未审核</option>
						</select>
				发布时间：<select name="timemsg">
							<option value="">请选择</option>
							<option value="本月">本月</option>
							<option value="上个月">上个月</option>
							<option value="近三个月">近三个月</option>
						</select>
				公司：<input class="select"  type="text" name="cname" value=""/>
	  			<input type="submit" value="查询"/>
  			</center>
  			
  		</form>
  	</div>
    <center>
    		<c:choose>
    			<c:when test="${not empty jobs}">
    			<table border="1" width="500">
		    		<tr>
		    			<th>招聘编号</th>
		    			<th>招聘职位</th>
		    			<th>审批状态</th>
		    			<th>发布时间</th>
		    			<th>发布公司</th>
		    			<th>操作选项</th>
		    		</tr>
    				<c:forEach var="job" items="${jobs}">
	    				<tr>
			    			<td>${job.jid }</td>
			    			<td>${job.jobname }</td>
			    			<td>${job.jobstatus}</td>
			    			<td>${job.starttime}</td>
			    			<td>
			    				<a href="${pageContext.request.contextPath }/godetailcompanybystudent.action?cid=${job.company.cid}" >${job.company.cname}</a>
			    			</td>
			    			
			    			<td>
			    				<input type="button" value="删除" onclick="deletejob('${job.jid}')"/>
			    				<input type="button" value="修改" onclick="goupdatejob('${job.jid}')"/>
			    				<input type="button" value="详情" onclick="godetailjob('${job.jid}')"/>
			    			</td>
			    		</tr>
	    			</c:forEach>
	    			</table>
    			</c:when>
    			<c:otherwise>
    				暂无数据
    			</c:otherwise>
    		</c:choose>
    </center>
  </body>
</html>
