<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta charset="UTF-8"/>
    <title>浏览景点资料卡</title>
    <script>var base="<%=basePath%>";</script>
	<link rel="shortcut icon" type="images/x-icon" href="<%=basePath%>include/img/travelB.png"/>
	<script type="text/javascript" src="<%=basePath%>include/js/jquery.min.js"></script>
	<base href="<%=basePath%>">
	
  </head>
  
  <body>
	<div style="background: #B3DFDA; padding:0 10px; vertical-align: middle;">
		<img src="<%=basePath%>include/img/mountain.png" width="126" height="50" />
		<div style="float: right; line-height: 50px; margin-right: 10px; font-size: 9pt;">
			<span>【</span><a style="color: rgb(72, 72, 83);" href="javascript.window.close();"><span>关闭窗口</span></a><span>】</span>
		</div>
	  </div>
	  <div class="ndetail">
		  <div class="ntitle">${spot.title}</div>
				<div class="nauthor">
						<div>
							收录人:&nbsp;<strong>${spot.cruser}</strong>&nbsp;&nbsp;发布时间:&nbsp;<strong><fmt:formatDate value="${spot.tjdate}" pattern="yyyy-MM-dd"/></strong>&nbsp;&nbsp;更新时间:&nbsp;<strong><fmt:formatDate value="${spot.update}" pattern="yyyy-MM-dd"/></strong>&nbsp;&nbsp;访问量&nbsp;<strong>[<span>${spot.hitnum}</span>]</strong>
						</div>
				</div>
		  <div class="nbody">
			  <div id="vsb_content">${spot.content}</div>
		  </div>
	  </div>
  </body>
</html>
