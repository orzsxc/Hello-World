function check() {
	if (document.post.title.value.length < 4) {		
		alert ("����ı��ⲻ��С��4λ");
		document.post.title.focus();		
		return false;
	}
	if (document.post.content.value.length < 10) {
		alert("���ݲ�������10λ");
		document.post.content.focus();
		return false;
	}
	return true;
}