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
	<script>var base="<%=basePath%>";</script>
  </head>
  <body>
	<div class="easyui-panel" style="padding: 5px 2px;">
		<form>
			<table cellpadding="5">
				<tr>
					<td style="width: 120px;">帐号：</td>
					<td style="width: 880px;">
						<input id="id" class="easyui-textbox" data-options="prompt:'帐号',required:true" style="width: 90%;height: 32px;">
					</td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input id="pwd" type="password" class="easyui-textbox" data-options="prompt:'密码',required:true" style="width: 90%;height: 32px;"></td>
				</tr>
				<tr>
					<td style="width: 120px;">昵称：</td>
					<td style="width: 880px;">
						<input id="name" class="easyui-textbox" data-options="prompt:'昵称',required:true" style="width: 90%;height: 32px;">
					</td>
				</tr>
			</table>
		</form>
		<div style="text-align: center;">
			<div id="adminsignup" class="easyui-linkbutton" iconCls="icon-ok" style="width: 132px;height: 32px;">注册</div>
		</div>
	</div>
	<script>
		$(function(){
			$("#adminsignup").click(function(){
				var a = $('#id').val();
				var b = $('#pwd').val();
				var c = $('#name').val();
				if(a == ""){
					$.messager.alert("提示","请输入用户名！","warning");
					return;
				}
				if(b == ""){
					$.messager.alert("提示","请输入密码！","warning");
					return;
				}
				if(c == ""){
					$.messager.alert("提示","请输入昵称！","warning");
					return;
				}
				$.ajax({
					url:base+"user/doSameid",
					data:{"uid":a},
					type:"post",
					success:function(res){
						if(res.ok){
							$.ajax({
								url:base+"user/doAdminsignup",
								data:{"uid":a,"pwd":b,"name":c},
								type:"post",
								success:function(res){
									if(res.ok){
										$.messager.alert("提示",res.msg,"info");
									}else{
										$.messager.alert("提示",res.msg,"warning");
										}
									return false;
								},
								error:function(res){
									$.messager.alert("测试","系统错误-res-error","error","warning");
									}
							});
						}else{
							$.messager.alert("测试","帐号重复,请重新输入帐号","error","warning");
						}
						return false;
					},
					error:function(res){
						$.messager.alert("测试","系统错误-res-error","error","warning");
						}
				});
			});
		});
	</script>
  </body>
</html>
