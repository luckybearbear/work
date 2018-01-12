<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'addstudent.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link href="css/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
		<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
    	<script type="text/javascript" src="js/jquery.easyui.min.1.2.2.js"></script>



	</head>
<script>
$(function() {
	$("#stunum").blur(checkstunum);
	$("#stuname").blur(checkstuname);
	$("#form").blur(checkform);
});
function checkstunum()
{
	var stunum = $("#stunum").val();
	var flag;
			if(!stunum)
			{
				$("#stunumerror").css("color","red");
				$("#stunumerror").html("学号不可为空");
				return false;
			}
			else
			{
				var reg = /^[1-9]\d*|0$/
				if(!reg.test(stunum))
				{
					$("#stunumerror").css("color","red");
					$("#stunumerror").html("格式不对");
				}
				else
				{
					$.ajax(
				{
					type:"post",
					url:"${pageContext.request.contextPath}/getsomestudentbystunum.action",
					data:{"stunum":stunum},
					dataType:"text",
					success:function(getstunum)
					{
						var stunumarr = getstunum.split(",");
						for(var i = 0;i<=stunumarr.length-1;i++)
						{
							if(stunum == stunumarr[i] )
							{
								$("#stunumerror").css("color","red");
								$("#stunumerror").html("学号已存在");
								flag = false;
								return false;
								
							}
							else
							{
								$("#stunumerror").css("color","green");
								$("#stunumerror").html("输入正确");
								flag = true;
							}
						}
						return flag;
					}
				});
				}
			}
		}			
		
		
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
		
		function checkform()
		{
			if(checkstuname())
			{
				return true;
			}
			alert("xxxx");
			return false;
		}
</script>
	<body>
		<center>
			<div style="width: 450">
				<form action="${pageContext.request.contextPath}/addstudent.action" method="post" id="form" onsubmit="return checkform()">

					<input name="stuloginpwd" value="123456" type="hidden" />
					<input name="emplstatus" value="待业" type="hidden" />
					<table>
						<tr>
							<th>
								学号
							</th>
							<td>
								<input name="stunum" type="text" id="stunum" />
								
							</td>
							
						</tr>
						<tr class="space">
							<td>
								&nbsp;
							</td>
							<td>
								<span id="stunumerror"></span>
							</td>
						</tr>
						<tr>
							<th>
								姓名
							</th>
							<td>
								<input name="stuname" type="text" id="stuname" />
							</td>
						</tr>
						<tr class="space">
							<td>
								&nbsp;
							</td>
							<td>
								<span id="stunameerror"></span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" value="保存" />
								<input type="reset" value="重置" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</center>

	</body>
	
</html>
