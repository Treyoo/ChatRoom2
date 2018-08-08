<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register.jsp' starting page</title>
    <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="js/register.js"></script>
	<link href="CSS/index.css" rel="stylesheet">
  </head>
  
  <body>
    <form action="register" onsubmit="return nameChecked&&passwordValidation()">
	<table style="width: 726px;height: 448px;border: 0;border-collapse: collapse;margin: 0 auto;
		background-image: url('images/bg_index.gif');">
	  <tr>
        <td colspan="3" style="height: 200px"></td>
      </tr>
      <tr>
        <td style="text-align:right;">用户名：</td>
        <td style="text-align:left;">
        	<input type="text" id="username" autofocus="autofocus" name="u.username" required 
        		oninvalid="setCustomValidity('请输入用户名');" oninput="setCustomValidity('');">
        	<label id="info"></label>
        </td>
      </tr>
      <tr>
      	<td style="text-align:right;">密码：</td>
        <td style="text-align:left;">
        	<input type="password" name="u.password" required 
        		oninvalid="setCustomValidity('请输入密码');" oninput="setCustomValidity('');">
        </td>
      </tr>
      <tr>
      	<td style="text-align:right;">确认密码：</td>
        <td style="text-align:left;">
        	<input type="password" name="pwd2">
        </td>
      </tr>
      <tr>
      	<td style="text-align:right;">性别：</td>
        <td style="text-align:left;">
        	<input type="radio" name="u.sex" value="男" checked/>男
			<input type="radio" name="u.sex" value="女" />女
        </td>
      </tr>
      <tr>
      	<td style="text-align:right;">年龄：</td>
        <td style="text-align:left;">
        	<input type="number" name="u.age" min="1">
        </td>
      </tr>
      <tr>
        <td style="text-align:right;" colspan="2">
        	<input type="submit" value="注册">
        	<a href="index.jsp">返回登录</a>
        </td>
        <td style="width: 60px"></td>
      </tr>
	</table>
  </form>
  </body>
</html>
