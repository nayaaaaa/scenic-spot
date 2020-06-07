<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <title>区域管理</title>
	<link rel="shortcut icon" type="images/x-icon" href="<%=basePath%>include/img/travelB.png"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>include/easyui/themes/gray/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>include/easyui/themes/icon.css"/>
	<script type="text/javascript" src="<%=basePath%>include/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>include/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>include/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="<%=basePath%>include/js/area.js"></script>
	<script type="text/javascript" src="<%=basePath%>include/js/link.js"></script>
	<script type="text/javascript" src="<%=basePath%>include/js/date.format.js"></script>
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
	<div>
        <select id="prov"></select>
        <select id="city"></select>
		<select id="area"></select>
		<div class="easyui-linkbutton" id="cityset">市级名录</div>
		<div class="easyui-linkbutton" id="districtset">区级名录</div>
		<table id="dg" cellpadding="3"></table>
			<div id="tb" style="padding:5px;"></div>
    </div>
	<script type="text/javascript">
		$(function(){
			loadGridcity();	
			$('#cityset').click(function(){
			loadGridcity();							
			});
			$('#districtset').click(function(){
				loadGriddistrict();
			});
		});
		function loadGridcity(){
			var c_name=$('#city').val();;
			$("#dg").datagrid({
				width:'98%',height:442,nowrap:false,
				striped:true,border:true,collapsible:false,
				url:"spot/getcity",
				queryParams:{"c_name":c_name},
				pagination:true,
				rownumbers:true,
				fitColumns:true,
				pageSize:20,
				loadMsg:'数据加载中...',
				columns:[[
					{
						title:'标题',field:'title',width:100,formatter:function(value,row,index){
							return '<a href="spot/getaSpot?id='+row.id+'" style="white-space:nowrap;"  target="_blank" title='+value+'>'+(value?value:'')+'</a>';
					}},
					{
						title:'发布时间',field:'tjdate',width:75,formatter:function(value,row,index){
							return (new Date(row.tjdate).format('Y-m-d H:i'));
						}},
					{
						title:'更新时间',field:'adate',width:75,formatter:function(value,row,index){
							if(row.adate == null){
								return '<span style="white-space:nowrap;">暂无更新</span>';
							}else{
								return (new Date(row.adate).format('Y-m-d H:i'));
							}
					}},
					{
						title:'城市',field:'city',width:50,formatter:function(value,row,index){
							return '<span style="white-space:nowrap;">'+row.city+'</span>';
					}},
					{
						title:'区县',field:'district',width:50,formatter:function(value,row,index){
							return '<span style="white-space:nowrap;">'+row.district+'</span>';
					}},
					{		
						title:'操作',field:'hitnum',width:50,formatter:function(value,row,index){
						var p="<a href=\"javascript:editNews('"+row.id+"')\">修改</a>";
						p+="|<a href =\"javascript:delNews('"+row.id+"','"+row.title+"')\">删除</a>";
						return p;
					}
					}
				]],
				toolbar:'#tb'
			});
		}
		function loadGriddistrict(){
			var d_name=$('#area').val();
			$("#dg").datagrid({
				width:'98%',height:442,nowrap:false,
				striped:true,border:true,collapsible:false,
				url:"spot/getdistrict",
				queryParams:{"d_name":d_name},
				pagination:true,
				rownumbers:true,
				fitColumns:true,
				pageSize:20,
				loadMsg:'数据加载中...',
				columns:[[
					{
						title:'标题',field:'title',width:100,formatter:function(value,row,index){
							return '<a href="spot/getaSpot?id='+row.id+'" style="white-space:nowrap;"  target="_blank" title='+value+'>'+(value?value:'')+'</a>';
					}},
					{
						title:'发布时间',field:'tjdate',width:75,formatter:function(value,row,index){
							return (new Date(row.tjdate).format('Y-m-d H:i'));
						}},
					{
						title:'更新时间',field:'adate',width:75,formatter:function(value,row,index){
							if(row.adate == null){
								return '<span style="white-space:nowrap;">暂无更新</span>';
							}else{
								return (new Date(row.adate).format('Y-m-d H:i'));
							}
					}},
					{
						title:'城市',field:'city',width:50,formatter:function(value,row,index){
							return '<span style="white-space:nowrap;">'+row.city+'</span>';
					}},
					{
						title:'区县',field:'district',width:100,formatter:function(value,row,index){
							return '<span style="white-space:nowrap;">'+row.district+'</span>';
					}},
					{		
						title:'操作',field:'hitnum',width:50,formatter:function(value,row,index){
						var p="<a href=\"javascript:editNews('"+row.id+"')\">修改</a>";
						p+="|<a href =\"javascript:delNews('"+row.id+"','"+row.title+"')\">删除</a>";
						return p;
					}
					}
				]],
				toolbar:'#tb'
			});
		}
		function editNews(id){
			parent.swNewTab("修改新闻信息","spot/goEdit?id="+id);
		}
		function delNews(newsid,title0){
			id = newsid;
			title = title0;
			parent.$.messager.confirm("系统提示","您确定要删除“"+title+"”吗？",function(r){
				if(r){
				$.ajax({
					url:"spot/doDell",
					data:{"id":id},
					type:"post",
					success:function(res){
						if(res.delflag){
							parent.$.messager.alert("系统提示","您已删除景点："+title,"info");							
							id="";s_name="";
							loadGrid();
						}else{
							parent.$.messager.alert("系统提示",res,"error");
						}
						return false;
					},
					error:function(res){
						parent.$.messager.alert("系统提示","系统错误-newlist-delNews函数","error");
						}
				});
			}
		});
		}
	</script>
  </body>
</html>
