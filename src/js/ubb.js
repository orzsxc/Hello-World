//���������������������ݸ����ı�����
function AddText(Code) {
	document.post.content.value += Code; 
}

//������������Ӵ��ı�
function bold() {
		x = "[b][/b]";
		AddText(x);
}

//�������������б�ı�
function it() {
	x = "[i][/i]";
	AddText(x);

}

//������������»����ı�
function under() {
	x = "[u][/u]";
	AddText(x);
}

//�����������ɾ�����ı�
function del() {
	x = "[s][/s]";
	AddText(x);

}

//������������������ı�
function url() {
	var x = prompt("������Ҫ�����ӵ��ı�");
	if (x) {
		x = "[url code="+x+"]"+x+"[/url]";
		AddText(x);
	}
}

//����������������ʼ��ı�
//������������֤�����ʼ�
//����֮ǰ�Ѿ����������ԣ����ﲻ�����⣬Ҳ������
function email() {
	var x = prompt("������Ҫ�����ʼ����ı�");
	if (x) {
		x = "[email code="+x+"]"+x+"[/email]";
		AddText(x);
	}
}


//���������������ͼƬ
function img() {
	var x = prompt("������Ҫ����ͼƬ�ĵ�ַ");
	if (x) {
		x = "[img code="+x+"]";
		AddText(x);
	}
}

//���������������
function br() {
	AddText("[br]");
}

//����������ж������С
function font(n) {
	AddText("[size="+n+"][/size]");
}


//���ӳ���
function out() {
	//�ĵ�.����.����.�߶�+=4
	//���Լ��ĳ����ټ�4
	document.post.content.rows+=4;	
}

//��С����
function ind() {
	document.post.content.rows-=4;	
}

//������ѡ����
function fontsize() {
	//�ĵ�.��ȡHTMLID("fontDiv").style
	document.getElementById("fontDiv").style.display="block";
}

//��ȡ������ɫ
function showcolor(n) {
	AddText("[color="+n+"][/color]");
}

//��������ɫѡȡ��
function fontcolor() {
	document.getElementById("colorDiv").style.display="block";
}

//ִ�пհ������
function fonthid() {
	document.getElementById("fontDiv").style.display="none";	
	document.getElementById("colorDiv").style.display="none";
}