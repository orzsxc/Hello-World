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
//计算表的长度
ResultSet rst=stmt.executeQuery("Select * from "+tableName);
int datacount=0;
while(rst.next())
{
datacount++;
}
rst.close();

int pagesize=10;
String pagenumber=request.getParameter("pagenumber");
if(pagenumber==null)
{
  pagenumber="1";
}
//out.print("<script>alert('"+pagenumber+"');</script>");
int id=(Integer.parseInt(pagenumber)-1)*pagesize+1;
int pagecount1=datacount/pagesize;
int pagecount2=datacount%pagesize;
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
  
<body>&nbsp; 
<%@include file="header.jsp"%>

<div id="blog">
	<h1>博友列表</h1>	
	<div>
	<form method="post" action="plan01.jsp">
	
	<input type="radio" name="kind" value="精确" checked="checked"  />精确
	<input type="radio" name="kind" value="模糊" />模糊
	关键字：<input type="text" name="keyword" class="text" /><input type="submit" name="send" value="查询" class="submit" />
	
	
	</form>
	
	
	
	  <%
	    
     if(Integer.parseInt(pagenumber)!=(pagecount1+1))
     {
	  for(int i=id;i<(id+pagesize);i++)
	  {
	    //out.print("<script>alert('"+i+"');</script>");
	    rst=stmt.executeQuery("Select * from "+tableName+" where G_ID="+i);
	    rst.next();
	   
	   %>
	  		<dl>
			<dt><%=rst.getString("G_UserName") %></dt>
			<dd><img src="<%=rst.getString("G_Face") %>" alt="<%=rst.getString("G_UserName") %>" /></dd>
			<dd>给我送花 | 写短信</dd>
			<dd>加为好友 | 写留言</dd>
		    </dl>
	  <%  
	       	 rst.close();       
	   }
	  }
	  else
	  {
	  for(int i=id;i<(id+pagecount2);i++)
	  {
	    //out.print("<script>alert('"+i+"');</script>");
	    rst=stmt.executeQuery("Select * from "+tableName+" where G_ID="+i);
	    rst.next();
	  %>
	  		<dl>
			<dt><%=rst.getString("G_UserName") %></dt>
			<dd><img src="<%=rst.getString("G_Face") %>" alt="<%=rst.getString("G_UserName") %>" /></dd>
			<dd>给我送花 | 写短信</dd>
			<dd>加为好友 | 写留言</dd>
		    </dl>	  
	  <%
	   rst.close();
	  }
	  }
	  %>
	  <span id="page">
			<ul>
				<%
				
				for(int i = 1;i<=pagecount1+1;i++)
				{
				%>
				<li><a href="blog.jsp?pagenumber=<%=i%>"><%=i%></a></li>
				<%
				}
				%>
		</ul>
		</span>
	</div>
</div>

<%@include file="footer.jsp"%>	
</body>
</html>
<%

stmt.close();
con.close();
 %>
