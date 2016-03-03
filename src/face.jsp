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
	
	
	
	<script type="text/javascript">
	function g(face) {
		window.opener.document.reg.face.value=face;
		window.opener.document.reg.faceimg.src=face;
	}
    </script>

  </head>
  
  <body style="width:400px;">
	
	<div id="face">
		<h1>请选择你要的头像</h1>
		<%for (int i = 1;i < 10;i++){%>
		<dl>
			<dd><img src="face/m0<%=i%>.gif" alt="头像" onclick="g('face/m0<%=i%>.gif')" /></dd>
		</dl>
	<%}%>
		<%for(int i = 10;i<65;i++){%>
		<dl>
			<dd><img src="face/m<%=i%>.gif" alt="头像" onclick="g('face/m<%=i%>.gif')" /></dd>
		</dl>
	   <% }%>
		
	</div>
	
</body>
</html>