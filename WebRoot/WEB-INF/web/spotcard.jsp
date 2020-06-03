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
    <title>景点卡片</title>
	<link rel="shortcut icon" type="images/x-icon" href="<%=basePath%>include/img/travelB.png"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>include/easyui/themes/gray/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>include/easyui/themes/icon.css"/>
	<script type="text/javascript" src="<%=basePath%>include/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>include/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>include/easyui/locale/easyui-lang-zh_CN.js"></script>
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
    <div id="lnews" class="l-wrap">
		<div>
			<div>
				<div class="l-news">
					<div class="nheader">
						<table cellspacing="0" cellpadding="0"><tbody>
							<tr><td><h3>景点卡片：</h3></td></tr>
						</tbody></table>
					</div>
					<div class="nlist">
						<table id="newstable" width="100%">
							<tbody>
								<tr id="trpp"><td colspan="3" align="left"></td></tr>
							</tbody>
						</table>
					</div>
					<div id="pp" style="background: #efefef;"></div>
				</div>
			</div>
		</div>
	</div>
	<script>
		var pageN=1,pageTotal=100;
		$(function(){
			$.ajax({
				url:"spot/getCount",
				type:"post",
				success:function(res){
				pageTotal=parseInt(res.spotcount);
				listNews(1,10);
				loadPager();
				},
				error:function(res){
					$.messager.alert("系统提示","系统错误！","error");
					}
			});
		});
		function listNews(pageNumber,pageSize){
				$.ajax({
					url:"spot/listSpot",
					data:{"page":pageNumber,"rows":pageSize},
					type:"POST",
					success:function(res){
						$(".inews").remove();//res=JSON.parse(res);
						if(res.total <= 0){
							var tr="<tr class = 'inews' height = \"25\"><td >";
								tr+="<div class='t'>暂无景点</div>";
								tr+="</td><td width='1%' nowrap=''><span>&nbsp;</span></td></tr>";
							$("#trpp").before(tr);
						}
						else{
							pageN = pageNumber;
							pageTotal = res.total;
							var rows = res.rows;
							for (var i = 0; i < rows.length;) {
								var row = rows[i];
								var tr = "<tr class = 'inews' height =\"25\"><td >";
								tr+="<div class='t'><a href='spot/getaSpot?id="+row.id+"' target='_blank' title="+row.title+"'>"+row.title+"</a></div>";
								tr+="</td><td width='1%'nowrap=''><span>"+row.cruser+"&nbsp;</span></td></tr>";
							$("#trpp").before(tr);
							i++;
							if(i%5==0){
								tr="<tr class='inews'height='1'><td colspan='2'align='center'>";
								tr+="<hr style='border-style:dashed;border-color:#999999;width:99%;height:1px;border-width:1px 0px 0px 0px;visibility:inherit'></td></tr>";
								$("#trpp").before(tr);
							}
							}
						}
					},
					error:function(res){
						$.messager.alert("系统提示","系统错误-listNews","error");
						}
				})
			}
			function loadPager(){
				$('#pp').pagination({
					total:pageTotal,
					pageSize:10,
					pageNumber:pageN,
					displayMsg:'{from}/{to}共{total}条',
					onSelectPage:function(pageNumber,pageSize){
						listNews(pageNumber,pageSize);
					}
				});
			}
	</script>
  </body>
</html>