<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*,java.io.*,java.util.Date" %>






<%





//打开数据库
String className="com.microsoft.jdbc.sqlserver.SQLServerDriver";
String urlAddress="jdbc:microsoft:sqlserver://127.0.0.1:1433;DatabaseName=miniblog";
String databaseUsername="shengyong";
String databasePassword="miniblog";
String tableName="G_Article";


Class.forName(className).newInstance();//装载JDBC驱动程序

Connection con = java.sql.DriverManager.getConnection(urlAddress,databaseUsername,databasePassword);

Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);

String sql = "select * from G_Article where G_UserName='"+session.getAttribute("guest")+"'";
int pagesize=10;//每页篇数
     ResultSet rst1=stmt.executeQuery(sql);
     int allcount=0;//博文总条数
     while(rst1.next())
     {
       allcount++;
     }
     
     int allpage=allcount/pagesize+1;//总页数
     //接收传过来的page页码
     int nowpage =Integer.valueOf(request.getParameter("page"));
     //当前页码
     
     int absolutepage = nowpage;
    if(absolutepage<1)
    {
    out.print("<script>alert('没有前一页！');history.back();</script>");
    }
    if(absolutepage>allpage)
    {
    out.print("<script>alert('已经是最后一页！');history.back();</script>");
    }

    rst1.close();


     ResultSet rst=stmt.executeQuery(sql);







	
	


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
  </head>
  
  <body>
  
  
<%@include file="header.jsp"%>
<div id="sidebarmember">
	<h1>管理</h1>	
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

<div id="contentmanage">
<div>
	  <h1>博文管理</h1>	
	<p style="margin-left:40px;"><a href="content.jsp">写博文</a></p>
   		<ul>
			<%
				for(int i = 1+10*(absolutepage-1);i<=10*absolutepage;i++){
					if (!rst.absolute(i)){break;}
			%>
			<li><span>阅读数(<strong><%=rst.getString("G_Read")%></strong>) 评论数(<strong><%=rst.getString("G_CommentCount")%></strong>)</span><img src="kind/icon<%=rst.getString("G_kind")%>.gif" alt="图标" /> <%=rst.getString("G_Title")%></li>
			<%
					}
			%>
		</ul>
		<p style="margin-left:100px;">
			共 <strong><%=allcount%></strong> 篇文章 | <%=absolutepage%>/<%=allpage%>页 | <a href="contentmanage.jsp?page=1">首页</a> |<%if(nowpage==1) {%> 上一页<%}else {%> <a href="contentmanage.jsp?page=<%=absolutepage-1%>">上一页</a><% }%> | <a href="contentmanage.jsp?page=<%=absolutepage+1%>">下一页</a> | <a href="contentmanage.jsp?page=<%=allpage%>">尾页</a>
		</p>
	</div>
</div>


<%@include file="footer.jsp"%>

  </body>
</html>
