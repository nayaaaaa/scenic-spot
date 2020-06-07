<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>用户申请列表</title>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
	<link rel="shortcut icon" type="images/x-icon" href="<%=basePath%>include/img/travelB.png"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>include/easyui/themes/gray/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>include/easyui/themes/icon.css"/>
	<script type="text/javascript" src="<%=basePath%>include/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>include/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>include/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script>var base ="<%=basePath%>";</script>
	<style>
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
	<table id="dg" cellpadding="2"></table>
	<div id="tb" style="padding:5px;"></div>
	<script type="text/javascript">
		$(function(){
			loadGrid();
			$("#tb").bind("keydown",function(e){
			  var theEvent = e||window.event;  //兼容FF IE Opera
			  var code = theEvent.keyCode||theEvent.which||theEvent.charCode;
			  if(code == 13){
				  loadGrid();
			  }
		  });
		});
		function loadGrid(){
			$("#dg").datagrid({
				width:'98%',height:"96%",nowrap:false,
				striped:true,border:true,collapsible:false,
				url:"comment/getall",
				pagination:true,
				rownumbers:true,
				fitColumns:true,
				pageSize:20,
				loadMsg:'数据加载中...',
				columns:[[
					{
						title:'申请景点',field:'ctitle',width:'20%',formatter:function(value,row,index){
							return '<span style="white-space:nowrap;">'+row.ctitle+'</span>';
					}},
					{
						title:'申请理由',field:'content',width:'60%',formatter:function(value,row,index){
							return '<span style="white-space:nowrap;">'+row.content+'</span>';
					}},
					{		
						title:'操作',field:'uid',width:'20%',formatter:function(value,row,index){
						var p="<a href =\"javascript:delComs('"+row.id+"','"+row.ctitle+"')\">处理</a>";
						return p;
					}}
				]],
				toolbar:'#tb'
			});
		}
		function delComs(newsid,title0){
			id = newsid;
			title = title0;
			parent.$.messager.confirm("系统提示","您确定已经处理“"+title+"”申请吗？",function(r){
				if(r){
				$.ajax({
					url:"comment/doDell",
					data:{"id":id},
					type:"post",
					success:function(res){
						if(res.delflag){
							parent.$.messager.alert("系统提示","您已处理："+title+"申请","info");
							loadGrid();
						}else{
							parent.$.messager.alert("系统提示",res,"error");
						}
						return false;
					},
					error:function(res){
						parent.$.messager.alert("系统提示","系统错误-delcomment函数","error");
						}
				});
			}
		});
		}
	</script>
  </body>
</html>
