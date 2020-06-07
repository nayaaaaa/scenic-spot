<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <title>修改景点</title>
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
	<script type="text/javascript" src="<%=basePath%>include/js/area.js"></script>
	<script type="text/javascript" src="<%=basePath%>include/js/link.js"></script>
	<base href="<%=basePath%>">
  </head>
  <body>
	<div class="easyui-panel" style="padding: 5px 2px;">
		<form>
			<table cellpadding="5">
				<tr>
					<td style="width: 120px;">景点名称：</td>
					<td style="width: 880px;">
						<input id="title" class="easyui-textbox" data-options="prompt:'景点名称',required:true" style="width: 90%;height: 32px;">
					</td>
				</tr>
				<tr>
					<td>发布者：</td>
					<td><input id="cruser" class="easyui-textbox" data-options="prompt:'发布人',required:true" style="width: 90%;height: 32px;"></td>
				</tr>
				<tr>
					<td style="vertical-align:top;">文章内容：</td>
					<td>
						<script id="content" type="text/plain" style="width: 89%;height: 500px;"></script>
					</td>
				</tr>
				<tr>
					<td style="width: 120px;">景点位置：</td>
					<td style="width: 880px;">
						<div>
							<select id="prov"></select>
							<select id="city"></select>
							<select id="area"></select>
							<input type="text" placeholder="请输入详细地址" id="digital">
						</div>
					</td>
				</tr>
			</table>
		</form>
		<div style="text-align: center;">
			<div id="savenews" class="easyui-linkbutton" iconCls="icon-ok" style="width: 132px;height: 32px;">保存</div>
		</div>
	</div>
	<script type="text/javascript">
		var ue;
		//区域输入模块
		$(function(){
			ue = UE.getEditor('content');
			$("#title").textbox("setValue","${spot.title}");
			ue.ready(function(){
				ue.setContent("");
				ue.execCommand('insertHtml','${spot.content}');
			});
			$('#savenews').click(function(){
				var a=$("#title").textbox("getValue");
				var b=ue.getContent();
				var c=$("#cruser").textbox("getValue");
					if(a.length<=0){
						parent.$.messager.alert("系统提示","必须填写景点标题","warning");
						return;
					}
					if(b.length<=0){
						parent.$.messager.alert("系统提示","必须填写景点内容","warning");
						return;
					}
					if(c.length<=0){
						parent.$.messager.alert("系统提示","必须填写发布人姓名或发布机构名称","warning");
						return;
					}
	   	 		var city = $('#city').val();
				var district = $('#area').val();
				var four = $('#digital').val();	
					// 创建地址解析器实例
				var address = city+district+four;
				var f = '${spot.id}';
				var myGeo = new BMap.Geocoder();
				// 将地址解析结果显示在地图上,并调整地图视野
				myGeo.getPoint(address,function(e){
					if (e) {
						var da = e.lng;
						var db = e.lat;
						//数据库写入模块
						$.ajax({
							type:'POST',
							url:"spot/saveEdit",
							data:{"title":a,"content":b,"cruser":c,"positionx":da,"positiony":db,"city":city,"district":district,"id":f},
							success:function(res){
								if(res.ok){
									parent.$.messager.alert("系统提示","你已修改景点:"+$("#title").val(),"info");
								}else{
									parent.$.messager.alert("系统提示","修改失败！","error");
									}
								return false;
							},
							error:function(res){
								parent.$.messager.alert("系统提示","系统错误!spotedit-ajax","error");
							}
						});
					}else{
						parent.$.messager.alert("系统提示","您选择地址没有解析到结果!","warning");
					}
				}, city);
			});
		});	
	</script>
  </body>
</html>
