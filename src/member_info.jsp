<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*,java.io.*,java.util.Date" %>






<%

String className="com.microsoft.jdbc.sqlserver.SQLServerDriver";
String urlAddress="jdbc:microsoft:sqlserver://127.0.0.1:1433;DatabaseName=miniblog";
String databaseUsername="shengyong";
String databasePassword="miniblog";
String tableName="G_User";


Class.forName(className).newInstance();//装载JDBC驱动程序

Connection con = java.sql.DriverManager.getConnection(urlAddress,databaseUsername,databasePassword);

Statement stmt=con.createStatement();



	
	

	String sql = "select * from G_User where G_UserName='"+session.getAttribute("guest")+"'";
     ResultSet rst=stmt.executeQuery(sql);
	rst.next();
	//if (rst.next())
	//{
		String username = rst.getString("G_UserName");
		String sex = rst.getString("G_Sex");
		String face = rst.getString("G_Face");
		String url = rst.getString("G_Url");
		String qq = rst.getString("G_QQ");
		String email = rst.getString("G_Email");
	//}
	//else
	//{
		
	//	out.print("<script>alert('非法操作2!');history.back();</script>") ;
	//	return;
	
	//}
	
	rst.close();
    stmt.close();
    con.close();
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
	<script type="text/javascript" src="js/member.js"></script>
  </head>
  
  <body>
  
  
<%@include file="header.jsp"%>
<div id="sidebarmember">
	<h1>会员管理</h1>	
	<div>
		
		<dl>
			<dt>个人信息</dt>
			<dd><a href="member.jsp">个人资料</a></dd>
			<dd><a href="member_info.jsp">资料修改</a></dd>
			<dd>短信管理</dd>
			<dd>好友管理</dd>
			<dd><a href="contentmanage.jsp?page=1">博文管理</a></dd>
			<dd>查看花朵</dd>
		</dl>
		
	</div>
</div>

<div id="contentmember">
	<h1>会员个人中心</h1>	
	<div>
		<form method="post" name="reg" action="member_info_do.jsp">
		<dl>
			<dd>用 户 名：<%=username%></dd>
			<dd>密　　码：<input type="password" class="text" name="password" />(*留空则不修改)</dd>
			<dd>性　　别：<input type="radio" name="sex" value="男" <%if( sex.equals("男") ) out.print("checked='checked'"); %> /> 男 <input type="radio" name="sex" <%if( sex.equals("女") ) out.print("checked='checked'"); %> value="女" /> 女</dd>
			<dd>头　　像：<input onclick="javascript:window.open('face.jsp','face','width=400,height=400,scrollbars=1')" type="text" name="face" readonly="readonly" value="<%=face%>" class="text" /><img src="face/m01.gif" id="faceimg" alt="头像" /></dd>
			<dd>Q　　Q ：  <input type="text" name="qq" value="<%=qq%>" class="text" /></dd>
			<dd>E-MAIL:&nbsp;&nbsp;&nbsp;<input type="text" name="email" value="<%=email%>" class="text" /></dd>
			<dd>个人网站：<input type="text" name="url" value="<%=url%>" class="text" /></dd>
			<dd><input type="submit" value="修改资料" onclick="return check();" name="send" class="submit" /></dd>
		</dl>
		</form>
	</div>
</div>

<%@include file="footer.jsp"%>

  </body>
</html>
