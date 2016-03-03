<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*,java.io.*,java.util.Date" %>
<%

int showid=Integer.valueOf(request.getParameter("ShowId"));
String className="com.microsoft.jdbc.sqlserver.SQLServerDriver";
String urlAddress="jdbc:microsoft:sqlserver://127.0.0.1:1433;DatabaseName=miniblog";
String databaseUsername="shengyong";
String databasePassword="miniblog";
String tableName="G_Article";
String sql="select * from "+tableName+" where G_ID = "+showid;
Class.forName(className).newInstance();//装载JDBC驱动程序

Connection con = java.sql.DriverManager.getConnection(urlAddress,databaseUsername,databasePassword);
Statement stmt=con.createStatement();
ResultSet rst=stmt.executeQuery(sql);
rst.next();

int kind = Integer.valueOf(rst.getString("G_Kind"));
String skind="未命名";
if(kind==1)
{
skind="原创";
}else if(kind==2)
{
  skind="转帖";
}else if(kind==3)
{
skind="图片";
}else if(kind==4)
{
skind="下载";
}else if(kind==5)
{
skind="音乐";
}else if(kind==6)
{
skind="文档";
}else if(kind==7)
{
 skind="视频";
}
String title=rst.getString("G_Title");
String content=rst.getString("G_Content"); 

String username=rst.getString("G_UserName");

String sql1="select * from G_User where G_UserName = '"+username+"'";
ResultSet rst1=stmt.executeQuery(sql1);
rst1.next();
String url = rst1.getString("G_Url");
String email=rst1.getString("G_Email");
String face=rst1.getString("G_Face");
String date=rst1.getString("G_Date");
rst1.close();
rst.close();
 stmt.close();
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
		<script type="text/javascript" src="js/ubb.js"></script>
  </head>
  
  <body>
  <%@include file="header.jsp"%>
<div id="article" onmouseup="fonthid();">

<h1>文章详情</h1>
<div id="acontent">
<dl class="person">
<dt><%=username%></dt>
<dd><img src="<%=face %>" alt="盛勇" /></dd>
<dd>给我送花 | 写短信</dd>
<dd>加为好友 | 写留言</dd>
<dd class="a"><%=email %></dd>
<dd class="a"><%=url %></dd>
</dl>
  <div>
  <p class="top"><em>#1</em> <img src="images/member.gif" /> <%=username %> | <%=date %></p>
  <h2>[<%=skind%>]<%=title %></h2>
  <p class="content"><%=content%></p>
  
  </div>
  <p class="line"></p>



<%
Statement stmt1 = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
String sql2 = "select * from G_Repost where G_SID="+showid;
int pagesize=10;//每页篇数
     ResultSet rst2=stmt1.executeQuery(sql2);
     int allcount=0;//博文总条数
     while(rst2.next())
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

    rst2.close();


     ResultSet rst3=stmt1.executeQuery(sql2);




%>
 
 
 
			<%
				for(int i = 1+10*(absolutepage-1);i<=10*absolutepage;i++){
					if (!rst3.absolute(i)){break;}
					String usernametemp=rst3.getString("G_UserName");
					String titletemp=rst3.getString("G_Title");
					String contenttemp=rst3.getString("G_Content");
					String datetemp=rst3.getString("G_Date");
Statement stmt2=con.createStatement();
					String sql3="select * from G_User where G_UserName='"+usernametemp+"'";
					ResultSet rst4=stmt2.executeQuery(sql3);
					rst4.next();
					String facetemp=rst4.getString("G_Face");
					String urltemp=rst4.getString("G_Url");
					String emailtemp=rst4.getString("G_Email");
					
			%> 		
<dl class="person">
<dt><%=usernametemp %></dt>
<dd><img src="<%=facetemp %>" alt="盛勇" /></dd>
<dd>给我送花 | 写短信</dd>
<dd>加为好友 | 写留言</dd>
<dd class="a"><%=emailtemp %></dd>
<dd class="a"><%=urltemp %></dd>
</dl>	
<div>
  <p class="top"><em>#2</em> <img src="images/member.gif" /> <%=usernametemp %> | <%=datetemp%></p>
  <h2>[回帖]<%=titletemp %></h2>
  <p class="content"><%=contenttemp %></p>
  
</div>  		
<p class="line" style="padding-top:50px;"></p>  		
  
			<%
					}
			%>  
  		<p style="margin-left:250px;margin-top:50px;">
			共 <strong><%=allcount%></strong> 篇留言 | <%=absolutepage%>/<%=allpage%>页 | <a href="article.jsp?page=1&ShowId=<%=showid %>">首页</a> |<%if(nowpage==1) {%> 上一页<%}else {%> <a href="article.jsp?page=<%=absolutepage-1%>&ShowId=<%=showid %>">上一页</a><% }%> | <a href="article.jsp?page=<%=absolutepage+1%>&ShowId=<%=showid %>">下一页</a> | <a href="article.jsp?page=<%=allpage%>&ShowId=<%=showid %>">尾页</a>
		</p>
  
  
  		
 		<form id="postbd" method="post" name="post" action="repost_do.jsp?ShowId=<%=showid%>">
			<dl>
				<dd>回复标题：				
					<input type="text" name="title" class="text" value="RE:<%=title %>" />
				</dd>
				<dd>插入Q 图：
					  <a href="###" onclick="javascript:window.open('qpic.jsp?path=1&num=48','newwindow','width=400,height=400,scrollbars=1')">Q图一</a>
					  <a href="###" onclick="javascript:window.open('qpic.jsp?path=2&num=10','newwindow','width=400,height=400,scrollbars=1')">Q图二</a>  
					  <a href="###" onclick="javascript:window.open('qpic.jsp?path=3&num=39','newwindow','width=400,height=400,scrollbars=1')">Q图三</a>
				</dd>
				<dd>
					<div id="ubb" style="position:relative;left:-168px;">
						<img src="ubb/fontsize.gif" onclick="fontsize();" alt="字体大小" class="first" />
						<img src="ubb/bold.gif" alt="粗体" onclick="bold();" />
						<img src="ubb/italic.gif" alt="倾斜" onclick="it();" />
						<img src="ubb/underline.gif" alt="下划线" onclick="under();" />
						<img src="ubb/strikethrough.gif" alt="删除线" onclick="del();"  />
						<img src="ubb/space.gif" alt="分割线" />
						<img src="ubb/color.gif" alt="字体颜色" onclick="fontcolor();" />
						<img src="ubb/url.gif" alt="插入超链接" onclick="url();" />
						<img src="ubb/email.gif" alt="插入电子邮件"  onclick="email();" />
						<img src="ubb/space.gif" alt="分割线" />
						<img src="ubb/image.gif" alt="插入图片" onclick="img();" />
						<img src="ubb/swf.gif" alt="插入FLASH" />
						<img src="ubb/movie.gif" alt="插入影片" />
						<img src="ubb/space.gif" alt="分割线" />
						<img src="ubb/left.gif" alt="左对齐" />
						<img src="ubb/center.gif" alt="居中" />
						<img src="ubb/right.gif" alt="右对齐" />
						<img src="ubb/br.gif" style="position:relative;top:4px;" alt="换行" onclick="br();" />
						<img src="ubb/space.gif" alt="分割线" />
						<img src="ubb/increase.gif" onclick="out();" alt="增加长度" />
						<img src="ubb/decrease.gif" onclick="ind();" alt="降低长度" />
						<img src="ubb/help.gif" alt="ubb帮助" />
					</div>
					<span id="fontDiv">
						<strong onclick="font(10)">10px</strong>
						<strong onclick="font(12)">12px</strong>
						<strong onclick="font(14)">14px</strong>
						<strong onclick="font(16)">16px</strong>
						<strong onclick="font(18)">18px</strong>
						<strong onclick="font(20)">20px</strong>
						<strong onclick="font(22)">22px</strong>
						<strong onclick="font(24)">24px</strong>
					</span>
					<span id="colorDiv">
							<strong title="黑色" style="background:#000" onclick="showcolor('#000')"></strong>
							<strong title="褐色" style="background:#930" onclick="showcolor('#930')"></strong>
							<strong title="橄榄树" style="background:#330" onclick="showcolor('#330')"></strong>
							<strong title="深绿" style="background:#030" onclick="showcolor('#030')"></strong>
							<strong title="深青" style="background:#036" onclick="showcolor('#036')"></strong>
							<strong title="深蓝" style="background:#000080" onclick="showcolor('#000080')"></strong>
							<strong title="靓蓝" style="background:#339" onclick="showcolor('#339')"></strong>
							<strong title="灰色-80%" style="background:#333" onclick="showcolor('#333')"></strong>
							<strong title="深红" style="background:#800000" onclick="showcolor('#800000')"></strong>
							<strong title="橙红" style="background:#f60" onclick="showcolor('#f60')"></strong>
							<strong title="深黄" style="background:#808000" onclick="showcolor('#000')"></strong>
							<strong title="深绿" style="background:#008000" onclick="showcolor('#808000')"></strong>
							<strong title="绿色" style="background:#008080" onclick="showcolor('#008080')"></strong>
							<strong title="蓝色" style="background:#00f" onclick="showcolor('#00f')"></strong>
							<strong title="蓝灰" style="background:#669" onclick="showcolor('#669')"></strong>
							<strong title="灰色-50%" style="background:#808080" onclick="showcolor('#808080')"></strong>
							<strong title="红色" style="background:#f00" onclick="showcolor('#f00')"></strong>
							<strong title="浅橙" style="background:#f90" onclick="showcolor('#f90')"></strong>
							<strong title="酸橙" style="background:#9c0" onclick="showcolor('#9c0')"></strong>
							<strong title="海绿" style="background:#396" onclick="showcolor('#396')"></strong>
							<strong title="水绿色" style="background:#3cc" onclick="showcolor('#3cc')"></strong>
							<strong title="浅蓝" style="background:#36f" onclick="showcolor('#36f')"></strong>
							<strong title="紫罗兰" style="background:#800080" onclick="showcolor('#800080')"></strong>
							<strong title="灰色-40%" style="background:#999" onclick="showcolor('#999')"></strong>
							<strong title="粉红" style="background:#f0f" onclick="showcolor('#f0f')"></strong>
							<strong title="金色" style="background:#fc0" onclick="showcolor('#fc0')"></strong>
							<strong title="黄色" style="background:#ff0" onclick="showcolor('#ff0')"></strong>
							<strong title="鲜绿" style="background:#0f0" onclick="showcolor('#0f0')"></strong>
							<strong title="青绿" style="background:#0ff" onclick="showcolor('#0ff')"></strong>
							<strong title="天蓝" style="background:#0cf" onclick="showcolor('#0cf')"></strong>
							<strong title="梅红" style="background:#936" onclick="showcolor('#936')"></strong>
							<strong title="灰度-20%" style="background:#c0c0c0" onclick="showcolor('#c0c0c0')"></strong>
							<strong title="玫瑰红" style="background:#f90" onclick="showcolor('#f90')"></strong>
							<strong title="茶色" style="background:#fc9" onclick="showcolor('#fc9')"></strong>
							<strong title="浅黄" style="background:#ff9" onclick="showcolor('#ff9')"></strong>
							<strong title="浅绿" style="background:#cfc" onclick="showcolor('#cfc')"></strong>
							<strong title="浅青绿" style="background:#cff" onclick="showcolor('#cff')"></strong>
							<strong title="浅蓝" style="background:#9cf" onclick="showcolor('#9cf')"></strong>
							<strong title="淡紫" style="background:#c9f" onclick="showcolor('#c9f')"></strong>
							<strong title="白色" style="background:#fff" onclick="showcolor('#fff')"></strong>
					</span>
					<textarea name="content" style="height:200px"></textarea>
				</dd>
				<dd><input type="submit" value="回复" class="submit" /></dd>
			</dl>			
		</form> 		
  		
</div>
</div>
<%@include file="footer.jsp"%>
  </body>
</html>
<%
stmt.close();
con.close();
%>
