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
	<link rel="stylesheet" type="text/css" href="styles/1.css">
  </head>
  
  <body>
    <div id="index">
       <form name="index" method="post" action="">
       <dl>
       <dd><input type="text" name="username" class="text1" /></dd>
       <dd><input type="password" name="password" class="text" /></dd>
       <dd><input type="submit" value="Login" name="send" class="submit" onclick="javascript:this.form.action='index_do.jsp'" /><input type="submit" value="Register" class="submit1"onclick="javascript:this.form.action='rules.jsp'" /></dd>
       </dl>
       </form>
    </div>
  </body>
</html>
