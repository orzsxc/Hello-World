function check() {
	var atpos=document.reg.email.value.indexOf("@",1);
	var pepos=document.reg.email.value.indexOf(".",atpos);
	//ɸѡ��@������ʼ���λ��

	if (document.reg.password.value != "") {
		if (document.reg.password.value.length < 6){
			alert ("���벻������6λ��");	
			document.reg.password.focus();
			return false;
		}
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
	return true;
}