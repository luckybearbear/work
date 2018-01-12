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
    
    <title>My JSP 'collectionbycid.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.1.2.2.js"></script>
    <link href="css/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
	<script type="text/javascript" src="js/tablecloth.js"></script>
	<link href="js/laydate/need/laydate.css" rel="stylesheet" type="text/css" media="screen" />
	<script type="text/javascript" src="js/laydate/laydate.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
  </head>
  
  <body>
  <div>
  <input type="hidden" name="cid" value="${e.cid}"/>
  		<form action="${pageContext.request.contextPath }/getsomebyemploystatusbycompany.action" method="post">
  		<input type="hidden" name="cid" value="${companymsg.cid}"/>
  			<center>
				审核状态：<select name="employstatus">
							<option value="">请选择</option>
							<option value="未审核">未审核</option>
							<option value="已通过">已通过</option>
						</select>
	  			<input type="submit" value="查询"/>
  			</center>
  		</form>
  	</div>
    <center>
    	
    		<c:choose>
    			<c:when test="${not empty employ}">
    				<table border="1" width="500">
			    		<tr>
			    			<th>编号</th>
			    			<th>求职者</th>
			    			<th>职业名称</th>
			    			<th>状态</th>
			    			<th>操作选项</th>
			    		</tr>
    				<c:forEach var="e" items="${employ}">
    				
	    				<tr>
			    			<td>${e.employid}</td>
			    			<td>${e.student.stuname}</td>
			    			<td><a href="${pageContext.request.contextPath }/godetailjob.action?jid=${e.jid}" >${e.job.jobname}</a></td>
			    			<td>${e.employstatus }</td>
			    			<td>
			    				<input type="button" value="删除" onclick="deleteemployBycompany('${e.employid}','${e.cid}')"/>
			    				<input type="button" value="审核" onclick="updateemployBycompany('${e.employid}')"/>
			    				<input type="button"  class="resuem" value="个人简历" onclick="getresuemBycompany('${e.stunum}')"/>
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
  <script type="text/javascript">
	function deleteemployBycompany(employid,cid)
	{
		alert("shanchu");
		if(confirm("确认删除吗？"))
		{
			location.href = "${pageContext.request.contextPath}/deleteemploybycompany.action?employid="+employid+"&cid="+cid;
		}
	}
	
	
	function getresuemBycompany(stunum)
	{
		location.href = "${pageContext.request.contextPath}/getresuem.action?stunum="+stunum;
	}
	function updateemployBycompany(employid)
	{
		location.href = "${pageContext.request.contextPath}/goupdateemploy.action?employid="+employid;
	}
	</script>
</html>
