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
    
    <title>My JSP 'addresume.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="js/laydate/need/laydate.css" rel="stylesheet" type="text/css" media="screen" />
	<script type="text/javascript" src="js/laydate/laydate.js"></script>
	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.1.2.2.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		table {width: 80%;margin-bottom: 20px;border-collapse: collapse;}
		table tr .css-b {width: 120px;}
		table tr td {border: 1px solid #ddd;border-top: 1px solid #ddd;position: relative;text-align: center;}
		.required {color: red;}
		.css-textarea1 {
    width: 94%;
    height: 95px;
    background-color: #fff;
    background-image: none;
    overflow: auto;
    margin: 0;
    font: inherit;
    padding: 2px 12px;
    font-size: 14px;
}
select{
    width: 90%;
    padding: 2px 0px;
}

	</style>
	
	<script type="text/javascript">
		$(function(){
			$("#sex").blur(checksex);
			$("#identity").blur(checkidentity);
			$("#school").blur(checkschool);
			$("#major").blur(checkmajor);
			$("#classes").blur(checkclasses);
			$("#nation").blur(checknation);
			$("#political").blur(checkpolitical);
			$("#education").blur(checkeducation);
			$("#tel").blur(checktel);
			$("#graduatetime").blur(checkgraduatetime);
			$("#workhistory").blur(checkworkhistory);
			$("#enjoy").blur(checkenjoy);
			$("#reward").blur(checkreward);
			$("#jobinterntion").blur(checkjobinterntion);
			$("#image").blur(checkPic);
			$("#form").blur(checkform);
			
		});
		function checkform()
		{
			if(checksex()&checkidentity()&checkschool()&checkmajor()&checkclasses()&checknation()&checkpolitical()&checkeducation()&checktel()&checkgraduatetime()&checkworkhistory()&checkenjoy()&checkreward()&checkjobinterntion())
			{
				return true;
			}
			return false;
		}
		function checksex()
		{
			var sex = $("#sex").val();
			if(!sex)
			{
				$("#sexerror").css("display","block");
				return false;
			}
			else
			{
				$("#sexerror").css("display","none");
				return true;
			}
		}
		
		function checkidentity()
		{
			var identity = $("#identity").val();
			var reg = /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
			if(!identity)
			{
				$("#identityerror").css("display","block");
				return false;
			}
			else
			{
				if(!reg.test(identity))
				{
					$("#identityerror").css("display","block");
					return false;
				}
				else
				{
					$("#identityerror").css("display","none");
					return true;
				}
			}
		}
		
		function checkschool()
		{
			var school = $("#school").val();
			var reg = /^[\u4e00-\u9fa5]{0,}$/;
			if(!school)
			{
				$("#schoolerror").css("display","block");
				return false;
			}
			else
			{
				if(!reg.test(school))
				{
					$("#schoolerror").css("display","block");
					return false;
				}
				else
				{
					$("#schoolerror").css("display","none");
					return true;
				}
			}
		}
		function checkmajor()
		{
			var major = $("#major").val();
			var reg = /^[\u4e00-\u9fa5]{0,}$/;
			if(!major)
			{
				$("#majorerror").css("display","block");
				return false;
			}
			else
			{
				if(!reg.test(major))
				{
					$("#majorerror").css("display","block");
					return false;
				}
				else
				{
					$("#majorerror").css("display","none");
					return true;
				}
			}
		}
		function checkclasses()
		{
			var classes = $("#classes").val();
			var reg = /^[0-9]*$/;
			if(!classes)
			{
				$("#classeserror").css("display","block");
				return false;
			}
			else
			{
				if(!reg.test(classes))
				{
					$("#classeserror").css("display","block");
					return false;
				}
				else
				{
					$("#classeserror").css("display","none");
					return true;
				}
			}
		}
		function checknation()
		{
			var nation = $("#nation").val();
			if(!nation)
			{
				$("#nationerror").css("display","block");
				return false;
			}
			else
			{
				$("#nationerror").css("display","none");
				return true;
			}
		}
		
		function checkpolitical()
		{
			var political = $("#political").val();
			if(!political)
			{
				$("#politicalerror").css("display","block");
				return false;
			}
			else
			{
				$("#politicalerror").css("display","none");
				return true;
			}
		}
		function checkeducation()
		{
			var education = $("#education").val();
			if(!education)
			{
				$("#educationerror").css("display","block");
				return false;
			}
			else
			{
				$("#educationerror").css("display","none");
				return true;
			}
		}
		
		function checktel()
		{
			var tel = $("#tel").val();
			var reg = /^((0\d{2,3}-\d{7,8})|(1[3584]\d{9}))$/;
			if(!tel)
			{
				$("#telerror").css("display","block");
				return false;
			}
			else
			{
				if(!reg.test(tel))
				{
					$("#telerror").css("display","block");
					return false;
				}
				else
				{
					$("#telerror").css("display","none");
					return true;
				}
			}
		}	
		
		function checkgraduatetime()
		{
			var graduatetime = $("#graduatetime").val();
			if(!graduatetime)
			{
				$("#graduatetimeerror").css("display","block");
				return false;
			}
			else
			{
				$("#graduatetimeerror").css("display","none");
				return true;
			}
		}
		
		function checkworkhistory()
		{
			var workhistory = $("#workhistory").val();
			if(!workhistory)
			{
				$("#workhistoryerror").css("display","block");
				return false;
			}
			else
			{
				$("#workhistoryerror").css("display","none");
				return true;
			}
		}
		
			
		
		
		function checkenjoy()
		{
			var enjoy = $("#enjoy").val();
			if(!enjoy)
			{
				$("#enjoyerror").css("display","block");
				return false;
			}
			else
			{
				$("#enjoyerror").css("display","none");
				return true;
			}
		}
		
		function checkreward()
		{
			var reward = $("#reward").val();
			if(!reward)
			{
				$("#rewarderror").css("display","block");
				return false;
			}
			else
			{
				$("#rewarderror").css("display","none");
				return true;
			}
		}
		
		function checkjobinterntion()
		{
			var jobinterntion = $("#jobinterntion").val();
			if(!jobinterntion)
			{
				$("#jobinterntionerror").css("display","block");
				return false;
			}
			else
			{
				$("#jobinterntionerror").css("display","none");
				return true;
			}
		}
		
		var  img=null;     
    function checkPic(){     
        var location = $("#image");      
        if(location==""){     
            alert("请先选择图片文件");     
            return false;     
        }     
        var point = location.lastIndexOf(".");     
        var type = location.substr(point);     
        if(type==".jpg"||type==".gif"||type==".JPG"||type==".GIF"||type==".PNG"||type==".png"){     
            img=document.createElement("img");       
            img.src=location;     
            if(img.fileSize>102400){     
                alert("图片尺寸请不要大于100KB");     
                return false;     
            }else    
            return true;     
        }     
        else{     
            alert("只能输入jpg或者gif格式的图片");     
            return false;     
        }     
        return true;     
    }     
      
        
		
		
		
		
		
		
		
		
		
	</script>
  </head>
  
  <body>
  <center>
    <div>
    	<h1>毕业生简历表</h1>
    </div>
   </center>
    <form action="${pageContext.request.contextPath }/updateresuem.action" method="post" id="form" onsubmit="return checkform()" enctype="multipart/form-data">
    <input type="hidden" name="stunum" value="${resuem.student.stunum}"/>
    <table align="center" width="80%">
    <tr height="40">
    	<td class=".css-b"><b>姓名</b></td>
    	<td align="center">${resuem.student.stuname}</td>
    	<td class=".css-b" ><b>性别<span class="required" id="sexerror">*</span></b></td>
    	<td align="center">
    		<select name="sex" id="sex">
    			<option value="${resuem.sex}">${resuem.sex}</option>
    			<option value="男">男</option>
    			<option value="女">女</option>
    		</select>
    	</td>
    	<td class=".css-b"><b>身份证</b><span class="required" id="identityerror">*</span></td>
    	<td align="center"><input type="text" name="identity" id="identity" value="${resuem.identity}"/></td>
    	<td rowspan="4" style="width: 135px">
    		<img src="/images/${resuem.img} " style="width: 120px;height: 150px"/>
    	</td>
    </tr>
    <tr height="40">
    	<td class=".css-b"><b>学院</b><span class="required" id="schoolerror">*</span></td>
    	<td align="center"><input type="text" name="school" id="school" value="${resuem.school}"/></td>
    	<td class=".css-b"><b><b>专业</b></b><span class="required" id="majorerror">*</span></td>
    	<td align="center"><input type="text" name="major" id="major" value="${resuem.major}"/></td>
    	<td class=".css-b"><b>班级</b><span class="required" id="classeserror">*</span></td>
    	<td align="center"><input type="text" name="classes" id="classes" value="${resuem.classes}"/></td>
    </tr>
    <tr height="40">
    	<td class=".css-b"><b>政治面貌</b><span class="required" id="politicalerror">*</span></td>
    	<td align="center">
    		<select name="political" id="political">
    			<option value="${resuem.political}">${resuem.political}</option>
    			<option value="群众">群众</option>
    			<option value="共青团员">共青团员</option>
    			<option value="党员">党员</option>
    		</select>
    	</td>
    	<td class=".css-b"><b>民族</b><span class="required" id="nationerror">*</span></td>
    	<td align="center">
    		<select name="nation" id="nation">
    			<option value="${resuem.nation}">${resuem.nation}</option>
    			<option value="汉族">汉族</option>
				<option value="蒙古族">蒙古族</option>
				<option value="彝族">彝族</option>
				<option value="侗族">侗族</option>
				<option value="哈萨克族">哈萨克族</option>
				<option value="畲族">畲族</option>
				<option value="纳西族">纳西族</option>
				<option value="仫佬族">仫佬族</option>
				<option value="仡佬族">仡佬族</option>
				<option value="怒族">怒族</option>
				<option value="保安族">保安族</option>
				<option value="鄂伦春族">鄂伦春族</option>
				<option value="回族">回族</option>
				<option value="壮族">壮族</option>
				<option value="瑶族">瑶族</option>
				<option value="傣族">傣族</option>
				<option value="高山族">高山族</option>
				<option value="景颇族">景颇族</option>
				<option value="羌族">羌族</option>
				<option value="锡伯族">锡伯族</option>
				<option value="乌孜别克族">乌孜别克族</option>
				<option value="裕固族">裕固族</option>
				<option value="赫哲族">赫哲族</option>
				<option value="藏族">藏族</option>
				<option value="布依族">布依族</option>
				<option value="白族">白族</option>
				<option value="黎族">黎族</option>
				<option value="拉祜族">拉祜族</option>
				<option value="柯尔克孜族">柯尔克孜族</option>
				<option value="布朗族">布朗族</option>
				<option value="阿昌族">阿昌族</option>
				<option value="俄罗斯族">俄罗斯族</option>
				<option value="京族">京族</option>
				<option value="门巴族">门巴族</option>
				<option value="维吾尔族">维吾尔族</option>
				<option value="朝鲜族">朝鲜族</option>
				<option value="土家族">土家族</option>
				<option value="傈僳族">傈僳族</option>
				<option value="水族">水族</option>
				<option value="土族">土族</option>
				<option value="撒拉族">撒拉族</option>
				<option value="普米族">普米族</option>
				<option value="鄂温克族">鄂温克族</option>
				<option value="塔塔尔族">塔塔尔族</option>
				<option value="珞巴族">珞巴族</option>
				<option value="苗族">苗族</option>
				<option value="满族">满族</option>
				<option value="哈尼族">哈尼族</option>
				<option value="佤族">佤族</option>
				<option value="东乡族">东乡族</option>
				<option value="达斡尔族">达斡尔族</option>
				<option value="毛南族">毛南族</option>
				<option value="塔吉克族">塔吉克族</option>
				<option value="德昂族">德昂族</option>
				<option value="独龙族">独龙族</option>
				<option value="基诺族">基诺族</option>
    		</select>
    	</td>
    	<td class=".css-b"><b>电子邮箱</b></td>
    	<td align="center">
    		${resuem.student.email}
    	</td>
    </tr>
    <tr height="40">
    	<td class=".css-b"><b>学历</b><span class="required" id="educationerror">*</span></td>
    	<td align="center">
    		<select name="education" id="education">
    			<option value="${resuem.education}">${resuem.education}</option>
    			<option value="博士生">博士生</option>
    			<option value="研究生">研究生</option>
    			<option value="本科生">本科生</option>
    			<option value="大专生">大专生</option>
    		</select>
    	</td>
    	<td class=".css-b"><b>联系电话</b><span class="required" id="telerror">*</span></td>
    	<td align="center"><input type="text" name="tel" id="tel" value="${resuem.tel}"/></td>
    	<td class=".css-b"><b>毕业时间</b><span class="required" id="graduatetimeerror">*</span></td>
    	<td align="center"><input type="text" name="graduatetime" id="graduatetime" class=" form-control laydate-icon" onclick="laydate()" value="${resuem.graduatetime}"/></td>
    </tr>
    <tr height="100">
    	<td class=".css-b"><b>工作经历</b><span class="required" id="workhistoryerror">*</span></td>
    	<td colspan="6">
    		<textarea  class="css-textarea1"  name="workhistory" id="workhistory">${resuem.workhistory}</textarea>
    	</td>
    </tr>
    <tr height="100">
    	<td class=".css-b"><b>兴趣爱好</b><span class="required" id="enjoyerror">*</span></td>
    	<td colspan="6">
    		<textarea  class="css-textarea1" name="enjoy" id="enjoy">${resuem.enjoy}</textarea>
    	</td>
    </tr>
    <tr height="100">
    	<td class=".css-b"><b>奖惩情况</b><span class="required" id="rewarderror">*</span></td>
    	<td colspan="6">
    		<textarea  class="css-textarea1" name="reward" id="reward">${resuem.reward}</textarea>
    	</td>
    </tr>
    <tr height="100">
    	<td class=".css-b"><b>求职意向</b><span class="required" id="jobinterntionerror">*</span></td>
    	<td colspan="6">
    		<textarea class="css-textarea1"  name="jobinterntion" id="jobinterntion">${resuem.jobinterntion}</textarea>
    	</td>
    </tr>
    <tr>
    	<td colspan="7">
    		<input type="submit" value="保存"/>
    		<input type="reset" value="重置"/>
    	</td>
    </tr>
    
    </table>
    </form>
  </body>
</html>
