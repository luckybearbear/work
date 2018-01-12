<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>招聘单位注册 - 全国大学生就业一站式服务系统</title>
	<meta http-equiv="keywords" content="求职,招聘,找工作,双选自助厅,视频面试,学籍验证,专家在线,远程宣讲,职业训练营,搜索引擎" />
	<meta http-equiv="description" content="全国大学生就业公共服务立体化平台（新职业）是中国高校毕业生就业服务信息网的升级和拓展，由教育部举办，全国高校毕业生就业网络联盟支持，为大学生就业和用人单位招聘提供网上、网下相结合的多功能服务" />
	<meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	

  <script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.1.2.2.js"></script>
  
  <style type="text/css">
	.main{	width:100%;	margin:0 auto;	text-align:left;border: 1px solid #7F9DB9;}
	.reg{width:220px;}
	.label{width: 120px}
	.inputtd{width:120px}
/*文本框*/
.iptxt{width:120px;height:18px;_height:20px}

/*邮件自动填充*/
.emailist{border:1px solid; border-radius: 4px; background-color:#fff; color:#666; font-size:14px; list-style-type:0; padding:0; margin:0; overflow:hidden;}
.emailist li{padding:2px 11px; cursor:pointer;}
.emailist .on, .emailist li:hover{background-color:#eee;}
  </style>
  <script type="text/javascript">
  function gohome()
  {
  	location.href="/work/home.action";
  }
  
  $(function(){
  	$("#cname").blur(checkcname);
  	$("#cloginname").blur(checkcloginname);
  	$("#cloginpwd").blur(checkcloginpwd);
  	$("#ccontact").blur(checkccontact);
  	$("#industry").blur(checkindustry);
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
			var flag;
			var cloginname = $("#cloginname").val();
			if(!cloginname)
			{
				$("#cloginnameerror").css("color","red");
				$("#cloginnameerror").html("账号不可为空");
				return false;
			}
			else
			{
				var reg = /^[a-zA-Z0-9_]{3,16}$/ 
				if(!reg.test(cloginname))
				{
					$("#cloginnameerror").css("color","red");
					$("#cloginnameerror").html("最短3个字符最长不超过16个字符");
					return false;
				}
				else
				{
					$.ajax(
					{
						type:"post",
						url:"${pageContext.request.contextPath}/checkcloginname.action?cloginname="+cloginname,
						date:{"cloginname":cloginname},
						dateType:"text",
						success:function(getcloginname)
						{
							var arr = getcloginname.split(",")
							for(var i = 0;i<=arr.length-1;i++)
							{
								if(cloginname == arr[i])
								{
									$("#cloginnameerror").css("color","red");
									$("#cloginnameerror").html("登录名已存在");
									flag = false
									return false;
								}
								else
								{
									$("#cloginnameerror").css("color","green");
									$("#cloginnameerror").html("输入正确");
									flag = true;
								}
							}
							return flag;
							
							
						}
					});
					
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
					$("#ccontacterror").html("格式不对");
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
		
		
		function checkform()
		  {
		  	if(checkcname()&checkcloginpwd()&checkccontact()&checkindustry())
		  	{
		  		return true;
		  	}
		  	return false;
		  }
  </script>
  </head>
  <body>
  	
  
    	
    	
    	<div id="main">
    		<div id="content">
    		
		 		<div class="main" align="center">
		 		<center>
				 	<div class="lgimg"><h2>用人单位会员注册</h2></div>
					<div class="formblk">
					<form id="form"  action="${pageContext.request.contextPath}/companyregister.action" method="post" onsubmit="return checkform()">
					<table width="600px">
						<tr>
							<td class="label">登录账号：</td>
							<td class="inputtd"><input type="text" name="cloginname" maxlength="64" value="" id="cloginname" class="reg" /> <span></span></td>
							<td><div id="cloginnameerror"></div></td>
						</tr>
						<tr> 
							<td class="label">密码：</td>
							<td class="inputtd"><input type="password" maxlength="32" id="cloginpwd" name="cloginpwd" style="width:220px" placeholder="请输入登录密码，长度在6~18之间"/> <span></span></td>
							<td><div id="cloginpwderror"></div></td>
						</tr>
						<tr>
							<td class="label" >单位名称：</td>
							<td class="inputtd"><input type="text" name="cname" maxlength="64" value="" id="cname" class="reg" placeholder="请输入单位名称"/> </td>
							<td><div id="cnameerror"></div></td>
						</tr>
						<tr>
							<td class="label">所属行业:</td>
							<td class="inputtd">
							<input type="text" name="industry" maxlength="32" value="" id="industry" class="reg" placeholder="请输入所属行业"/>
							</td>
							<td><div id="industryerror"></div></td>
						</tr>
						<tr>
							<td class="label">联系方式：</td>
							<td class="inputtd">
							<input type="text" name="ccontact" maxlength="16" value="" id="ccontact" class="reg" placeholder="请输入联系方式"/>
							</td>
							<td><div id="ccontacterror"></div></td>
						</tr>
						
						
						
						
						 
						<tr>
							<td colspan="3">
							<textarea id="agreement" style="width:520px; height:88px;" readonly="readonly">
《系统用户协议》

本平台仅提供求职、招聘及其它与此相关联之服务。求职者、招聘单位及因其它目的进入本平台的访问者接受本协议条款，注册成为大学生就业一站式交互平台会员，并遵守本协议所述之条款使用平台所提供之服务。如果你不接受本声明之条款，请勿使用本平台。接受本声明之条款，你将遵守本协议之规定。

1. 信息的发布
• 不得发布任何违反有关法律规定信息；
• 不得发布任何与本平台求职、招聘目的不适之信息；
• 不得发布任何不完整、虚假的信息；
• 用户对所发布的信息承担完全责任。 

2. 信息的使用
• 招聘单位仅可就招聘目的，使用求职者之简历信息；
• 求职者仅可因应聘某职位，使用招聘单位发布之招聘信息；
• 本平台提供的其它信息，仅用于与其相应内容相关的目的；
• 不得以任何商业用途而使用本平台的任何信息。

3. 信息的公开
• 在本平台所登录的任何信息，均有可能被本平台的任一访问者浏览，也可能被错误、不当使用。本平台将不对此承担任何责任。

4. 信息的准确性
• 任何在本平台发布的信息，均必须符合合法、准确、及时、完整的原则。但本平台将不能保证所有由第三方提供的信息，或本平台自行采集的信息完全准确。使用者了在使用信息时，需要进一步核实。本平台对访问者未经自行核实误用本平台信息造成的任何损失不承担任何责任。 

5. 信息更改与删除
• 除了信息的发布者外，任何访问者不得更改或删除他人发布的任何信息。本平台有权根据其判断保留修改或删除任何不适信息。

6. 版权、商标权
• 本平台的图形、图像、文字及其程序等均属全国大学生就业一站式交互平台之版权，受商标法及相关知识产权法律保护，未经书面许可，任何人不得下载、复制、再使用。在本平台发布信息之商标，归其相应的商标所有权人，受商标法保护。

7. 注册信息使用
• 注册会员所提供的个人资料将会被统计、汇总，在我们的严格管理下，为平台的广告商及合作者提供依据。平台会不定期地通过注册会员留下的电子邮件同该会员保持联系。
• 本平台承诺：在未经访问者授权同意的情况下，不会将访问者的个人资料泄露给第三方。但以下情况除外。
• 根据执法单位之要求或为公共之目的向相关单位提供个人资料；
• 由于您将用户密码告知他人或与他人共享注册帐户，由此导致的任何个人资料泄露；
• 由于计算机2000年问题、黑客攻击、计算机病毒侵入或发作、因政府管制而造成的暂时性关闭等影响网络正常经营之不可抗力而造成的个人资料泄露、丢失、被盗用或被窜改等；
• 由于与平台用户链接的其它平台所造成之个人资料泄露及由此而导致的任何法律争议和后果；
• 为免除访问者在生命、身体或财产方面之急迫危险。 

8. 自责
• 所有使用本平台的用户，对使用本平台信息和在本平台发布信息的被使用，承担完全责任。本平台对任何因使用本平台而产生的第三方之间的纠纷，不负任何责任。

9. 服务终止
• 本平台有权在预先通知或不予通知的情况下终止任何免费服务。

10. 免责条款
• 本平台并无随时监视此网址，但保留对其实施实时监视的权利。对于他方输入的，不是本平台发布的材料，概不负任何法律责任。应聘信息发布方必须对其存入简历中心的个人简历及材料的格式、内容的准确性和合法性独立承担一切法律责任。招聘信息的发布方对其在职位数据库公布的材料独立承担一切法律责任。
• 本平台不保证对某一种职位描述会有一定数目的使用者来浏览，也不保证会有一位特定的使用者来浏览。对于其他网址链接在本平台的内容，本平台概不负法律责任。
• 本平台因正常的系统维护、系统升级，或者因网络拥塞而导致平台不能访问，本平台不承担任何责任。

11. 本协议及因使用本平台而产生的与本平台之间纠纷，将依据中华人民共和国的有关法律解决。

12. 本网站所有企业服务解释权归本站所有。</textarea></td>
						</tr>
						<tr>
							<td colspan="3">
								<input type="submit" id="next" name="next" value=" 同意以上协议，注册 " />
								<input type="button" value="返回首页" onclick="gohome()"/>
							</td>
						</tr>
					</table>
					</form>



		    		</div>
		    		
			</center>
		  		</div>
  
    		</div>    		
    	</div>
    	
		

		

  </body>
</html>
