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
    
    <title>My JSP 'addjob.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="css/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
	<link href="js/laydate/need/laydate.css" rel="stylesheet" type="text/css" media="screen" />
	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.1.2.2.js"></script>
	<script type="text/javascript" src="js/laydate/laydate.js"></script>
	
	<script type="text/javascript">
	$(function()
	{
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var day = date.getDate();
		
		$("#jobname").blur(checkjobname);
		$("#form").blur(checkform);
		$("#deadline").blur(checktime);
		$("#jobdescription").blur(checkjobdescription);
		if(day<10)
		{
		    day='0'+day;
		} 
		if(month<10) {
		    month='0'+month;
		} 
		$("#starttime").val(year+'-'+month+'-'+day);
		
	});
		function checkjobname()
		{
			var jobname = $("#jobname").val();
			if(!jobname)
			{
				$("#jobnameerror").css("color","red");
				$("#jobnameerror").html("不可为空");
				return false;
			}
			
				else
				{
					$("#jobnameerror").css("color","green");
					$("#jobnameerror").html("输入正确");
					return true;
				}
			
		}
		
		
		
		function checktime()
		{
			var starttime = $("#starttime").val();
			var deadline = $("#deadline").val();
			
			 var d1 = new Date(starttime.replace(/\-/g, "\/"));  
			 var d2 = new Date(deadline.replace(/\-/g, "\/"));  
			
			  if(starttime!=""&&deadline!=""&&d1 > d2)  
			 {  
			  alert("开始时间不能大于结束时间！");  
			  return false;  
			 }
			 return true;
		}
		
		function checkjobdescription()
		{
			var jobdescription = $("#jobdescription").val();
			if(!jobdescription)
			{
				$("#jobdescriptionerror").css("color","red");
				$("#jobdescriptionerror").html("职业介绍不可为空");
				return false;
			}
			else
			{
				$("#jobdescriptionerror").css("color","green");
				$("#jobdescriptionerror").html("输入正确");
				return true;
			}
		}
		
		function checkform()
		{
			if(checktime()&checkjobname()&checkjobdescription())
			{
				return true;
			}
			return false;
		}
	
	</script>
  </head>
  
  <body>
  	<center>
    <div style="width: 450">
    <form action="${pageContext.request.contextPath }/addjobbycompany.action" method="post" onsubmit="return checkform()" id="form">
    <input type="hidden" name="cid" value="${companymsg.cid}" />
    <input type="hidden" name="jobstatus" value="未审核"/>
    	<table>
    	
    		<tr>
    			<th>职位</th>
    			<td>
    				<input name="jobname" type="text" id="jobname" >
    			</td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td><span id="jobnameerror"></span></td>
    		</tr>
    		<tr>
    			<th>薪资</th>
    			<td>
    				<select name="salary" id="salary">
    					<option value="0~1000" selected="selected">0~1000</option>
    					<option value="1000~2000">1000~2000</option>
    					<option value="2000~5000">2000~5000</option>
    					<option value="5000~10000">5000~10000</option>
    					<option value="10000~15000">10000~15000</option>
    					<option value="面议">面议</option>
    				</select>
    			</td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td><span id="salaryerror"></span></td>
    		</tr>
    		
    		<tr>
    			<th>发布时间</th>
    			<td><input  name="starttime" type="text" id="starttime" readonly="readonly"/></td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td><span id="error"></span></td>
    		</tr>
    		<tr>
    			<th>截止日期</th>
    			<td><input class=" form-control laydate-icon" onclick="laydate()" name="deadline" type="text" id="deadline"/></td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td><span id="deadlineerror"></span></td>
    		</tr>
    		<tr>
    			<th>职业介绍</th>
    			<td>
    			    <textarea rows="4" cols="40" name="jobdescription" id="jobdescription"></textarea>
    			</td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td><span id="jobdescriptionerror"></span></td>
    		</tr>
    		
    		
    		<tr>
    			<td colspan="2" style="text-align: center;">
    				<input type="submit" value="提交"/>
    				<input type="reset" value="清空"/>
    			</td>
    		</tr>
    	</table>
    </form>
    </div>
    </center>
  </body>
</html>
