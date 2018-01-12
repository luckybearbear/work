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
		function backallstudent()
		{
			location.href = "${pageContext.request.contextPath}/allstudent.action";
		}
		
		$(function() {
			$("#stuname").blur(checkstuname);
			$("#stuloginpwd").blur(checkstuloginpwd);
			$("#email").blur(checkemail);
			$("#form").blur(checkform);
	});
		function checkstuname()
		{
			var stuname = $("#stuname").val();
			var reg = /^[\u4e00-\u9fa5]{0,}$/
			if(!stuname)
			{
				$("#stunameerror").css("color","red");
				$("#stunameerror").html("姓名不可为空");
				return false;
			}
			else
			{
				if(!reg.test(stuname))
				{
					$("#stunameerror").css("color","red");
					$("#stunameerror").html("仅限中文");
					return false;
				}
				else
				{
					$("#stunameerror").css("color","green");
					$("#stunameerror").html("输入正确");
					return true;
				}
				
			}
		}
		
		function checkstuloginpwd()
		{
			var stuloginpwd = $("#stuloginpwd").val();
			var reg = /^[a-zA-Z0-9]\w{5,17}$/
			if(!stuloginpwd)
			{
				$("#stuloginpwderror").css("color","red");
				$("#stuloginpwderror").html("密码不可为空");
				return false;
			}
			else
			{
				if(!reg.test(stuloginpwd))
				{
					$("#stuloginpwderror").css("color","red");
					$("#stuloginpwderror").html("长度在6~18之间，只能包含字母、数字和下划线");
					return false;
				}
				else
				{
					$("#stuloginpwderror").css("color","green");
					$("#stuloginpwderror").html("输入正确");
					return true;
				}
				
			}
			
		}
		
		
		function checkemail()
		{
			var email = $("#email").val();
			var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/
			if(!email)
			{
				$("#emailerror").css("color","red");
				$("#emailerror").html("邮箱不可为空");
				return false;
			}
			else
			{
				if(!reg.test(email))
				{
					$("#emailerror").css("color","red");
					$("#emailerror").html("邮箱格式有误");
					return false;
				}
				else
				{
					$("#emailerror").css("color","green");
					$("#emailerror").html("输入正确");
					return true;
				}
				
			} 
		}
		
		function checkform()
		{
			if(checkstuname()&checkstuloginpwd()&checkemail())
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
    <form action="${pageContext.request.contextPath }/updatestudent.action" method="post" id="form" onsubmit="return checkform()">
    	<table>
    	
    		<tr>
    			<th>学号</th>
    			<td>
    				<input name="stunum" type="text" readonly="readonly" value="${getOneStudentByStunum.stunum}">
    			</td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td>&nbsp;</td>
    		</tr>
    		<tr>
    			<th>姓名</th>
    			<td>
    				<input name="stuname" type="text" value="${getOneStudentByStunum.stuname}" id="stuname">
    			</td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td><span id="stunameerror"></span></td>
    		</tr>
    		<tr>
    			<th>就业状态</th>
    			
    				<c:choose>
			             <c:when test="${getOneStudentByStunum.emplstatus== '就业'}">
			             	<td>
			             		<input name="emplstatus" type="radio" value="就业" checked/>就业
			             		<input name="emplstatus" type="radio" value="待业"/>待业
			             	</td>
			             </c:when>
			             <c:otherwise>
			             	<td>
				             	<input name="emplstatus" type="radio" value="就业"/>就业
				             	<input name="emplstatus" type="radio" value="待业" checked/>待业
			             	</td>
			             </c:otherwise>
			        </c:choose>
    			
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td>&nbsp;</td>
    		</tr>
    		<tr>
    			<th>密码</th>
    			<td>
    				<input name="stuloginpwd" type="text" value="${getOneStudentByStunum.stuloginpwd}" id="stuloginpwd"/>
    			</td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td><span id="stuloginpwderror"></span></td>
    		</tr>
    		<tr>
    			<th>邮箱</th>
    			<td>
    				<input name="email" type="text" value="${getOneStudentByStunum.email}" id="email"/>
    			</td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td><span id="emailerror"></span></td>
    		</tr>
    		<tr>
    			<td colspan="2" style="text-align: center;">
    				<input type="submit" value="确认"/>
    				<input type="reset" value="重置"/>
    				<input type="button" value="返回" onclick="backallstudent()"/>
    			</td>
    		</tr>
    	</table>
    </form>
    </div>
    </center>
  </body>
</html>
