var opened_node;
$(function(){
	$('#spot-tree').tree(
	{
		url:"spot-tree",
		animate:true,
		onClick:function(node){
            if(!node.attributes){
                if(!opened_node){
                    $("#spot-tree").tree('expand',node.target);
                    opened_node = node.target;
                }else if(opened_node != node.target){
                    $("#spot-tree").tree('collapse',opened_node);
                    $("#spot-tree").tree('expand',node.target);
                    opened_node = node.target;
                }
            }else{
                swNewTab(node.text,node.attributes.url);
            }
		},
		onLoadSuccess:function(node,data){
		    $("#spot-tree").tree('expandAll');
		}
		});
	$("#logout").click(function(){
    	top.location.href="user/doLogout";
	});
	swNewTab('查询',"spot/goList");
});

function closeAllTabs(){
    var tabs=$("#tabs").tabs("tabs");
    for(var i=0;i<tabs.length;i++){
        $("#tabs").tabs("close",i);
    }
}
function swNewTab(newtitle,newurl){
    if($("#tabs").tabs('exists',newtitle))return;
    closeAllTabs();
    $("#tabs").tabs('add',{
        title:newtitle,
        content:'<iframe id="mainframe" name="mainframe" scrolling="auto" height="99%" width="99%" frameboder="0" src="'+newurl+'"></iframe>',
        closable:true
    });
}
function addNewTab(newtitle,newurl){
    if($("#tabs").tabs('exists',newtitle))return;
    $("#tabs").tabs('add',{
        title:newtitle,
        content:'<iframe id="mainframe" name="mainframe" scrolling="auto" height="99%" width="99%" frameboder="0" src="'+newurl+'"></iframe>',
        closable:true
    });
}