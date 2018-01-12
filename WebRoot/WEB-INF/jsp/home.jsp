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
    
    <title>My JSP 'home.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
#top {
	padding: 0px;
	margin-top: 0;
	margin-left: 0;
	margin-right: auto;
	height: auto;
	width: 100%;
	float: inherit;
}
#title {
	font-size: xx-large;
	font-style: italic;
	font-weight: bold;
	float: inherit;
	height: auto;
	width: 80%;
	height: 120px;
	background: url(images/top.gif);
	text-align: center;
}

#bottom {
	float: inherit;
	margin-bottom: 0px;
	margin-top: auto;
	margin-left: auto;
	margin-right: auto;
	height: auto;
	width: 100%;
	text-align: center;
	font-size: 12px;
}



#navigation {
	background: white;
	float: inherit;
	width: auto;
	height: 10%;
	position: relative;
	margin-left: 0px;
	margin-right: auto;
	margin-top: auto;
	text-align: center;
}
.stu{padding-left: 180px}
.comp{padding-left: 180px}
		
		a {text-decoration: none;}
		.left{ width: 20%;height: 80%;float: left}
		.main{position: absolute;width:400px;height:200px;left:55%;top:60%; 
margin-left:-200px;margin-top:-100px;}

input[type="text"]{box-sizing: border-box;
  text-align:center;
  font-size:15;
  height:30;
  border-radius:4px;
  border:1px solid #c8cccf;
  color:#6a6f77;
  width:100px;}
	</style>
	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.1.2.2.js"></script>
    <script type="text/javascript">
    	function gostudentlogin()
    	{
    		location.href = "${pageContext.request.contextPath}/gostudentlogin.action";
    	}
    	function gocompanylogin()
    	{
    		location.href = "${pageContext.request.contextPath}/gocompanylogin.action";
    	}
    	
    		 function nextpage(){
		   var reg = /^[0-9]*[1-9][0-9]*$/;
        	var pagenum = document.getElementById("page").value;
        	if(!reg.test(pagenum)){
        		alert("页码必须是整数");
        	}
        	else{
    	   var page = parseInt(document.getElementById("page").value)+1;
    	   window.location.href="${pageContext.request.contextPath}/home.action?pagenum="+page;
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
    	   window.location.href="${pageContext.request.contextPath}/home.action?pagenum="+page;
    	   }
        }
        function firstpage(){
        	 window.location.href="${pageContext.request.contextPath}/home.action?pagenum=1";
        }
        function lastpage(maxpage){
        	 page=parseInt(maxpage);
        	 window.location.href="${pageContext.request.contextPath}/home.action?pagenum="+page;
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
        	window.location.href="${pageContext.request.contextPath}/home.action?pagenum="+page;
        	}
        
           
   }
    </script>
  </head>
  
  <body>
  <div id="contain">
  <center>
			<div id="top">
				<div id="title">
					毕业生就业信息网
				</div>
				<div id="navigation">
					<a href="#">首页</a>|
					<a href="#">个人服务</a>|
					<a href="#">企业服务</a>|
				</div>
			</div>
	</center>
		<div class="left">
		    <div class="stu">
			    <a  href="${pageContext.request.contextPath }/gostudentlogin.action">
			    	<img src="images/stu.png"/>
			    </a>
		    </div>
		    <div class="comp">
			    <a  href="${pageContext.request.contextPath }/gocompanylogin.action">
			    	<img src="images/comp.png"/>
			    </a>
		    </div>
   		 </div>
   		 <div class="table" style="border: 1px,red,solid;width:100%;height: 80%">
   		 	<div>
    		<c:choose>
    			<c:when test="${not empty jobs}">
    			<table  style="border: 0;background-color: white;" border="0">
		    		<tr bgcolor="#00CC66">
		    			<th style="text-align: center;color: #ffffff">发布公司</th>
		    			<th style="text-align: center;color: #ffffff">招聘职位</th>
		    			<th style="text-align: center;color: #ffffff">地点</th>
		    			<th style="text-align: center;color: #ffffff">发布时间</th>
		    		</tr>
    				<c:forEach var="job" items="${jobs}">
	    				<tr>
			    			
			    			<td style="width:200px;text-align: center;">
			    				${job.company.cname}
			    			</td >
			    			<td style="width:200px;text-align: center;">${job.jobname }</td>
			    			<td style="width:200px;text-align: center;">
			    				${job.company.location}
			    			</td>
			    			<td style="width:200px;text-align: center;">${job.starttime}</td>
			    			
			    			
			    		</tr>
	    			</c:forEach>
	    			</table>
	    			
    			</c:when>
    			
    		</c:choose>
    		<div style="margin-bottom: 20px;text-align: center;padding-right:250px " >
			    <form>
			        <input type="button" value="首页" onclick="firstpage()"/>
			        <input type="button" value="上一页" onclick="frontpage()"/>
			        <input type="text" id="page" style="width:40px" value="${curPage}" onblur="changenum()"/>
			        <input type="button" value="下一页" onclick="nextpage()"/>
			        <input type="button" value="尾页" onclick="lastpage('${maxPage}')"/>
			        <input type="button" value="跳转" onclick="jump('${maxPage}')"/>
		      </form>

			</div>
    		
    </div>
   		 </div>
			<div id="bottom">
				<a href="#">关于我们</a>|
				<a href="#">网站声明</a>|
				<a href="#">服务专区</a>|
				<a href="#">联系我们</a>|
				<br />
				
			</div>
		</div>
  	
  </body>
</html>
