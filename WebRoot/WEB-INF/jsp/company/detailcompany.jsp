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
	</script>
  </head>
  
  <body>
    <center>
    <div style="width: 450">
    <form action="${pageContext.request.contextPath }/updatecompany.action" method="post">
    
    	<table>
    		<tr>
    			<th>企业编号</th>
    			<td>
    				<input type="text" name="cid" value="${getOneCompanyByCid.cid}" readonly="readonly"/>
    			</td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td>&nbsp;</td>
    		</tr>
    		<tr>
    			<th>企业名称</th>
    			<td>
    				<input name="cname" type="text" value="${getOneCompanyByCid.cname}" readonly="readonly">
    			</td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td>&nbsp;</td>
    		</tr>
    		<tr>
    			<th>企业帐号</th>
    			<td>
    				<input name="cloginname" type="text" value="${getOneCompanyByCid.cloginname}" readonly="readonly">
    			</td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td>&nbsp;</td>
    		</tr>
    		<tr>
    			<th>密码</th>
    			<td>
    				<input name="cloginpwd" type="text" value="${getOneCompanyByCid.cloginpwd}" readonly="readonly">
    			</td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td>&nbsp;</td>
    		</tr>
    		<tr>
    			<th>联系方式</th>
    			<td>
    				<input name="ccontact" type="text" value="${getOneCompanyByCid.ccontact}" readonly="readonly"/>
    			</td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td>&nbsp;</td>
    		</tr>
    		<tr>
    			<th>地址</th>
    			<td>
    				<input name="location" type="text" value="${getOneCompanyByCid.location}" readonly="readonly"/>
    			</td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td>&nbsp;</td>
    		</tr>
    		<tr>
    			<th>网址</th>
    			<td>
    				<input name="site" type="text" value="${getOneCompanyByCid.site}" readonly="readonly"/>
    			</td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td>&nbsp;</td>
    		</tr>
    		<tr>
    			<th>行业</th>
    			<td>
    				<input name="industry" type="text" value="${getOneCompanyByCid.industry}" readonly="readonly"/>
    			</td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td>&nbsp;</td>
    		</tr>
    		<tr>
    			<th>简介</th>
    			<td>
    				<textarea name="description" readonly="readonly">${getOneCompanyByCid.description}</textarea>
    			</td>
    		</tr>
    		<tr class="space">
    			<td>&nbsp;</td>
    			<td>&nbsp;</td>
    		</tr>
    		<tr>
    			<td colspan="2" style="text-align: center;">
    				<input type="button" value="返回" onclick="backallcompany()"/>
    			</td>
    		</tr>
    	</table>
    </form>
    </div>
    </center>
  </body>
</html>
