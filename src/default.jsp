<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*,java.io.*,java.util.Date" %>
<% 
//从vip。text中提取数据更新新进博友模块
File file=new File("vip.txt");
BufferedReader reader = new BufferedReader(new FileReader(file));
String username = reader.readLine();
String face=reader.readLine();
String email=reader.readLine();
String url=reader.readLine();



int pagesize=10;//每页篇数



//打开数据库
String className="com.microsoft.jdbc.sqlserver.SQLServerDriver";
String urlAddress="jdbc:microsoft:sqlserver://127.0.0.1:1433;DatabaseName=miniblog";
String databaseUsername="shengyong";
String databasePassword="miniblog";
String tableName="G_Article";
String sql = "select * from G_Article order by G_ID desc";

Class.forName(className).newInstance();//装载JDBC驱动程序

Connection con = java.sql.DriverManager.getConnection(urlAddress,databaseUsername,databasePassword);

//Statement stmt=con.createStatement();
Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);


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
    // out.print("<script>alert('"+nowpage+"');</script>");
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
     //psmt =con.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);


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
<div id="sidebar">
	<h1>新进博友:<%=username%></h1>	
	<div>
		<dl>
		<dt><img src="<%=face%>" alt="新进博友" /></dt>
		<dd>&nbsp;&nbsp;&nbsp;&nbsp;给我送花 | 写短信</dd>
		<dd>&nbsp;&nbsp;&nbsp;&nbsp;加为好友 | 写留言</dd>
		<dd>邮件：<a href="mailto:<%=email%>"><%=email%></a></dd>
		<dd>网站：<a href="<%=url%>" target="_blank"><%=url%></a></dd>
		</dl>
	</div>
</div>

<div id="content">
	<h1>文章列表</h1>	
	<div>
		<ul>
			<%
				for(int i = 1+10*(absolutepage-1);i<=10*absolutepage;i++){
				    //rst.absolute(i-1);
					if (!rst.absolute(i)){break;}
			%>
			<li><span>阅读数(<strong><%=rst.getString("G_Read")%></strong>) 评论数(<strong><%=rst.getString("G_CommentCount")%></strong>)</span><img src="kind/icon<%=rst.getString("G_kind")%>.gif" alt="图标" /> <a href="article.jsp?ShowId=<%=rst.getString("G_ID")%>&page=1"><%=rst.getString("G_Title")%></a></li>
			<%
					}
			%>
		</ul>
		<p>
			共 <strong><%=allcount%></strong> 篇文章 | <%=absolutepage%>/<%=allpage%>页 | <a href="default.jsp?page=1">首页</a>| <%if(nowpage==1) {%> 上一页<%}else {%> <a href="default.jsp?page=<%=absolutepage-1%>">上一页</a><% }%>| <a href="default.jsp?page=<%=absolutepage+1%>">下一页</a> | <a href="default.jsp?page=<%=allpage%>">尾页</a>
		</p>
	</div>
</div>

<%@include file="footer.jsp"%>

  </body>
</html>
<%rst.close();
stmt.close();
con.close();
%>