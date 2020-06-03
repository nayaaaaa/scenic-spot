<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <title>管理界面</title>
	<link rel="shortcut icon" type="images/x-icon" href="<%=basePath%>include/img/travelB.png"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>include/easyui/themes/gray/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>include/easyui/themes/icon.css"/>
	<script type="text/javascript" src="<%=basePath%>include/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>include/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>include/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="<%=basePath%>include/js/adminpage.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=XKKhINLzq9AETPRye7MCDcwVCYxoOptg"></script>
	<script>var base ="<%=basePath%>";</script>
	<base href="<%=basePath%>">
  </head>
  <body class="easyui-layout">
	<div data-options="region:'north',border:false" style="background: #ffffff;padding: 0 10px 0 10px;vertical-align: middle;">
		<img src="<%=basePath%>include/img/add.png" height="50"/>
		<div style="float: right; height: 50px; margin-right: 10px; padding-top: 10px;">
			<a href="#" id="logout" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">退出</a>
		</div>
			<div style="float: right;line-height: 50px;margin-right: 10px;">登录用户：${me.name}</div>
	</div>
	<div data-options="region:'west',split:true" title="系统菜单" style="width: 180px; padding: 10px;">
		<ul id="spot-tree" class="easyui-tree" data-options="selected:true"></ul>
	</div>
	<div data-options="region:'center'">
		<div id="tabs" class="easyui-tabs" fit="true" border="false"></div>
	</div>
	<div data-options="region:'south',border:false" style="height: 30px;padding: 5px;text-align: center;font-family: arial;color:#A0B1BB;">
		Copyright@ 2017 javaEE 赵佳豪毕业设计作品.西安石油大学
	</div>
  </body>
</html>
