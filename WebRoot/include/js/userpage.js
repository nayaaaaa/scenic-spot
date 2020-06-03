$(function(){
    $("#ladd").hide();
    $("#lsearch").hide();
    $("#lfavour").hide();
	mapinit();
		$("#a").click(function(){
			$("#lmap").hide();
			$("#ladd").show();
            $("#lsearch").hide();
            $("#lfavour").hide();
        });
        $("#b").click(function(){
            $("#lmap").show();
            $("#ladd").hide();
            $("#lsearch").hide();
            $("#lfavour").hide();
        });
        $("#c").click(function(){
            $("#lsearch").show();
            $("#lmap").hide();
            $("#ladd").hide();
            $("#lfavour").hide();
        });
        $("#d").click(function(){
            $("#lfavour").show();
            $("#lmap").hide();
            $("#lsearch").hide();
            $("#ladd").hide();
        });
        $("#exit").click(function(){
            top.location.href="user/doLogout";
        });
});

function mapinit(){
		var map = new BMap.Map("container");
		// 创建地图实例  
		var point = new BMap.Point(108.952673,34.276549);
		// 创建点坐标  
		map.centerAndZoom(point,10);
		// 初始化地图，设置中心点坐标和地图级别  
		/*map.addEventListener("click",function(e){
				alert(e.point.lng + "," + e.point.lat);
			});*/
		var opts1 = {anchor: BMAP_ANCHOR_BOTTOM_RIGHT}
		var opts = {offset: new BMap.Size(1190, 5)}
		map.addControl(new BMap.ScaleControl(opts1));
		map.addControl(new BMap.MapTypeControl());
		var opts2 = {type: BMAP_NAVIGATION_CONTROL_SMALL}  
		map.addControl(new BMap.NavigationControl(opts2)); 
		function ZoomControl(){    
			// 设置默认停靠位置和偏移量  
			this.defaultAnchor = BMAP_ANCHOR_BOTTOM_RIGHT;    
			this.defaultOffset = new BMap.Size(10, 10);    
		}    
		// 通过JavaScript的prototype属性继承于BMap.Control   
		ZoomControl.prototype = new BMap.Control();
		ZoomControl.prototype.initialize = function(map){    
			// 创建一个DOM元素   
			var div = document.createElement("div");    
			// 添加文字说明    
			div.appendChild(document.createTextNode("放大2级"));    
			// 设置样式    	
			div.style.cursor = "pointer";    
			div.style.border = "1px solid gray";    
			div.style.backgroundColor = "white";    
			// 绑定事件，点击一次放大两级    
			div.onclick = function(e){  
				map.zoomTo(map.getZoom() + 2);    
			}    
			// 添加DOM元素到地图中   
			map.getContainer().appendChild(div);    
			// 将DOM元素返回  
			return div;    
		}
		var myZoomCtrl = new ZoomControl();    
		// 添加到地图当中    
		map.addControl(myZoomCtrl);

		map.enableScrollWheelZoom();
		var marker = new BMap.Marker(point);        // 创建标注    
		map.addOverlay(marker); 
		marker.setAnimation(BMAP_ANIMATION_BOUNCE); 
		marker.enableDragging();
		var opts3 = {    
			width : 250,     // 信息窗口宽度    
			height: 500,     // 信息窗口高度    
			title : "窗口"  // 信息窗口标题   
		};
		function addClickHandler(content,marker){
			marker.addEventListener("click",function(e){
				openInfo(content,e)}
			);
		}
		function openInfo(content,e){
			var p = e.target;
			var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
			var infoWindow = new BMap.InfoWindow(content.join(""),opts3);  // 创建信息窗口对象 
			map.openInfoWindow(infoWindow,point); //开启信息窗口
		}
		$.ajax({
			url:"spot/getallSpot",
			type:"POST",
			success:function(res){
				var spots = res.spot;
				var data_info =new Array();
				for(var k=0;k<spots.length;k++){
					data_info[k]=new Array(4);
					var spot = spots[k];
					data_info[k][0] =[spot.positionx];
					data_info[k][1] =[spot.positiony];
					data_info[k][2] =[spot.content];
					data_info[k][3] =[spot.title];
					}
				for(var j=0;j<data_info.length;j++){
					var marker = new BMap.Marker(new BMap.Point(data_info[j][0],data_info[j][1]));  // 创建标注
					var content = data_info[j][2];
					map.addOverlay(marker);               // 将标注添加到地图中
					marker.setAnimation(BMAP_ANIMATION_BOUNCE); 
					addClickHandler(content,marker);
				}	
			},
			error:function(res){
				$.messager.alert("系统提示","系统错误,获取所有景点信息","error");
				}
		});
}