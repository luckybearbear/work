<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
<title>单位登录</title>
<link href="css/CompLoginStyle.css" type="text/css" rel="stylesheet" />
 <script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.1.2.2.js"></script>
<script type="text/javascript">
	//去注册页面
	function goregister()
	{
		location.href = "${pageContext.request.contextPath}/register.action"
	}
  </script>

</head>

<body>
	<div id="topbar">
  	<div id="topbar-main">
  		
  		
  	</div>
  	</div>
<div class="clearboth"></div>
<div id="content">	
	<div id="banner">
    	<div style="float:left; padding-top:15px; line-height:26px;"><span style="font-family:'黑体'; font-size:20px;">就业信息管理系统</span><br /><span style="font-size:12px;">——企业登录界面</span></div>
    </div>
    <div class="clearboth"></div>
	<div class="fenge"></div>
    <div id="main">
    	<div id="left">
        	<div id="bigadv"><img src="images/bigadv.jpg" /></div>
                <div style="clear:both"></div>
            </div>
        
        <div id="right">
        	<div class="login">
        	<form id="loginform" action="${pageContext.request.contextPath }/checkclogin.action" method="post">
        	    <table width="99%" height="120" border="0" cellpadding="0" cellspacing="0">
                  <tr><td height="37" colspan="2" class="title2"></td></tr>
                  <tr><td colspan="2"><span id="error"style="color: red;font-size: 9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${error}</span></td></tr>
                  <tr>
                    <td height="32"><label for="cloginname">用户名：</label></td>
                    <td>
                      <input type="text" name="cloginname" maxlength="128" value="" id="username" class="textborder" style="width:110px;"/>
                    </td>
                  </tr>
                  <tr>
                    <td height="32"><label for="cloginpwd">密&nbsp;码：</label></td>
                    <td>
                      <input type="password" name="cloginpwd" maxlength="32" id="password" class="textborder" style="width:110px;"/>
                    </td>
                  </tr>
                 
                  <tr>
                    <td height="40" colspan="2" align="center" class="forgetpsw">
                    <label>
                      <input type="submit" name="button" id="btn2" class="btn btn2" value=""  />
                    </label>
                  </tr>
              </table>
            </form>
            
            
          </div> 
           <div class="reg">
            	<p>还没有注册？马上注册，享受快捷服务！</p>
                <div><input name="" type="button" id="btn3" class=" btn btn3" onclick="goregister()" value="" /></div>
            </div>
            
        </div>
        </div>
        <div style="clear:both"></div> 
        <div class="login-introduce">
        	<div class="login-intro1">
            	<h5>一站式注册与审核，轻松覆盖各站点</h5>
                <p>教育部、省市和高校就业网真正互联互通，只需在教育部、省市和毕业高校就业网任一站点注册并接受审核，可向任一站点发布招聘信息。</p>
            </div>
            <div class="login-intro1">
            	<h5>信息定向收发，人才锁定准</h5>
                <p>可指定省市、高校站点，定向发布需求信息，并接收所选站点的求职信息，实现信息一站式全网分发与精准推送，大大提高招聘效率。</p>
            </div>
            <div class="login-intro1">
            	<h5>全面招聘服务，实现高效交互</h5>
                <p>提供方便、快捷的信息发布和简历筛检功能，提供邮件、站内消息、手机短信、视频面试等及时、多样的互动方式，实现高效交互。</p>
            </div>
            <div class="login-intro1">
            	<h5>权威学生学籍验证，确保真实</h5>
                <p>依托教育部全国高校学籍数据库和各高校的学籍库，实现学生学籍信息实时验证，确保学生学籍信息真实。</p>
            </div>
            <div class="login-intro2">
            	<h5>独家毕业生生源数据查询</h5>
                <p>提供全国高校毕业生生源数据库，从用人单位实际需求出发，提供科学有效的毕业生生源检索服务。</p>
            </div>
            <div style="clear:both;"></div>
        </div>
        
		
		<div class="bottomdiv">
    		<br />
                                           版权所有：
            
    		
    			张俊
    		
    	</div>
          	
  </div>
 </body>
</html>

