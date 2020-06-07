<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta charset="UTF-8"/>
    <title>浏览景点资料卡</title>
    <script>var base="<%=basePath%>";</script>
	<link rel="shortcut icon" type="images/x-icon" href="<%=basePath%>include/img/travelB.png"/>
	<script type="text/javascript" src="<%=basePath%>include/js/jquery.min.js"></script>
	<base href="<%=basePath%>">
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
	<div style="background: #B3DFDA; padding:0 10px; vertical-align: middle;">
		<img src="<%=basePath%>include/img/mountain.png" width="126" height="50" />
		<div style="float: right; line-height: 50px; margin-right: 10px; font-size: 9pt;">
			<span>【</span><a href="javascript:;" onclick="window.close()">关闭窗口</a><span>】</span>
		</div>
	  </div>
	  <div class="ndetail">
		  <div style="font-size:28px;font-weight: bold;text-align:center;">${spot.title}</div>
				<div style="font-size:14px;text-align:center;">
						<div>
							收录人:&nbsp;<strong>${spot.cruser}</strong>&nbsp;&nbsp;发布时间:&nbsp;<strong><fmt:formatDate value="${spot.tjdate}" pattern="yyyy-MM-dd"/></strong>&nbsp;&nbsp;更新时间:&nbsp;<strong><fmt:formatDate value="${spot.adate}" pattern="yyyy-MM-dd"/></strong>&nbsp;&nbsp;访问量&nbsp;<strong>[<span>${spot.hitnum}</span>]</strong>
						</div>
				</div>
		  <div class="nbody" style="padding:0px 8%;">
			  <div id="vsb_content">${spot.content}</div>
		  </div>
	  </div>
  </body>
</html>
