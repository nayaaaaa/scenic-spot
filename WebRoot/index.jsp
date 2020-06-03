<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
	<title>陕西景点系统</title>
	<link rel="shortcut icon" type="images/x-icon" href="./include/img/travelB.png"/>
	<link rel="stylesheet" type="text/css" href="./include/css/main.css"/>
	<link rel="stylesheet" type="text/css" href="./include/easyui/themes/gray/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="./include/easyui/themes/icon.css"/>
	<script type="text/javascript" src="./include/js/jquery.min.js"></script>
	<script type="text/javascript" src="./include/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="./include/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script>var base="<%=basePath%>";</script>
	<script src="./include/js/login.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=XKKhINLzq9AETPRye7MCDcwVCYxoOptg">
	</script>
  </head>
  <body style="overflow:-Scroll;overflow-y:hidden">
	  <div class="header">
		  <div class="inner_c">
			  <div class="logo">
				  <img src="<%=basePath%>include/img/map.png" height="40">
			  </div>
			  <div class="nav">
				<a id="a" href="#" style="margin-right:15px;">登录</a><a href="#" id="b" style="margin-right:15px;">地图</a><a href="#" id="c">注册</a>
			  </div>
		  </div>
	  </div>
	  <div class="cl"></div>
	  <div class="login">
			<div id="lnews" class="l-wrap inner_c">
				<div id="container"></div> 
			</div>  
			<div id="llogin" class="box inner_c">
			  <div class="input">
				  <div class="log" id="login_form">
					  <div class="name">
						  <label>账&nbsp;&nbsp;&nbsp;&nbsp;号&nbsp;</label><input type="text" class="text" id="uid" placeholder="账号" tabindex="1"/>
					  <br/><br>
					  </div>
					  <div class="pwd">
						  <label>密&nbsp;&nbsp;&nbsp;&nbsp;码&nbsp;</label><input type="password" class="text" id="pwd" placeholder="密码" tabindex="2"/><br>
						  <br/>
						  <input id="login_submit" type="button" class="submit" tabindex="3" value="登录"/>
					  </div>
				  </div>
			  </div>
			</div>  
		    <div id="lsignup" class="box inner_c">
				<div class="input">
					<div class="log" id="signup_form">
						<div class="sign">
							<label>账&nbsp;&nbsp;&nbsp;&nbsp;号&nbsp;</label><input type="text" class="text" id="suid" placeholder="账号" tabindex="1"/>
						<br/><br/>
							<label>密&nbsp;&nbsp;&nbsp;&nbsp;码&nbsp;</label><input type="password" class="text" id="spwd" placeholder="密码" tabindex="2"/>
						<br/><br/>
							<label>昵&nbsp;&nbsp;&nbsp;&nbsp;称&nbsp;</label><input type="text" class="text" id="sname" placeholder="昵称" tabindex="3"/><br>
						<br>
							<input id="sign_up" type="button" class="submit" tabindex="4" value="注册"/>
						</div>
					</div>
				</div>
		    </div>
		</div>
		<div class="footer">
		</div>
	</body>
</html>
