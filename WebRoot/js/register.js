/**验证两次输入密码的一致性*/
function passwordValidation(){
	var pwd = $("input[name='u.password']").val();
	var pwd2 = $("input[name='pwd2']").val();
	if(pwd!=pwd2){
		alert("两次输入密码不一致！");
		return false;
	}
	return true;
}

/**检查用户名合法性*/
var nameChecked=false;
$(function(){
	$("#username").blur(function(){
		var username=$(this).val().replace(/\s/g,"");
		if(username==""){
			$("#info").html("<span style=\"color:red;\">用户名不能为空</span>");
			nameChecked=false;
			return;
		}
		if(username.length<$(this).val().length){
			$("#info").html("<span style=\"color:red;\">用户名不能包含空白符</span>");
			nameChecked=false;
			return;
		}
		$.get("validateUsername.action",{"u.username":username},function(data){
			if(data=="no"){$("#info").html("用户名可以使用");nameChecked=true;}
			else{$("#info").html("<span style=\"color:red;\">用户名已存在</span>");nameChecked=false;}
		});
	});
});