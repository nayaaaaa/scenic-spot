var s_name="",id="",title="";
$(function(){
    loadGrid();
    $("#s_spot").click(function(){
        s_name=$("#s_name").val();
        loadGrid();
    });
    $("#tb").bind("keydown",function(e){
        var theEvent = e||window.event;  //兼容FF IE Opera
        var code = theEvent.keyCode||theEvent.which||theEvent.charCode;
        if(code == 13){
            $("#s_spot").click();
        }
    });
    $('#cityset').click(function(){
        loadGridcity();							
    });
    $('#districtset').click(function(){
        loadGriddistrict();
    });
});
	  function loadGrid(){
		  s_name=$("#s_name").val();
		  $("#dg").datagrid({
			  width:'98%',height:"96%",nowrap:false,
			  striped:true,border:true,collapsible:false,
			  url:"spot/listSpot",
			  queryParams:{"s_name":s_name},
			  pagination:true,
			  rownumbers:true,
              fitColumns:true,
              pageSize:20,
			  loadMsg:'数据加载中...',
			  columns:[[
				  {
					  title:'标题',field:'title',width:150,formatter:function(value,row,index){
						return '<a href="spot/getaSpot?id='+row.id+'" style="white-space:nowrap;"  target="_blank" title='+value+'>'+(value?value:'')+'</a>';
					}},
				  {
					  title:'发布时间',field:'tjdate',width:100,formatter:function(value,row,index){
						  return (new Date(row.tjdate).format('Y-m-d H:i'));
					  }},
					  {
						title:'更新时间',field:'adate',width:100,formatter:function(value,row,index){
							if(row.adate == null){
								return '<span style="white-space:nowrap;">暂无更新</span>';
							}else{
								return (new Date(row.adate).format('Y-m-d H:i'));
							}
						}}
			  ]],
			  toolbar:'#tb'
		  });
      }
	  function loadGridcity(){
        var c_name=$('#city').val();;
        $("#dg").datagrid({
            width:'98%',height:442,nowrap:false,
            striped:true,border:true,collapsible:false,
            url:"spot/getcity",
            queryParams:{"c_name":c_name},
            pagination:true,
            rownumbers:true,
            fitColumns:true,
            pageSize:20,
            loadMsg:'数据加载中...',
            columns:[[
                {
                    title:'标题',field:'title',width:100,formatter:function(value,row,index){
                        return '<a href="spot/getaSpot?id='+row.id+'" style="white-space:nowrap;"  target="_blank" title='+value+'>'+(value?value:'')+'</a>';
                }},
                {
                    title:'发布时间',field:'tjdate',width:75,formatter:function(value,row,index){
                        return (new Date(row.tjdate).format('Y-m-d H:i'));
                    }},
                {
                    title:'更新时间',field:'adate',width:75,formatter:function(value,row,index){
                        if(row.adate == null){
                            return '<span style="white-space:nowrap;">暂无更新</span>';
                        }else{
                            return (new Date(row.adate).format('Y-m-d H:i'));
                        }
                }},
                {
                    title:'城市',field:'city',width:50,formatter:function(value,row,index){
                        return '<span style="white-space:nowrap;">'+row.city+'</span>';
                }},
                {
                    title:'区县',field:'district',width:50,formatter:function(value,row,index){
                        return '<span style="white-space:nowrap;">'+row.district+'</span>';
                }}
            ]],
            toolbar:'#tb'
        });
    }
    function loadGriddistrict(){
        var d_name=$('#area').val();
        $("#dg").datagrid({
            width:'98%',height:442,nowrap:false,
            striped:true,border:true,collapsible:false,
            url:"spot/getdistrict",
            queryParams:{"d_name":d_name},
            pagination:true,
            rownumbers:true,
            fitColumns:true,
            pageSize:20,
            loadMsg:'数据加载中...',
            columns:[[
                {
                    title:'标题',field:'title',width:100,formatter:function(value,row,index){
                        return '<a href="spot/getaSpot?id='+row.id+'" style="white-space:nowrap;"  target="_blank" title='+value+'>'+(value?value:'')+'</a>';
                }},
                {
                    title:'发布时间',field:'tjdate',width:75,formatter:function(value,row,index){
                        return (new Date(row.tjdate).format('Y-m-d H:i'));
                    }},
                {
                    title:'更新时间',field:'adate',width:75,formatter:function(value,row,index){
                        if(row.adate == null){
                            return '<span style="white-space:nowrap;">暂无更新</span>';
                        }else{
                            return (new Date(row.adate).format('Y-m-d H:i'));
                        }
                }},
                {
                    title:'城市',field:'city',width:50,formatter:function(value,row,index){
                        return '<span style="white-space:nowrap;">'+row.city+'</span>';
                }},
                {
                    title:'区县',field:'district',width:100,formatter:function(value,row,index){
                        return '<span style="white-space:nowrap;">'+row.district+'</span>';
                }}
            ]],
            toolbar:'#tb'
        });
    }