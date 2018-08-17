<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>聊天室</title>
<link href="CSS/index.css" rel="stylesheet">
</head>
<body>
  <form action="login" name="form1" method="post">
	<table style="width: 726px;height: 448px;border: 0;border-collapse: collapse;margin: 0 auto;
			background-image: url('images/bg_index.gif');">
	  <tr>
        <td colspan="2" style="height: 200px;"></td>
      </tr>
      <tr>
        <td style="text-align:right;">
        	用户名：<input type="text" autofocus="autofocus" name="u.username" required
        		oninvalid="setCustomValidity('请输入您的用户名');" oninput="setCustomValidity('');">
        </td>
        <td style="width: 254px"></td>
      </tr>
      <tr>
      	<td style="text-align:right;">
        	密&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" name="u.password" required
        		oninvalid="setCustomValidity('请输入密码');" oninput="setCustomValidity('');">
        	
        </td>
        <td><label style="color: red;"><s:property value="info"/></label></td>
      </tr>
      <tr>
        <td style="text-align:center;" colspan="2">
        	<input type="submit" value="登录">
        	<a href="register.jsp">还没有账号？去注册</a>
        </td>
      </tr>
      <tr>
        <td colspan="2" style="height: 60px;"></td>
      </tr>
	</table>
  </form>
</body>
</html>