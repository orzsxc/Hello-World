<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>MiniBlog</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="styles/2.css">
  </head>
  
<body>
<div id="header1">
	<ul>
		<li><a href="rules.jsp">1.条例</a></li>
		<li>2.注册</li>
		<li>3.完成</li>
		<li><a href="index.jsp">退出</a></li>
	</ul>
</div>

<div id="reg">
	<h1>用户注册</h1>	
	
    	<form name="reg" method="post" action="reg_do.jsp">
	<div>
		<dl>
			<dt>以下均为必填项：</dt>
			<dd>用 户 名：<input type="text" name="username" class="text" /></dd>
			<dd>密　　码：<input type="password" name="password" class="text" /></dd>
			<dd>密码确认：<input type="password" name="notpassword" class="text" /></dd>
			<dd>密码提示：<input type="text" name="passt" class="text" /></dd>
			<dd>密码回答：<input type="text" name="passd" class="text" /></dd>
			<dd>性　　别：<input type="radio" name="sex" value="男" checked="checked" /> 男 <input type="radio" name="sex" value="女" /> 女</dd>
			<dd>头　　像：<input type="hidden" name="face" value="face/m01.gif" /><a href="###" onclick="javascript:window.open('face.jsp','newwindow','width=400px,height=400px,scrollbars=1')"><img src="face/m01.gif" id="faceimg" class="face" alt="头像1" /></a></dd>
			<dd>电子邮件：<input type="text" name="email" class="text" /></dd>
			<dd>个人网站：<input type="text" name="url" value="http://" class="text" /></dd>
			<dd>&nbsp;&nbsp;Q&nbsp;Q：&nbsp;&nbsp;  <input type="text" name="qq" class="text" /></dd>
			<dd>验 证 码：<input type="text" name="yzm" class="text yzm" /><img name="yzmimage" src="code.jsp"  alt="验证码" class="yzm"/></dd>
			<dd><input type="submit" name="send" value="注册会员" class="submit2" /></dd>
		</dl>
	</div>
	</form>
	
</div>

<%@include file="footer.jsp"%>	
</body>
</html>