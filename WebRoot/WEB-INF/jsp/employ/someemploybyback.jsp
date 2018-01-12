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
	
	
  </head>
  <script type="text/javascript">
	
	function getresuem(stunum)
	{
		location.href = "${pageContext.request.contextPath}/getresuem.action?stunum="+stunum;
	}
	
	function exportExcel()
	{
		location.href = "${pageContext.request.contextPath}/exportExcel.action";
	}
	
	
	
	 function nextpage(){
		   var reg = /^[0-9]*[1-9][0-9]*$/;
        	var pagenum = document.getElementById("page").value;
        	if(!reg.test(pagenum)){
        		alert("页码必须是整数");
        	}
        	else{
    	   var page = parseInt(document.getElementById("page").value)+1;
    	   window.location.href="${pageContext.request.contextPath}/getsomeemploybysome.action?pagenum="+page;
    	   }
       }
        
        function frontpage(){
        	 var reg = /^[0-9]*[1-9][0-9]*$/;
        	var pagenum = document.getElementById("page").value;
        	if(!reg.test(pagenum)){
        		alert("页码必须是整数");
        	}
        	else{
        	var page = parseInt(document.getElementById("page").value)-1;
    	   window.location.href="${pageContext.request.contextPath}/getsomeemploybysome.action?pagenum="+page;
    	   }
        }
        function firstpage(){
        	 window.location.href="${pageContext.request.contextPath}/getsomeemploybysome.action?pagenum=1";
        }
        function lastpage(maxpage){
        	 page=parseInt(maxpage);
        	 window.location.href="${pageContext.request.contextPath}/getsomeemploybysome.action?pagenum="+page;
        }
        function changenum(){
        	        	var reg = /^[0-9]*[1-9][0-9]*$/;
        	var pagenum = document.getElementById("page").value;
        	if(!reg.test(pagenum)){
        		alert("页码必须是整数");
        	}
        	
        }
        function jump(maxpage){
        	var reg = /^[0-9]*[1-9][0-9]*$/;
        	var page=parseInt(document.getElementById("page").value);
        	if(page>parseInt(maxpage)){
        		alert("页码大于最大了！");
        	}
        	else if(!reg.test(page)){
        		alert("页码必须是整数");
        	}
        	else{
        	window.location.href="${pageContext.request.contextPath}/getsomeemploybysome.action?pagenum="+page;
        	}
        
           
   }
	
	</script>
  <body>
  <div>
  <input type="hidden" name="cid" value="${e.cid}"/>
  		<form action="${pageContext.request.contextPath }/getsomeemploybysome.action" method="post">
  			<center>
  			公司：<input class="select" type="text" value="" name="cname"/>
  			学生：<input class="select" type="text" value="" name="stuname"/>
  			职业：<input class="select" type="text" value="" name="jobname"/>
				审核状态：<select name="employstatus">
							<option value="">请选择</option>
							<option value="未审核">未审核</option>
							<option value="已通过">已通过</option>
						</select>
	  			<input type="submit" value="查询"/>
  			</center>
  		</form>
  	</div>
  	<div>
  		<input type="button" value="导出Excel文件" onclick="exportExcel()"/>
  	</div>
    <center>
    	
    		<c:choose>
    			<c:when test="${not empty employ}">
    				<table border="1" width="500">
			    		<tr>
			    			<th>编号</th>
			    			<th>求职者</th>
			    			<th>职业</th>
			    			<th>公司</th>
			    			<th>状态</th>
			    			<th>操作选项</th>
			    		</tr>
    				<c:forEach var="e" items="${employ}">
    				
	    				<tr>
			    			<td>${e.employid}</td>
			    			<td>${e.student.stuname}</td>
			    			<td><a href="${pageContext.request.contextPath }/godetailjob.action?jid=${e.jid}" >${e.job.jobname}</a></td>
			    			<td><a href="${pageContext.request.contextPath }/godetailcompanybystudent.action?cid=${e.company.cid}" >${e.company.cname}</a></td>
			    			<td>${e.employstatus }</td>
			    			<td>
			    				<input type="button" value="个人简历" onclick="getresuem('${e.stunum}')"/>
			    			</td>
			    		</tr>
	    			</c:forEach>
	    			</table>
    			</c:when>
    			
    		</c:choose>
    		
	<div style="margin-bottom: 10px;text-align: center;" >
		    <form>
        <input type="button" value="首页" onclick="firstpage()"/>
        <input type="button" value="上一页" onclick="frontpage()"/>
        <input type="text" id="page" style="width:40px" value="${curPage}" onblur="changenum()"/>
        <input type="button" value="下一页" onclick="nextpage()"/>
        <input type="button" value="尾页" onclick="lastpage('${maxPage}')"/>
        <input type="button" value="跳转" onclick="jump('${maxPage}')"/>
      </form>

	</div>
    	</center>
  </body>
</html>
