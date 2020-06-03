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
    <title>用户界面</title>
	<link rel="shortcut icon" type="images/x-icon" href="<%=basePath%>include/img/travelB.png"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/include/css/userpage.css"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/include/easyui/themes/gray/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/include/easyui/themes/icon.css"/>
	<script type="text/javascript" src="<%=basePath%>/include/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/include/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/include/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="<%=basePath%>/include/js/userpage.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=XKKhINLzq9AETPRye7MCDcwVCYxoOptg"></script>
    <script src="//libs.baidu.com/jquery/1.9.0/jquery.js"></script>
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
					<label>景点名称：</label><input type="text" class="addtext" id="title"/><br><br>
					<br><label>申请理由：</label><input type="text" class="addtext" id="reason"/><br><br>
					<input id="addspot_submit" type="button" class="submit" value="申请"/>
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
                <iframe src="spot/goList" width="100%" height="100%" ></iframe>
            </div>
        </div>
        <div id="lfavour" class="box inner_c">
            <div class="favour-cen">
                <div class="manage"">
                    <br><br><br><label>昵称：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="text" class="addtext" id="" placeholder="输入新昵称"/><br><br>
					<input id="nicheng" type="button" width="30px" size="28"  value="修改昵称"/><br><br>
                    <label>原密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="password" class="addtext" id=""/><br><br>
                    <label>输入新密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="password" class="addtext" id=""/><br><br>
                    <label>重新输入新密码：</label><input type="password" class="addtext" id=""/><br><br>
					<input id="adjust-pwd" type="button" width="50px" size="28" value="修改密码"/>
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
</html>
