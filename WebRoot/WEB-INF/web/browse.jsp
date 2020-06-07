<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <title>景点列表</title>
	<link rel="shortcut icon" type="images/x-icon" href="<%=basePath%>include/img/travelB.png"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>include/easyui/themes/gray/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>include/easyui/themes/icon.css"/>
	<script type="text/javascript" src="<%=basePath%>include/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>include/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>include/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="<%=basePath%>include/js/browse.js"></script>
	<script>var base ="<%=basePath%>";</script>
	<script type="text/javascript" src="<%=basePath%>include/js/area.js"></script>
	<script type="text/javascript" src="<%=basePath%>include/js/link.js"></script>
	<script type="text/javascript" src="<%=basePath%>include/js/date.format.js"></script>
	<base href="<%=basePath%>">
	<style>
        select{
            width:200px;
            height: 30px;
		}
		a{
			text-decoration: none; /*去掉超链的下划线*/
			color:#818496;
		}
		a:link{
			color:black;
		}
		/*超链接点击之后*/
		a:visited{
			color:black;
		}
		/*鼠标悬停，放到标签上的时候*/
		a:hover{
			color:rgb(1, 194, 253);
		}
		/*鼠标点击链接，但是不松手的时候*/
		a:active{
			color:rgb(0, 10, 116);
		}
    </style>
  </head>
  <body>
	<select id="prov"></select>
	<select id="city"></select>
	<select id="area"></select>
	<div class="easyui-linkbutton" id="cityset">市级名录</div>
	<div class="easyui-linkbutton" id="districtset">区级名录</div>
    <table id="dg" cellpadding="2"></table>
	<div id="tb" style="padding:5px;">
	 	<input type="text" id="s_name" class="easyui-textbox" data-options="prompt:'标题关键字...'" style="width: 200px;height: 32px;">
	  	<div id="s_spot" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
	</div>
  </body>
</html>
