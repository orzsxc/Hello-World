<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*,java.io.*,java.util.Date" %>

<%

//String username = request.getParameter("username");
//username = new String(username.getBytes("ISO8859-1"),"UTF-8");

String password = request.getParameter("password");
password = new String(password.getBytes("ISO8859-1"),"UTF-8");



String email = request.getParameter("email");
email = new String(email.getBytes("ISO8859-1"),"UTF-8");

String url = request.getParameter("url");
url = new String(url.getBytes("ISO8859-1"),"UTF-8");

String qq = request.getParameter("qq");
qq = new String(qq.getBytes("ISO8859-1"),"UTF-8");



String sex =request.getParameter("sex");
sex = new String(sex.getBytes("ISO8859-1"),"UTF-8");

String face =request.getParameter("face");
face = new String(face.getBytes("ISO8859-1"),"UTF-8");

String className="com.microsoft.jdbc.sqlserver.SQLServerDriver";
String urlAddress="jdbc:microsoft:sqlserver://127.0.0.1:1433;DatabaseName=miniblog";
String databaseUsername="shengyong";
String databasePassword="miniblog";
String tableName="G_User";
Class.forName(className).newInstance();//装载JDBC驱动程序

Connection con = java.sql.DriverManager.getConnection(urlAddress,databaseUsername,databasePassword);

Statement stmt=con.createStatement();
String sql;



if (password.equals(""))
{
   sql ="update G_User set G_Email='"+email+"',G_QQ='"+qq+"',G_Sex='"+sex+"',G_Face='"+face+"' where G_UserName='"+session.getAttribute("guest")+"'";
}
else
{

     sql ="update G_User set G_Password='"+password+"',G_Email='"+email+"',G_QQ='"+qq+"',G_Sex='"+sex+"',G_Face='"+face+"' where G_UserName='"+session.getAttribute("guest")+"'";
}

int col=stmt.executeUpdate(sql);


stmt.close();
con.close();
out.print("<script>alert('修改成功！');location.href='member.jsp'</script>");

%>