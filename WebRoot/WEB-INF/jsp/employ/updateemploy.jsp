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
    
    <title>My JSP 'updateemploy.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.1.2.2.js"></script>
    <link href="css/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <CENTER>
  <div style="width: 400px">
  
    <form action="${pageContext.request.contextPath }/updateemploy.action" method="post" >
    <input type="hidden" name="employid" value="${e.employid}"/>
    <input type="hidden" name="cid" value="${e.cid}"/>
    	<table >
    		<tr>
    			<th>投递简历状态</th>
    			
    				<c:choose>
			             <c:when test="${e.employstatus== '未审核'}">
			             	<td>
			             		<input name="employstatus" type="radio" value="未审核" checked/>未审核
			             		<input name="employstatus" type="radio" value="已通过"/>已通过
			             	</td>
			             </c:when>
			             <c:otherwise>
			             	<td>
				             	<input name="employstatus" type="radio" value="未审核"/>未审核
				             	<input name="employstatus" type="radio" value="已通过" checked/>已通过
			             	</td>
			             </c:otherwise>
			        </c:choose>
    			
    		</tr>
    		<tr>
    			<td colspan="2" style="text-align: center;">
    				<input type="submit" value="确认"/>
    				<input type="reset" value="重置"/>
    			</td>
    		</tr>
    	</table>
    </form>
    
    </div>
    </CENTER>
  </body>
</html>
