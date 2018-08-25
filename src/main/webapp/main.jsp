<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>聊天室主界面</title>
<link rel="stylesheet" type="text/css" href="CSS/main.css">
<link rel="stylesheet" type="text/css" href="js/kindeditor/themes/default/default.css">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script charset="utf-8" src="js/kindeditor/kindeditor-all-min.js"></script>
<script charset="utf-8" src="js/kindeditor/lang/zh-CN.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<script>
	var editor;
	KindEditor.ready(function(K){
		editor=K.create('#editor', {
            uploadJson : 'js/kindeditor/jsp/upload_json.jsp',
            fileManagerJson : 'js/kindeditor/jsp/file_manager_json.jsp',
            allowFileManager : true,
            imageSizeLimit : '5MB', //批量上传图片单张最大容量
			imageUploadLimit : 10, //批量上传图片同时上传最多个数
			resizeType:1,
			newlineTag:'br',
			items : ['source','fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
					'italic', 'underline','removeformat', 'clearhtml','|','insertorderedlist',
					'insertunorderedlist', '|', 'emoticons', 'image', 'link','|','fullscreen'],
			afterCreate: function(){//添加Ctrl+Enter发送快捷键
				K.ctrl(this.edit.doc, 13, function() {//焦点在文本框的情况
			        sendMsg();
				});
				K.ctrl(document, 13, function() {//焦点不在文本框的情况
			        sendMsg();
				});
			}
                
        });
	});
</script>
<script type="text/javascript">
	//当页面载入后执行的操作
	window.onload=function(){
		showOnline();//显示在线用户
		//editor.focus();//编辑器获取焦点
		searchUserEventBinding();//搜索用户输入框事件绑定
		setDivScroll();//设置聊天内容可见高度可拖拽调整
	}
	//window.setInterval("showOnline();",5000);//每5秒钟获取一次在线用户列表
	//window.setInterval("showContent();",2000);//每2秒钟获取一次聊天内容
</script>
<script type="text/javascript">
var fromuser="${sessionScope.login.username}";//从session里获取登录的对象，保存到js中备用
var touser;//聊天对象由用户点击在线用户列表中的用户获取值
var loginUser="${sessionScope.login}";
var id="${sessionScope.login.id}";
</script>
<script type="text/javascript" src="js/websocket.js"></script>
</head>
<!-- 顶部 -->
<table style="width: 778px;height: 152px;border: 0;border-collapse:collapse;margin:0px auto;
	background-image: url('images/top.jpg');">
   <tr>
     <td style="text-align:right;">
         <input type="button" value="退出" onClick="window.location.href=
         '${pageContext.request.contextPath}/logout?u.id=${sessionScope.login.id}'">
     </td>
   </tr>
   <tr>
     <td>
       	<table style="float:right;">
       		<tr>
       			<td>当前用户：</td>
       			<td><a href="javascript:void(0);" onclick="getUserInfo(fromuser)" class="username">
       			${sessionScope.login.username}</a></td>
       		</tr>
       	</table>
     </td>
   </tr>
 </table>
 
 <!-- 聊天区域-->
 <table style="width: 778px;height: 270px;border: 0;border-collapse: collapse;margin: 0 auto;">
   <tr>
     <td style="width: 165px;vertical-align:top;">在线用户列表
     	<input type="text" placeholder="搜索用户" id="usernameKeyword" list="searchResult" style="width: 150px;">
  		<datalist id="searchResult"></datalist>
     	<div id="online" style="height:540px; overflow: auto;background-color:#F7FDED;"></div>
     </td>
     <td style="width: 613px;vertical-align:top;">
       <div id="content">
       	<div id="expander"></div>
       </div>
     </td>
   </tr>
 </table>
 
 <!-- 发言区域 -->
 <form action="" name="form1">
   <table style="width: 778px;border: 0;border-collapse: collapse;margin: 0 auto;background-color: #D1E9AA;">
     <tr>
       <td>
         <textarea rows="1" cols="108" name="m.content" id="editor"></textarea>
       </td>
     </tr>
     <tr>
       
       <td style="text-align:right;">
         <input type="button" value="发送(Ctrl+Enter)" onClick="sendMsg()" style="width: 100%;height: 30px;">
       </td>
     </tr>
     <tr>
       <td colspan="2" style="text-align: center;">
       All CopyRights&copy;reserved CUI<br>
       </td>
     </tr>
   </table>
 </form>
<!-- 用户资料卡，默认隐藏 -->
<div>
    <div id="userinfobg"></div>
    <div id="userinfobox">
        用户信息<hr />
        <div id="userinfo"></div>
        <div class="btn_div" style="float: right;">
            <input type="button" class="concel" value="关闭" onclick="infobox(0)" />
        </div>
         
    </div>
</div>
</body>
</html>