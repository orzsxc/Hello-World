function check() {
	var atpos=document.reg.email.value.indexOf("@",1);
	var pepos=document.reg.email.value.indexOf(".",atpos);
	//筛选出@在这个邮件的位置
	if (document.reg.username.value == "") {		
		alert ("请输入您登陆的用户名!");
		document.reg.username.focus();		
		return false;
	}
	if (document.reg.username.value.length < 2) {
		alert("用户名不能少于2位!");
		document.reg.username.focus();
		return false;
	}
	if (document.reg.password.value == ""){
		alert ("请输入您的登陆密码！");	
		document.reg.password.focus();
		return false;
	}
	if (document.reg.password.value.length < 6){
		alert ("密码不能少于6位！");	
		document.reg.password.focus();
		return false;
	}
	if (document.reg.notpassword.value == ""){
		alert ("请输入您的确认密码！");	
		document.reg.notpassword.focus();
		return false;
	}
	if (document.reg.password.value != document.reg.notpassword.value){
		alert ("你的密码和密码确认不一致,请重新输入！");	
		document.reg.notpassword.focus();
		return false;
	}
	if (document.reg.passt.value == "") {		
		alert ("请输入您的密码提示!");
		document.reg.passt.focus();		
		return false;
	}
	if (document.reg.passd.value == "") {		
		alert ("请输入您的密码回答!");
		document.reg.passd.focus();		
		return false;
	}
	if (document.reg.passt.value == document.reg.passd.value){
		alert ("密码提示不得与密码回答一致！");	
		document.reg.passd.focus();
		return false;
	}
	if (document.reg.email.value == "") {		
		alert ("邮件不得为空！");
		document.reg.email.focus();		
		return false;
	}
	if (atpos==-1) { //如果有@返回@的位置,如果没有则返回-1
		alert ("请输入的邮件缺少@");
		document.reg.email.focus();
		return false;	
	}
	if (document.reg.email.value.indexOf("@",atpos+1) != -1) {
		alert ("邮件中不能同时输入两个@");//不能同时出现两个
		document.reg.email.focus();
		return false;
	}
	if (pepos==-1) {//检查是否有.
		alert("邮件中缺少.");
		document.reg.email.focus();
		return false;	
	}
	if (pepos+3>document.reg.email.value.length) {//.后面有2个字符
		alert ("邮件中.后没有至少2个字符!");
		document.reg.email.focus();
		return false;
	}
	if (document.reg.qq.value=="") {
		alert ("QQ不得为空！");
		document.reg.qq.focus();
		return false;
	}
	if (document.reg.qq.value=="") {
		alert ("QQ不得为空！");
		document.reg.qq.focus();
		return false;
	}
	if (isNaN(document.reg.qq.value)) {
		alert("QQ必须是数字！");
		document.reg.qq.focus();
		return false;	
	}
	if (document.reg.qq.value.length<5 || document.reg.qq.value.length>10) {
		alert("QQ号码必须是5-10位！");
		document.reg.qq.focus();
		return false;	
	}
	if (document.reg.url.value=="" || document.reg.url.value=="http://") {
		alert ("地址不得为空！");
		document.reg.url.focus();
		return false;
	}
	if (document.reg.yzm.value.length!=4) {
		alert("验证码必须是4位！");
		document.reg.yzm.focus();
		return false;	
	}
	return true;
}