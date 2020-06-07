$(function(){
    $("#llogin").hide();
    $("#lsignup").hide();
    var map = new BMap.Map("container");
    var point = new BMap.Point(108.952673,34.276549);
    map.centerAndZoom(point,10);
    var opts1 = {anchor: BMAP_ANCHOR_BOTTOM_RIGHT}
    map.addControl(new BMap.ScaleControl(opts1));
    map.addControl(new BMap.MapTypeControl());
    var opts2 = {type: BMAP_NAVIGATION_CONTROL_SMALL}  
    map.addControl(new BMap.NavigationControl(opts2)); 
    function ZoomControl(){    
        // 设置默认停靠位置和偏移量  
        this.defaultAnchor = BMAP_ANCHOR_BOTTOM_RIGHT;    
        this.defaultOffset = new BMap.Size(10, 10);    
    }
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

    var opts3 = {    
        width : 900,     // 信息窗口宽度    
        height: 1100,     // 信息窗口高度    
        title : "景点信息"  // 信息窗口标题   
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
                var title = data_info[j][3];
                map.addOverlay(marker);               // 将标注添加到地图中
                marker.setAnimation(BMAP_ANIMATION_BOUNCE);
                var label = new BMap.Label(title,{offset:new BMap.Size(20,-10)});
                marker.setLabel(label);
                addClickHandler(content,marker);
            }	
        },
        error:function(res){
            $.messager.alert("系统提示","系统错误,获取所有景点信息","error");
            }
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