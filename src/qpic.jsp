<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*,java.io.*,java.util.Date" %>
<%

	
	String num = request.getParameter("num");  
	String path = request.getParameter("path");  
	//out.print("<script>alert("+num+");</script>");
%>
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
	<script type="text/javascript">
	function g(q) {
		//window.opener.document.reg.face.value=face
		//window.opener.document.reg.faceimg.src=face
		window.opener.document.post.content.value+="[img code="+q+"]";
	}
</script>
  </head>
  

<body style="width:auto;">
	
	<div id="face">
		<h1>请选择你要的Q图</h1>
		<%
			for(int i = 1 ;i<=Integer.valueOf(num);i++){
		%>
		<ul>
			<li style="float:left;padding-right:40px;padding-bottom:10px;"><img style="cursor:pointer;" src="qpic/<%=path%>/<%=i%>.gif" onclick="g('qpic/<%=path%>/<%=i%>.gif')" /></li>
		</ul>
		<%
			}
		%>

	</div>
	
</body>
</html>