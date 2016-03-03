<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*,java.io.*,java.util.Date" %>
<% 
String username = request.getParameter("username");
username = new String(username.getBytes("ISO8859-1"),"UTF-8");

String password = request.getParameter("password");
password = new String(password.getBytes("ISO8859-1"),"UTF-8");


if(username.equals(""))
{
  out.print("<script>alert('用户名不得为空!');history.back();</script>");
  return;
}

//密码验证
if(password.equals(""))
{
  out.print("<script>alert('密码不得为空!');history.back();</script>");
  return;
}


String className="com.microsoft.jdbc.sqlserver.SQLServerDriver";
String urlAddress="jdbc:microsoft:sqlserver://127.0.0.1:1433;DatabaseName=miniblog";
String databaseUsername="shengyong";
String databasePassword="miniblog";
String tableName="G_User";

//try{


Class.forName(className).newInstance();//装载JDBC驱动程序

Connection con = java.sql.DriverManager.getConnection(urlAddress,databaseUsername,databasePassword);

Statement stmt=con.createStatement();
//注册之前先验证用户名是否重复
ResultSet rst=stmt.executeQuery("Select * from "+tableName+" where G_UserName ='"+username+"' and G_PassWord='"+password+"'");
if(rst.next())
{
rst.close();
stmt.close();
con.close();
session.setAttribute("guest", username);

out.print("<script>alert('用户登陆成功!');location.href='default.jsp?page=1'</script>");
return;
}else
{
rst.close();
stmt.close();
con.close();
out.print("<script>alert('用户名输入错误或密码输入错误！');history.back();</script>");
return;
}

//存入数据库


//}catch(Exception e){e.printStackTrace();}

%>