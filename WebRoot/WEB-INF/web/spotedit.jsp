<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <title>添加景点</title>
	<link rel="shortcut icon" type="images/x-icon" href="<%=basePath%>include/img/travelB.png"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>include/easyui/themes/gray/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>include/easyui/themes/icon.css"/>
	<script type="text/javascript" src="<%=basePath%>include/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>include/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>include/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=XKKhINLzq9AETPRye7MCDcwVCYxoOptg"></script>
	<script type="text/javascript" charset="UTF-8" src="<%=basePath%>include/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="UTF-8" src="<%=basePath%>include/ueditor/ueditor.all.min.js"></script>
	<script type="text/javascript" charset="UTF-8" src="<%=basePath%>include/ueditor/lang/zh-cn/zh-cn.js"></script>
	<base href="<%=basePath%>">
  </head>
  
  <body>
    This is my JSP page. <br>
  </body>
</html>
