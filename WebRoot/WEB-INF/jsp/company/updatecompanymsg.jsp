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
		function backallcompany()
		{
			location.href = "${pageContext.request.contextPath}/allcompany.action";
		}
		$(function()
		{
			$("#cname").blur(checkcname);
			$("#cloginpwd").blur(checkcloginpwd);
			$("#cloginname").blur(checkcloginname);
			$("#ccontact").blur(checkccontact);
			$("#location").blur(checklocation);
			$("#site").blur(checksite);
			$("#industry").blur(checkindustry);
			$("#description").blur(checkdescription);
			$("#form").blur(checkform);
		});
		
		
		function checkcname()
		{
			var cname = $("#cname").val();
			var reg = /^[\u4E00-\u9FA5A-Za-z0-9]+$/
			if(!cname)
			{
				$("#cnameerror").css("color","red");
				$("#cnameerror").html("公司名称不可为空");
				return false;
			}
			else
			{
				if(!reg.test(cname))
				{
					$("#cnameerror").css("color","red");
					$("#cnameerror").html("含有特殊符号");
					return false;
				}
				else
				{
					$("#cnameerror").css("color","green");
					$("#cnameerror").html("输入正确");
					return true;
				}
				
			}
		}
		
		function checkcloginname()
		{
			var cloginname = $("#cloginname").val();
			var reg = /^[a-zA-Z0-9_]{3,16}$/ 
			if(!cloginname)
			{
				$("#cloginnameerror").css("color","red");
				$("#cloginnameerror").html("账号不可为空");
				return false;
			}
			else
			{
				if(!reg.test(cloginname))
				{
					$("#cloginnameerror").css("color","red");
					$("#cloginnameerror").html("用户名最短3个字符最长不超过16个字符");
					return false;
				}
				else
				{
					$("#cloginnameerror").css("color","green");
					$("#cloginnameerror").html("输入正确");
					return true;
				}
			}
		}
		
		function checkcloginpwd()
		{
			var cloginpwd = $("#cloginpwd").val();
			var reg = /^[a-zA-Z0-9]\w{5,17}$/
			if(!cloginpwd)
			{
				$("#cloginpwderror").css("color","red");
				$("#cloginpwderror").html("密码不可为空");
				return false;
			}
			else
			{
				if(!reg.test(cloginpwd))
				{
					$("#cloginpwderror").css("color","red");
					$("#cloginpwderror").html("长度在6~18之间，只能包含字母、数字和下划线");
					return false;
				}
				else
				{
					$("#cloginpwderror").css("color","green");
					$("#cloginpwderror").html("输入正确");
					return true;
				}
				
			}
			
		}
		
		function checkccontact()
		{
			var ccontact = $("#ccontact").val();
			var reg = /^((0\d{2,3}-\d{7,8})|(1[3584]\d{9}))$/
			if(!ccontact)
			{
				$("#ccontacterror").css("color","red");
				$("#ccontacterror").html("联系方式不可为空");
				return false;
			}
			else
			{
				if(!reg.test(ccontact))
				{
					$("#ccontacterror").css("color","red");
					$("#ccontacterror").html("手机格式不对");
					return false;
				}
				else
				{
					$("#ccontacterror").css("color","green");
					$("#ccontacterror").html("输入正确");
					return true;
				}
				
			}
			
		}
		function checklocation()
		{
			varlocation  = $("#location").val();
			if(!location)
			{
				$("#locationerror").css("color","red");
				$("#locationerror").html("地址不可为空");
				return false;
			}
			else
			{
					$("#locationerror").css("color","green");
					$("#locationerror").html("输入正确");
					return true;
			}
		}
		
		function checksite()
		{
			var site = $("#site").val();
			if(!site)
			{
				$("#siteerror").css("color","red");
				$("#siteerror").html("网址不可为空");
				return false;
			}
			
				else
				{
					$("#siteerror").css("color","green");
					$("#siteerror").html("输入正确");
					return true;
				}
			
		}
		
		function checkindustry()
		{
			var industry = $("#industry").val();
			var reg = /^[\u4E00-\u9FA5A-Za-z0-9]+$/
			if(!industry)
			{
				$("#industryerror").css("color","red");
				$("#industryerror").html("行业不可为空");
				return false;
			}
			else
			{
				if(!reg.test(industry))
				{
					$("#industryerror").css("color","red");
					$("#industryerror").html("包含特殊字符");
					return false;
				}
				else
				{
					$("#industryerror").css("color","green");
					$("#industryerror").html("输入正确");
					return true;
				}
			}
		}
		
		function checkdescription()
		{
			var description = $("#description").val();
			if(!description)
			{
				$("#descriptionerror").css("color","red");
				$("#descriptionerror").html("简介不可为空");
				return false;
			}
			else
			{
					$("#descriptionerror").css("color","green");
					$("#descriptionerror").html("输入正确");
					return true;
			}
		}
		
		function checkform()
		{
			if(checkcname()&checkcloginpwd()&checkcloginname()&checkccontact()&checklocation()&checksite()&checkindustry()&checkdescription())
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
    <form action="${pageContext.request.contextPath }/updatecompanybycompany.action" method="post" id="form" onsubmit="return checkform()">
    
    	<table>
    		<tr>
    			<th>企业编号</th>
    			<td>
    				<input type="text" name="cid" value="${companymsg.cid}" readonly="readonly"/>
    			</td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td>&nbsp;</td>
    		</tr>
    		<tr>
    			<th>企业名称</th>
    			<td>
    				<input name="cname" type="text" value="${companymsg.cname}"id="cname" >
    			</td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td><span id="cnameerror"></span></td>
    		</tr>
    		<tr>
    			<th>企业帐号</th>
    			<td>
    				<input name="cloginname" type="text" value="${companymsg.cloginname}"  id="cloginname">
    			</td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td><span id="cloginnameerror"></span></td>
    		</tr>
    		<tr>
    			<th>密码</th>
    			<td>
    				<input name="cloginpwd" type="text" value="${companymsg.cloginpwd}"  id="cloginpwd">
    			</td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td><span id="cloginpwderror"></span></td>
    		</tr>
    		<tr>
    			<th>联系方式</th>
    			<td>
    				<input name="ccontact" type="text" value="${companymsg.ccontact}" id="ccontact"/>
    			</td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td><span id="ccontacterror"></span></td>
    		</tr>
    		<tr>
    			<th>地址</th>
    			<td>
    				<input name="location" type="text" value="${companymsg.location}" id="location"/>
    			</td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td><span id="locationerror"></span></td>
    		</tr>
    		<tr>
    			<th>网址</th>
    			<td>
    				<input name="site" type="text" value="${companymsg.site}" id="site"/>
    			</td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td><span id="siteerror"></span></td>
    		</tr>
    		<tr>
    			<th>行业</th>
    			<td>
    				<input name="industry" type="text" value="${companymsg.industry}" id="industry"/>
    			</td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td><span id="industryerror"></span></td>
    		</tr>
    		<tr>
    			<th>简介</th>
    			<td>
    				<textarea name="description" id="description" >${companymsg.description}</textarea>
    			</td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td><span id="descriptionerror"></span></td>
    		</tr>
    		<tr>
    			<td colspan="2" style="text-align: center;">
    				<input type="submit" value="确定"/>
    				<input type="reset" value="重置"/>
    			</td>
    		</tr>
    	</table>
    </form>
    </div>
    </center>
  </body>
</html>
