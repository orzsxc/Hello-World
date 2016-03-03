<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*,java.io.*,java.util.Date" %>
<%
String title=request.getParameter("title");
title = new String(title.getBytes("ISO8859-1"),"UTF-8");

String content=request.getParameter("content");
content = new String(content.getBytes("ISO8859-1"),"UTF-8");
String username=session.getAttribute("guest").toString();

int showid=Integer.valueOf(request.getParameter("ShowId"));

String className="com.microsoft.jdbc.sqlserver.SQLServerDriver";
String urlAddress="jdbc:microsoft:sqlserver://127.0.0.1:1433;DatabaseName=miniblog";
String databaseUsername="shengyong";
String databasePassword="miniblog";

Class.forName(className).newInstance();//装载JDBC驱动程序

Connection con = java.sql.DriverManager.getConnection(urlAddress,databaseUsername,databasePassword);

Statement stmt=con.createStatement();
String sql="insert into G_Repost(G_UserName,G_Title,G_Content,G_SID,G_Date) values('"+username+"','"+title+"','"+content+"',"+showid+",'"+(new Date())+"')";


stmt.execute(sql);
stmt.close();
con.close();

out.print("<script>alert('留言成功！');location.href='article.jsp?ShowId="+showid+"&page=1'</script>");


%>