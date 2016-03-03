<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*,java.io.*,java.util.Date" %>


<% 
//各类验证


String username = request.getParameter("username");
username = new String(username.getBytes("ISO8859-1"),"UTF-8");

String password = request.getParameter("password");
password = new String(password.getBytes("ISO8859-1"),"UTF-8");

String notpassword = request.getParameter("notpassword");
notpassword = new String(notpassword.getBytes("ISO8859-1"),"UTF-8");

String passt = request.getParameter("passt");
passt = new String(passt.getBytes("ISO8859-1"),"UTF-8");

String passd = request.getParameter("passd");
passd = new String(passd.getBytes("ISO8859-1"),"UTF-8");

String email = request.getParameter("email");
email = new String(email.getBytes("ISO8859-1"),"UTF-8");

String url = request.getParameter("url");
url = new String(url.getBytes("ISO8859-1"),"UTF-8");

String qq = request.getParameter("qq");
qq = new String(qq.getBytes("ISO8859-1"),"UTF-8");

String yzm = request.getParameter("yzm");
yzm = new String(yzm.getBytes("ISO8859-1"),"UTF-8");

String sex =request.getParameter("sex");
sex = new String(sex.getBytes("ISO8859-1"),"UTF-8");

String face =request.getParameter("face");
face = new String(face.getBytes("ISO8859-1"),"UTF-8");


//out.print("<script>alert('"+username+"');</script>");
//用户名验证
//out.print(username);


if(username.equals(null) || username.length() < 2)
{
  out.print("<script>alert('用户名不得为空或者少于两位');history.back();</script>");
  return;
}

//密码验证
if(password==""||password.length()<6)
{
  out.print("<script>alert('密码不得为空或者少于6位');history.back();</script>");
  return;
}

//密码和密码确认
if(!password.equals(notpassword))
{
  out.print("<script>alert('密码和确认密码不一致');history.back();</script>");
  return;
}

//密码提示
if(passt==""||passt.length()<3)
{
 out.print("<script>alert('密码提示不得为空或者不得少于3位');history.back();</script>");
 return;
}

//密码回答
if(passd==""||passd.length()<2)
{
out.print("<script>alert('密码回答不得为空或者不得少于3位');history.back();</script>");
return;
}

//密码提示和密码回答不得一致
if(passd.equals(passt))
{
out.print("<script>alert('密码提示不得和密码回答一致');history.back();</script>");
return;
}

//电子邮件
int epos=email.indexOf('@');
int dpos1=email.indexOf('.');
int emaillen=email.length();
int nns=emaillen-dpos1-1;
if(email=="")
{
 out.print("<script>alert('电子邮件不得为空');history.back();</script>");
 return;
}else if(epos < 1)
{
 out.print("<script>alert('电子邮件格式中缺少@符号');history.back();</script>");
 return;
}else if(dpos1 < 1)
{
out.print("<script>alert('电子邮件格式中缺少.符号');history.back();</script>");
return;
}else if(epos<4)
{
out.print("<script>alert('电子邮件名必须大于3位');history.back();</script>");
return;
}else if(nns <2)
{
out.print("<script>alert('域名后缀必须大于2位或等于2位');history.back();</script>");
return;
}

//个人网站
if(url==""||url=="http://")
{
  url="该用户没有个人网站";
}

//qq
if(qq==""||qq.length()<5||qq.length()>11)
{
out.print("<script>alert('QQ必须是5-10位之间');history.back();</script>");
return;
}

//验证码
if(!yzm.equals(session.getAttribute("rand")))
{
out.print("<script>alert('验证码错误！');history.back();</script>");
return;
}




String className="com.microsoft.jdbc.sqlserver.SQLServerDriver";
String urlAddress="jdbc:microsoft:sqlserver://127.0.0.1:1433;DatabaseName=miniblog";
String databaseUsername="shengyong";
String databasePassword="miniblog";
String tableName="G_User";


try{


Class.forName(className).newInstance();//装载JDBC驱动程序

Connection con = java.sql.DriverManager.getConnection(urlAddress,databaseUsername,databasePassword);

Statement stmt=con.createStatement();
//注册之前先验证用户名是否重复
ResultSet rst=stmt.executeQuery("Select * from "+tableName+" where G_UserName ='"+username+"'");
if(rst.next())
{
rst.close();
stmt.close();
con.close();
out.print("<script>alert('用户名重复，请重新注册');history.back();</script>");
return;
}else
{
rst.close();
}

//存入数据库

String sql="insert into "+tableName+" (G_UserName,G_PassWord,G_PassT,G_PassD,G_Email,G_QQ,G_Url,G_Sex,G_Face,G_Date) values('"+username+"','"+password+"','"+passt+"','"+passd+"','"+email+"','"+qq+"','"+url+"','"+sex+"','"+face+"','"+(new Date())+"')";
stmt.execute(sql);

stmt.close();
con.close();
}catch(Exception e){e.printStackTrace();}

//创建一个文件存入新进博友的信息
File file=new File("vip.txt");
FileWriter writer = new FileWriter(file);
writer.write(username+"\r\n");
writer.write(face+"\r\n");
writer.write(email+"\r\n");
writer.write(url);
writer.close();

  out.print("<script>alert('恭喜你，迷你博客注册成功！');location.href='index.jsp'</script>");




%>