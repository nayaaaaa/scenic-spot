<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <title>用户界面</title>
	<link rel="shortcut icon" type="images/x-icon" href="<%=basePath%>include/img/travelB.png"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>include/css/userpage.css"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>include/easyui/themes/gray/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>include/easyui/themes/icon.css"/>
	<script type="text/javascript" src="<%=basePath%>include/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>include/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>include/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="<%=basePath%>include/js/userpage.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=XKKhINLzq9AETPRye7MCDcwVCYxoOptg"></script>
    <script>var base ="<%=basePath%>";</script>
    <base href="<%=basePath%>">
  </head>
  <body>
    <div class="header">
        <div class="inner_c">
            <div class="logo">
                <img src="<%=basePath%>include/img/plane.png" height="40">
            </div>
            <div class="nav">
			  <div class="username">${me.name}</div>
              <div id="exit" class="easyui-linkbutton e-button" iconCls="icon-back" style="width: 65%;height: 96%;margin-right:15px;">退出</div>
            </div>
        </div>
    </div>
	<div class="cl"></div>
    <div class="content">
        <div id="ladd" class="box inner_c">
			<div class="add-cen">
				<div class="addspot">
					<label>景点名称：</label><input type="text" class="addtext" placeholder="输入景点名称" id="ctitle"/><br><br>
                    <br><label>申请理由：</label><textarea id="reason" cols="20" rows="5" class="addtext" placeholder="输入申请理由" ></textarea><br>
					<input id="addcom_submit" type="button" class="submit" value="申请"/>
				</div>
			</div>
        </div>
        <div id="lmap" class="box inner_c">
            <div class="map-cen">
                <div id="container"></div> 
            </div>
        </div>
        <div id="lsearch" class="box inner_c">
            <div class="serch-cen">
                <iframe src="spot/goBrowse" width="100%" height="95%" ></iframe>
            </div>
        </div>
        <div id="lfavour" class="box inner_c">
            <div style="padding-top: 20%;height: 100%;width: 100%;">
                <div style="font-size: 20;font-family:'YouYuan';">
                    <div style="float: left;">
                        <br><br><br><label>昵称：&nbsp;</label><input type="text" class="addtext" id="xname" placeholder="输入新昵称"/><br><br>
                        <input id="nicheng" type="button"  style="width: 90px; height:30;font-size: 20;font-family:'YouYuan';" value="修改昵称"/><br><br>
                    </div>
                    <div style="float: right;">
                        <label>原密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="password" class="addtext" id="pwd1"/><br><br>
                        <label>输入新密码：&nbsp;&nbsp;&nbsp;</label><input type="password" class="addtext" id="pwd2"/><br><br>
                        <label>再次输入新密码：</label><input type="password" class="addtext" id="pwd3"/><br><br>
                        <input id="adjust-pwd" type="button" style="width: 90px; height:30;font-size: 20;font-family:'YouYuan';" value="修改密码"/>
                    </div>
				</div>
            </div>
        </div>
        <div class="func inner_c">
            <ul>
                <li class="frist">
                    <p><img src="<%=basePath%>include/img/addspot.png" ></p>
                    <p class="bjbf">
                        <div id="a" class="butt">申请增加新景点</div>
                    </p>
                </li>
                <li>
                    <p><img src="<%=basePath%>include/img/local.png" ></p>
                    <p class="bjbf">
                        <div id="b" class="butt">地图模式</div> 
                    </p>
                </li>
                <li>
                    <p><img src="<%=basePath%>include/img/search.png" ></p>
                    <p class="bjbf">
                       <div id="c" class="butt">搜景点</div> 
                    </p>
                </li>
                <li class="last">
                    <p><img src="<%=basePath%>include/img/favor.png" ></p>
                    <p class="bjbf">
                        <div id="d" class="butt">个人管理</div>
                    </p>
                </li>
            </ul>
        </div>
        <div class="footer inner_c">Copyright@2017 javaEE.赵佳豪毕业设计作品.西安石油大学</div>
    </div>
  </body>
  <script>
      $(function(){
        $("#addcom_submit").click(function(){
            var a = $("#ctitle").val();
            var b = $("#reason").val();
            var c = "${me.uid}";
            console.log(c);
            if(a == ""){
                $.messager.alert("提示","请输入景点名称！","warning");
                return;
            }
            if(b == ""){
                $.messager.alert("提示","请输入申请理由！","warning");
                return;
            }
            $.ajax({
                url:base+"comment/saveAdd",
                data:{"ctitle":a,"content":b,"uid":c},
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
                    $.messager.alert("测试","系统错误addcom-ajax","error","warning");
                }
            });
        });
        $("#adjust-pwd").click(function(){
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
                            url:"user/doAdjustuser",
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
        $("#nicheng").click(function(){
            var a = $('#xname').val();
            var b = "${me.uid}";
            if(a == ""){
                $.messager.alert("提示","请输入新昵称！","warning");
                return;
            }
                $.ajax({
                            url:"user/doAdjustname",
                            data:{"uid":b,"name":a},
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
            
        });
      });
  </script>
</html>
