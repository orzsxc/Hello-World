function check() {
	var atpos=document.reg.email.value.indexOf("@",1);
	var pepos=document.reg.email.value.indexOf(".",atpos);
	//ɸѡ��@������ʼ���λ��
	if (document.reg.username.value == "") {		
		alert ("����������½���û���!");
		document.reg.username.focus();		
		return false;
	}
	if (document.reg.username.value.length < 2) {
		alert("�û�����������2λ!");
		document.reg.username.focus();
		return false;
	}
	if (document.reg.password.value == ""){
		alert ("���������ĵ�½���룡");	
		document.reg.password.focus();
		return false;
	}
	if (document.reg.password.value.length < 6){
		alert ("���벻������6λ��");	
		document.reg.password.focus();
		return false;
	}
	if (document.reg.notpassword.value == ""){
		alert ("����������ȷ�����룡");	
		document.reg.notpassword.focus();
		return false;
	}
	if (document.reg.password.value != document.reg.notpassword.value){
		alert ("������������ȷ�ϲ�һ��,���������룡");	
		document.reg.notpassword.focus();
		return false;
	}
	if (document.reg.passt.value == "") {		
		alert ("����������������ʾ!");
		document.reg.passt.focus();		
		return false;
	}
	if (document.reg.passd.value == "") {		
		alert ("��������������ش�!");
		document.reg.passd.focus();		
		return false;
	}
	if (document.reg.passt.value == document.reg.passd.value){
		alert ("������ʾ����������ش�һ�£�");	
		document.reg.passd.focus();
		return false;
	}
	if (document.reg.email.value == "") {		
		alert ("�ʼ�����Ϊ�գ�");
		document.reg.email.focus();		
		return false;
	}
	if (atpos==-1) { //�����@����@��λ��,���û���򷵻�-1
		alert ("��������ʼ�ȱ��@");
		document.reg.email.focus();
		return false;	
	}
	if (document.reg.email.value.indexOf("@",atpos+1) != -1) {
		alert ("�ʼ��в���ͬʱ��������@");//����ͬʱ��������
		document.reg.email.focus();
		return false;
	}
	if (pepos==-1) {//����Ƿ���.
		alert("�ʼ���ȱ��.");
		document.reg.email.focus();
		return false;	
	}
	if (pepos+3>document.reg.email.value.length) {//.������2���ַ�
		alert ("�ʼ���.��û������2���ַ�!");
		document.reg.email.focus();
		return false;
	}
	if (document.reg.qq.value=="") {
		alert ("QQ����Ϊ�գ�");
		document.reg.qq.focus();
		return false;
	}
	if (document.reg.qq.value=="") {
		alert ("QQ����Ϊ�գ�");
		document.reg.qq.focus();
		return false;
	}
	if (isNaN(document.reg.qq.value)) {
		alert("QQ���������֣�");
		document.reg.qq.focus();
		return false;	
	}
	if (document.reg.qq.value.length<5 || document.reg.qq.value.length>10) {
		alert("QQ���������5-10λ��");
		document.reg.qq.focus();
		return false;	
	}
	if (document.reg.url.value=="" || document.reg.url.value=="http://") {
		alert ("��ַ����Ϊ�գ�");
		document.reg.url.focus();
		return false;
	}
	if (document.reg.yzm.value.length!=4) {
		alert("��֤�������4λ��");
		document.reg.yzm.focus();
		return false;	
	}
	return true;
}