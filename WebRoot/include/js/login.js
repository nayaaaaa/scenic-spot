$(function(){
    $("#llogin").hide();
    $("#lsignup").hide();
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
		var local = new BMap.LocalSearch(map, {
			renderOptions:{map: map}
		});
		local.search("景点");
		var marker = new BMap.Marker(point);        // 创建标注    
		map.addOverlay(marker); 
		marker.setAnimation(BMAP_ANIMATION_BOUNCE); 
		marker.enableDragging();

		var opts3 = {    
			width : 250,     // 信息窗口宽度    
			height: 500,     // 信息窗口高度    
			title : "窗口"  // 信息窗口标题   
		}    
		var html = ["<div class='infoBoxContent'><div class='title'><strong>中海雅园</strong><span class='price'>均价43000</span></div>",
		"<div class='list'><ul><li><div class='left'><img src='house3.jpg'/></div><div class='left'><a target='_blank' href='http://map.baidu.com'>中海雅园南北通透四居室</a><p>4室2厅，205.00平米，3层</p></div><div class='rmb'>760万</div></li>"
		,"<li><div class='left'><img src='house1.jpg'/></div><div class='left'><a target='_blank' href='http://map.baidu.com'>中海雅园四居室还带保姆间</a><p>2室1厅，112.00平米，16层</p></div><div class='rmb'>300万</div></li>"
		,"<li><div class='left'><img src='house2.jpg'/></div><div class='left'><a target='_blank' href='http://map.baidu.com'>《有钥匙 随时看》花园水系</a><p>3室2厅，241.00平米，16层</p></div><div class='rmb'>400万</div></li>"
		,"<li><div class='left'><img src='house3.jpg'/></div><div class='left'><a target='_blank' href='http://map.baidu.com'>富力城D区正规楼王大三居</a><p>3室3厅，241.00平米，17层</p></div><div class='rmb'>600万</div></li>"
		,"<li class='last'><div class='left'><img src='house1.jpg'/></div><div class='left'><a target='_blank' href='http://map.baidu.com'>富力城豪，身份人士的象征</a><p>4室2厅，213.90平米，25层</p></div><div class='rmb'>700万</div></li>","</ul></div>"
		,"</div>"];
		marker.addEventListener("click",function(){
			var infoWindow = new BMap.InfoWindow(html.join(""), opts3);  // 创建信息窗口对象    
		map.openInfoWindow(infoWindow, map.getCenter());      // 打开信息窗口
        });
        
    $("#a").click(function(){
        $("#llogin").show();
        $("#lnews").hide();
        $("#lsignup").hide();
    });
    $("#b").click(function(){
        $("#llogin").hide();
        $("#lnews").show();
        $("#lsignup").hide();
    });
    $("#c").click(function(){
        $("#llogin").hide();
        $("#lnews").hide();
        $("#lsignup").show();
    });
	$('#login_form').keydown(function (e){
        if(e.keyCode == 13)
        {
            checkUserName();
        }
    });
    $("#login_submit").click(checkUserName);
    $("#sign_up").click(signUp);
});
function checkUserName()
{
    var a = $('#uid').val();
    var b = $('#pwd').val();
    if(a == ""){
        $.messager.alert("提示","请输入用户名！","warning");
        return;
    }
    if(b == ""){
        $.messager.alert("提示","请输入登录密码！","warning");
        return;
    }
    $.ajax({
        url:base+"user/doLogin",
        data:{"uid":a,"pwd":b},
        type:"post",
        success:function(res){
            if(res.ok){
                window.location.href=base+res.msg;
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
function signUp(){
    var a = $('#suid').val();
    var b = $('#spwd').val();
    var c = $('#sname').val();
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
                    url:base+"user/doSignup",
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
                        $.messager.alert("测试","系统错误signupajax","error","warning");
                        }
                	});
            }else{
                $.messager.alert("测试","帐号重复,请重新输入帐号","error","warning");
            }
            return false;
        },
        error:function(res){
            $.messager.alert("测试","系统错误sameidajax","error","warning");
            }
    });
}