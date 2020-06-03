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
	<base href="<%=basePath%>">
  </head>
  
  <body>
    <div class="easyui-panel" style="padding: 5px 2px;">
		<form>
			<table cellpadding="5">
				<tr>
					<td style="width: 120px;">原密码：</td>
					<td style="width: 880px;">
						<input id="pwd1" type="password" class="easyui-textbox" data-options="required:true" style="width: 90%;height: 32px;">
					</td>
				</tr>
				<tr>
					<td style="width: 120px;">新密码：</td>
					<td style="width: 880px;">
						<input id="pwd2" type="password" class="easyui-textbox" data-options="required:true" style="width: 90%;height: 32px;">
					</td>
				</tr>
				<tr>
					<td style="width: 120px;">重新输入新密码：</td>
					<td style="width: 880px;">
						<input id="pwd3" type="password" class="easyui-textbox" data-options="required:true" style="width: 90%;height: 32px;">
					</td>
				</tr>
			</table>
		</form>
		<div style="text-align: center;">
			<div id="adminedit" class="easyui-linkbutton" iconCls="icon-ok" style="width: 132px;height: 32px;">确认修改</div>
		</div>
	</div>
	<script>
		$(function(){
			$("#adminedit").click(function(){
				var a = $('#pwd1').val();
				var b = $('#pwd2').val();
				var c = $('#pwd3').val();
				var d = "${me.uid}";
				if(a == ""){
					$.messager.alert("提示","请输入原密码！","warning");
					return;
				}
				if(b == ""){
					$.messager.alert("提示","请输入新密码！","warning");
					return;
				}
				if(c == ""){
					$.messager.alert("提示","请输入再输入一次新密码！","warning");
					return;
				}
				if(b != c){
					$.messager.alert("提示","两次输入新密码不一致","warning");
					return;
				}else{
					$.ajax({
								url:base+"user/doAdjustuser",
								data:{"uid":d,"pwd1":a,"pwd2":b},
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

				}
			});
		});
	</script>
  </body>
</html>
