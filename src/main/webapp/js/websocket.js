/**
 * 前端websocket相关js函数
 */
var websocket = null;
//判断当前浏览器是否支持WebSocket
if ('WebSocket' in window) {
	//注意此处的ws要加上项目名ChatRoom2再加@ServerEndpoint注解的值/ws/websocket
	if(fromuser!="undefined"&&fromuser!="")
	{
		websocket = new WebSocket("ws://"+window.location.host+"/ChatRoom2/ws/websocket/"+fromuser);
	}else{
		if(confirm("请先登录!"))window.location.href="index.jsp";
	}
}
else {
    alert('当前浏览器不支持websocket')
}

//连接发生错误的回调方法
websocket.onerror = function () {
	$("#content").html("<p>WebSocket连接发生错误</p>");
};

//连接成功建立的回调方法
websocket.onopen = function () {
	$("#content").prepend("<div style='color:gray;'>"+fromuser+"，欢迎您登录聊天室！</div>");
}

//连接关闭的回调方法
websocket.onclose = function () {
	$("#content").html("<p>WebSocket连接关闭</p>");
}

//接收到消息的回调方法
websocket.onmessage = function (event) {
	if(event.data.indexOf("_login")!=-1){
		addOnline(event.data.replace("_login", ""));
	}else if(event.data.indexOf("_logout")!=-1){
		removeOnline(event.data.replace("_logout", ""));
	}else{
		var obj=$.parseJSON(event.data);
		setMessageInnerHTML(obj);
	}
	scrollToBottom();//滚屏
    editor.focus();
}

//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
window.addEventListener("beforeunload", function(e) {
	var confirmationMessage = '将退出登录状态？';
	(e || window.event).returnValue = confirmationMessage;// Gecko and Trident
	return confirmationMessage;// Gecko and WebKit
	  
});
//若beforeunload事件中用户选择了'取消'，unload事件不会触发
window.addEventListener("unload", function(e) {
	$.post("logout.action",{"u.id":id});
	closeWebSocket();
	fromuser=null;
});

//将消息显示在网页上
function setMessageInnerHTML(obj) {
	if(obj.fromuser==fromuser){
		$("#content").append("<table><tr><td><a href='javascript:void(0);'onclick='getUserInfo(fromuser)' " 
			+"class='username'>"+obj.fromuser+"</a></td><td><div class=\"message1\">"
			+obj.content+"<div style=\"color:gray;font-style: italic;\">["+obj.sendtime+"]</div>"
			+"</div></td></tr></table>");
	}else{
		$("#content").append("<table><tr><td><div class=\"message2\">"
			+obj.content+"<div style=\"color:LightSlateGray;font-style: italic;\">["+obj.sendtime+"]</div>"
			+"</div></td><td style=\"vertical-align: top;\"><a href='javascript:void(0);'onclick='getUserInfo(\""+obj.fromuser+"\")' "
			+"class='username'>"+obj.fromuser+"</a></td></tr></table>");
	}
}

//新增在线用户
function addOnline(obj){
	$("#online").append("<div id="+obj+"><a href=\"javascript:void(0);\" onclick=\"getUserInfo('"+obj+"');\" class=\"username\">"+obj+"</a></div>");
}
//移除在线用户
function removeOnline(obj){
	$("#"+obj).remove();
}
//关闭WebSocket连接
function closeWebSocket() {
    websocket.close();
}

//发送消息
function sendMsg() {
	//验证是否已登录
	if(loginUser==""){
		if(confirm("请先登录!"))
			window.location.href="index.jsp";
		return false;
	}
	if(editor.isEmpty()){
		alert("你忘记输入消息啦！");
		editor.focus();
		return false;
	}
	//构建一个标准格式的JSON对象对象
    var msg=JSON.stringify({
	    "fromuser":fromuser,
	    "touser":touser,
	    "content":editor.html()
    });
    websocket.send(msg);//发送
    editor.html("");//清空编辑器
}