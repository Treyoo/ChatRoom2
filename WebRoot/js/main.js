/**发送聊天信息*/
function send() {
	//验证是否已登录
	if(loginUser==""){
		if(confirm("请先登录!"))
			window.location.href="index.jsp";
		return false;
	}
	//验证用户输入信息的合法性
	if(touser==undefined){
		alert("请选择一个聊天对象!")
		return false;
	}
	if(editor.isEmpty()){
		alert("你忘记输入消息啦！");
		editor.focus();
		return false;
	}
	//使用Ajax访问后台action
	$.post("sendMessage.action",{"m.content":editor.html(),"m.fromuser":fromuser,"m.touser":touser},function(data){
		editor.html("");//清空编辑器
	});
}

/**显示在线用户*/
function showOnline(){
	if(fromuser!=""){
		$.get("queryOnline.action",function(data){
			$("#online").html("");
			$.each(data,function(i,obj){
				$("#online").append("<div><a href=\"javascript:void(0);\" onclick=\"setTo('"
						+obj.username+"');showContent();\">"+obj.username+"</a></div>");
			});
		});
	}
}

/**显示聊天内容*/
function showContent() {
	if(fromuser!=""&&touser!=undefined){
		$.get("queryMessageByUsername.action",{"u1.username":fromuser,"u2.username":touser},function(data){
			$("#content").html("");
			$.each(data,function(i,obj){
				if(obj.fromuser==fromuser){
					$("#content").append("<table><tr><td><a href='javascript:void(0);'onclick='getUserInfo(fromuser)' " 
							+"class='username'>"+obj.fromuser+"</a></td><td><div class=\"message1\">"
							+obj.content+"<div style=\"color:gray;font-style: italic;\">["+obj.sendtime+"]</div>"
							+"</div></td></tr></table>");
				}else{
					$("#content").append("<table><tr><td><div class=\"message2\">"
   				+obj.content+"<div style=\"color:LightSlateGray;font-style: italic;\">["+obj.sendtime+"]</div>"
   			+"</div></td><td style=\"vertical-align: top;\"><a href='javascript:void(0);'onclick='getUserInfo(touser)' "
   					 +"class='username'>"+obj.fromuser+"</a></td></tr></table>");
				}
			});
		});
		//当聊天信息超过一屏时，滚动条移动到最下方
		if($("#content")[0].scrollTop+$("#content").height()>=$("#content")[0].scrollHeight-150){
			$("#content").scrollTop($("#content")[0].scrollHeight);
		}
	}
}

/**设置聊天对象*/
function setTo(to){
	touser=to;
	$("#touser").html(to);
}
/**从资料卡发起聊天*/
function chatwith(){
	var username=$('#usernameKeyword').val();
	setTo(username);
	infobox(0);
}

/**搜索用户输入框模糊搜索事件绑定*/
function searchUserEventBinding(){
	//登录后才可以搜索
	if(loginUser=="")return;
	$("#usernameKeyword").keyup(function(){
		$("#searchResult").html("");
		if($(this).val()!=""){
			$.get("searchUserByName.action",{"u.username":$(this).val()},function(data){
				$.each(data,function(i,obj){
					$("#searchResult").append("<option value='"+obj.username+"'>");
				});
			});
		}
	});
	//获取相应用户信息
	$("#usernameKeyword").change(function(){
		getUserInfo($("#usernameKeyword").val());
	});
}

/**显示/隐藏用户信息*/
function infobox(n){
    if(n==0){
    	document.getElementById("userinfobg").style.display ="none";
    	document.getElementById("userinfobox").style.display ="none";
    	$("#userinfo").html("");
    }else{
    	document.getElementById("userinfobg").style.display ="block";
    	document.getElementById("userinfobox").style.display ="block";
    }
}

/**查询用户信息*/
function getUserInfo(username){
	$.get("getUserInfoByName.action", {"u.username":username}, function(obj) {
		if(obj!=null){
			$("#userinfo").html("<p>用户名:"+obj.username+"</p><p>性别："+obj.sex+"</p><p>年龄："+obj.age
					+"</p><p>状态："+(obj.online?"在线":"离线")+"</p><p>最近登录时间："+obj.logintime+"</p>");
			$("#chatwith").removeAttr("disabled");
		}else{
			$("#userinfo").html("<p>用户不存在</p>");
			$("#chatwith").attr("disabled","disabled");//禁用发送按钮
		}
	})
	infobox(1);
}

/**设置聊天内容可见高度可拖拽调整*/
function setDivScroll(){
    var src_posi_Y = 0, dest_posi_Y = 0, move_Y = 0, is_mouse_down = false, destHeight = 270;
    $("#expander")
    .mousedown(function(e){
        src_posi_Y = e.pageY;
        is_mouse_down = true;
    });
    $(document).bind("click mouseup",function(e){
        if(is_mouse_down){
          is_mouse_down = false;
        }
    })
    .mousemove(function(e){
        dest_posi_Y = e.pageY;
        move_Y = src_posi_Y - dest_posi_Y;
        src_posi_Y = dest_posi_Y;
        destHeight = $("#content").height() + move_Y;
        if(is_mouse_down){
            $("#content").css("height", destHeight > 270 ? destHeight : 270);
            $("#online").height($("#content").height());
        }
    });
}

/**刷新、后退、关闭浏览器都会注销登录状态（这种处理方式待改进）*/
window.addEventListener("beforeunload", function(e) {
	var confirmationMessage = '将退出登录状态？';
	(e || window.event).returnValue = confirmationMessage;// Gecko and Trident
	return confirmationMessage;// Gecko and WebKit
	  
});
//若beforeunload事件中用户选择了'取消'，unload事件不会触发
window.addEventListener("unload", function(e) {
	$.post("logout.action",{"u.id":id});
});

