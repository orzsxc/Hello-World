//这个函数用来将输入的内容赋给文本区域
function AddText(Code) {
	document.post.content.value += Code; 
}

//这个函数用来加粗文本
function bold() {
		x = "[b][/b]";
		AddText(x);
}

//这个函数用来倾斜文本
function it() {
	x = "[i][/i]";
	AddText(x);

}

//这个函数用来下划线文本
function under() {
	x = "[u][/u]";
	AddText(x);
}

//这个函数用来删除线文本
function del() {
	x = "[s][/s]";
	AddText(x);

}

//这个函数用来超链接文本
function url() {
	var x = prompt("请输入要超链接的文本");
	if (x) {
		x = "[url code="+x+"]"+x+"[/url]";
		AddText(x);
	}
}

//这个函数用来电子邮件文本
//这个里面可以验证电子邮件
//我们之前已经讲过，所以，这里不做讲解，也不做了
function email() {
	var x = prompt("请输入要电子邮件的文本");
	if (x) {
		x = "[email code="+x+"]"+x+"[/email]";
		AddText(x);
	}
}


//这个函数用来插入图片
function img() {
	var x = prompt("请输入要插入图片的地址");
	if (x) {
		x = "[img code="+x+"]";
		AddText(x);
	}
}

//这个函数用来换行
function br() {
	AddText("[br]");
}

//这个函数用判断字体大小
function font(n) {
	AddText("[size="+n+"][/size]");
}


//增加长度
function out() {
	//文档.表单名.内容.高度+=4
	//将自己的长度再加4
	document.post.content.rows+=4;	
}

//减小长度
function ind() {
	document.post.content.rows-=4;	
}

//打开字体选择器
function fontsize() {
	//文档.获取HTMLID("fontDiv").style
	document.getElementById("fontDiv").style.display="block";
}

//获取字体颜色
function showcolor(n) {
	AddText("[color="+n+"][/color]");
}

//打开字体颜色选取器
function fontcolor() {
	document.getElementById("colorDiv").style.display="block";
}

//执行空白区点击
function fonthid() {
	document.getElementById("fontDiv").style.display="none";	
	document.getElementById("colorDiv").style.display="none";
}