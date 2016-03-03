<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*,java.io.*,java.util.Date" %>
<%
int kind = Integer.valueOf(request.getParameter("kind"));
int temp=0;
String  title = request.getParameter("title");
title = new String(title.getBytes("ISO8859-1"),"UTF-8");

String content=request.getParameter("content");
content = new String(content.getBytes("ISO8859-1"),"UTF-8");

//String username = session.getAttribute("guest");

String className="com.microsoft.jdbc.sqlserver.SQLServerDriver";
String urlAddress="jdbc:microsoft:sqlserver://127.0.0.1:1433;DatabaseName=miniblog";
String databaseUsername="shengyong";
String databasePassword="miniblog";
String tableName="G_Article";
Class.forName(className).newInstance();//装载JDBC驱动程序
Connection con = java.sql.DriverManager.getConnection(urlAddress,databaseUsername,databasePassword);
Statement stmt=con.createStatement();
String sql="insert into "+tableName+" (G_UserName,G_Kind,G_Title,G_Content,G_Date,G_Read,G_CommentCount) values('"+session.getAttribute("guest")+"',"+kind+",'"+title+"','"+content+"','"+(new Date())+"',"+temp+","+temp+")";
stmt.execute(sql);
stmt.close();
con.close();

out.print("<script>alert('博文发表成功！');location.href='contentmanage.jsp?page=1'</script>");


%>