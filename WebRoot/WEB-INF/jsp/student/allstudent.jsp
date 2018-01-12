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
	<script type="text/javascript" src="js/tablecloth.js"></script>
	<script type="text/javascript">
		function deletestudent(stunum)
		{
			if(confirm("确认删除吗？")){
				location.href = "${pageContext.request.contextPath }/deletestudent.action?stunum="+stunum;
			}
		}
		function goupdatestudent(stunum)
		{
			location.href = "${pageContext.request.contextPath}/goupdatestudent.action?stunum="+stunum;
		}
		function godetailstudent(stunum)
		{
			location.href = "${pageContext.request.contextPath}/godetailstudent.action?stunum="+stunum;
		}
		
		function goresuem(stunum)
		{
			location.href = "${pageContext.request.contextPath}/getresuem.action?stunum="+stunum;
		}
		
		
		 function nextpage(){
		   var reg = /^[0-9]*[1-9][0-9]*$/;
        	var pagenum = document.getElementById("page").value;
        	if(!reg.test(pagenum)){
        		alert("页码必须是整数");
        	}
        	else{
    	   var page = parseInt(document.getElementById("page").value)+1;
    	   window.location.href="${pageContext.request.contextPath}/getsomestudentbysome.action?pagenum="+page;
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
    	   window.location.href="${pageContext.request.contextPath}/getsomestudentbysome.action?pagenum="+page;
    	   }
        }
        function firstpage(){
        	 window.location.href="${pageContext.request.contextPath}/getsomestudentbysome.action?pagenum=1";
        }
        function lastpage(maxpage){
        	 page=parseInt(maxpage);
        	 window.location.href="${pageContext.request.contextPath}/getsomestudentbysome.action?pagenum="+page;
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
        	window.location.href="${pageContext.request.contextPath}/getsomestudentbysome.action?pagenum="+page;
        	}
        
           
   }
	</script>
  </head>
  
  <body>
  	<div>
  		<form action="${pageContext.request.contextPath}/getsomestudentbysome.action" method="post">
  			<center>
  				学号：<input class="select"  type="text" name="stunum" value=""/>
	  			姓名：<input class="select"  type="text" name="stuname" value=""/>
				就业状态：<select name="emplstatus">
							<option value="">请选择</option>
							<option value="就业">就业</option>
							<option value="待业">待业</option>
						</select>
	  			<input type="submit" value="查询"/>
  			</center>
  			
  		</form>
  	</div>
    <center>
    	
    		<c:choose>
    			<c:when test="${not empty showAllStudent}">
    				<table border="1" width="500">
			    		<tr>
			    			<th>学号</th>
			    			<th>姓名</th>
			    			<th>就业状态</th>
			    			<th>邮箱</th>
			    			<th>操作选项</th>
			    		</tr>
    				<c:forEach var="stu" items="${showAllStudent}">
    				
	    				<tr>
			    			<td>${stu.stunum }</td>
			    			<td>${stu.stuname }</td>
			    			<td>${stu.emplstatus }</td>
			    			<td>${stu.email }</td>
			    			<td>
			    				<input type="button" value="删除" onclick="deletestudent('${stu.stunum}')"/>
			    				<input type="button" value="修改" onclick="goupdatestudent('${stu.stunum}')"/>
			    				<input type="button" value="详情" onclick="godetailstudent('${stu.stunum}')"/>
			    				<input type="button" value="查看学生简历" onclick="goresuem('${stu.stunum}')"/>
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
