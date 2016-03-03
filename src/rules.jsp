<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

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
<div id="header1">
	<ul>
		<li><a href="rules.jsp">1.条例</a></li>
		<li>2.注册</li>
		<li>3.完成</li>
		<li><a href="index.jsp">退出</a></li>
	</ul>
</div>

<div id="rules">
	<h1>管理条例</h1>	
    <form name="relus" action="reg.jsp">
	<div>
	<dl>
	<dt>请用户注册之前，仔细阅读下列管理条例：</dt><br></br>
	<dd>⑴迷你博客依据并贯彻《全国人民代表大会常务委员会关于加强网络信息保护的决定》（详情：http://www.npc.gov.cn/npc/xinwen/2012-12/29/content_1749526.htm）的文件精神，制定《 迷你博客服务使用协议 》。湖南科技大学计算机科学与工程学院信息安全3班迷你博客系统制作小组同意按照本协议 的规定及其不时发布的操作规则提供基于互联网以及移动网的博客服务（以下称“微博服务”），为获得微博服务，微博服务使用人（以下称“用户”）应 当基于了解本协议全部内容，在独立思考的基础上认可、同意本协议的全部条款并按照页面上的提示完成全部的注册程序。用户在进行注册程序过程中点击“同意” 按钮即表示用户完全接受本协议项下的全部条款以及《网络服务使用协议》之全部约定。如本协议条款与《网络服务使用协议》之约定相冲突，以本协议为准。 </dd><br></br>
	<dd>⑵用户注册成功后，将为用户基于微博服务使用的客观需要而在申请、注册微博服务时，按照注册要求提供的帐号开通微博服务，用户有权在新浪公司为其开 通、并同意向其提供服务的基础上使用微博服务。该用户帐号和密码由用户负责保管；用户使用微博服务过程中，须对自身使用微博服务的行为，对任何由用户通过 微博服务服务发布、公开的信息，及对由此产生的任何后果承担全部责任。用户提交、发布或显示的信息将对其他微博服务用户及第三方服务及网站可见 (用户可通过设置功能自行控制、把握可查阅其信息的帐号类型)。</dd><br></br>
	<dd>⑶用户注册成功后，在使用微博服务的过程中，迷你博客系统制作小组有权基于用户的操作行为进行非商业性的调查研究。</dd><br></br>
    <dd>⑷微博服务的具体内容由新浪公司根据实际情况提供，包括但不限于授权用户通过其帐号，使用微博服务发布观点、评论、图片、视频、转发链接等，新浪公司有 权对其提供的服务进行扩展，且新浪公司提供的服务的性质可能随时变更，用户将不会收到新浪公司关于服务性质变更的通知，除非新浪公司认为情况必要。</dd><br></br>
    <dd>⑸公司提供的微博服务中将有可能包含需要使用者通过公司的虚拟货币系统购买微博平台的虚拟货币，进行间接付费的服务，用户将根据新浪公司虚拟货币系 统的流程和方式，通过以真实货币购买虚拟货币，再以该虚拟货币购买用户想要使用的收费微博服务，并最终获得使用权限。对于收费的微博服务，公司会在用 户使用之前给予用户明确的提示，只有用户根据提示确认其愿意按照微博服务的支付方式支付费用并实际操作进行了支付行为，用户才能使用该等收费微博服务。如 用户拒绝进行支付操作流程，那么用户将不能使用相应的收费微博服务。</dd><br></br>
    <dd>⑹鉴于网络服务的特殊性，用户同意公司有权随时变更、中断或终止部分或全部的微博服务（包括收费网络服务）。如变更、中断或终止的网络服务属于免费微博 服务，新浪公司无需通知用户，且新浪公司不应对用户或第三方承担任何责任；如变更、中断或终止的微博服务属于收费服务，新浪公司应当在变更、中断或终止之 前事先通知用户，并应向受影响的用户提供等值的替代性的收费网络服务，如用户不愿意接受替代性的收费网络服务，就该用户已经向新浪公司支付的虚拟货币，公司应当按照该用户实际使用相应收费服务的情况扣除相应虚拟货币之后将剩余的虚拟货币退还用户的虚拟货币账户中。</dd><br></br>
	<dd>⑺用户理解，公司需要定期或不定期地对提供微博服务的平台（如互联网网站、移动网络等）或相关的设备进行检修或者维护，如因此类情况而造成收费服务在合理时间内的中断，公司无需为此承担任何责任，但公司应尽可能事先进行通告。</dd><br></br>
	<dd><input type="submit" value="下一步" class="submit"/></dd>
	</dl>
		
	</div>
	</form>
</div>

<%@include file="footer.jsp"%>	
</body>
</html>