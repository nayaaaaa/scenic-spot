alert("系统提示");
var pageN=1,pageTotal=100;
var base="./";
console.log(pageN);
$(function(){
    $('#login_form').keydown(function (e){
        if(e.keyCode == 13)
        {
            checkUserName();
            alert("系统提示");
        }
    })
    $("#login_submit").click(checkUserName);
    $.ajax({
        url:"./news/getCount",
        type:"post",
        success:function(res){
           pageTotal=parseInt(res);
           listNews(1,10);loadPager();
        },
        error:function(res){
            $.messager.alert("系统提示","ajax系统错误！","error");
            }
    });
    $("#llogin").hide();
    $("#a").click(function(){
        $("#llogin").show();
        $("#lnews").hide();
    });
    $("#b").click(function(){
        $("#llogin").hide();
        $("#lnews").show();
    });
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
        url:base+"user/doLogin",//不确定base路径是不是声明了
        data:{"uid":a,"pwd":b},
        type:"POST",
        success:function(res){
            if(res.ok){
                window.location.href=base+res.msg;
            }else{$.messager.alert("提示","res.msg！","warning");}
            return false;
        },
        error:function(res){
            $.messager.alert("测试","系统错误！","error","warning");
            }
    });
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