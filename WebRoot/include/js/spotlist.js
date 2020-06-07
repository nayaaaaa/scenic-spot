var s_name="",id="",title="";
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
						}},
				  {		
					  title:'操作',field:'hitnum',width:50,formatter:function(value,row,index){
						var p="<a href=\"javascript:editNews('"+row.id+"')\">修改</a>";
						p+="|<a href =\"javascript:delNews('"+row.id+"','"+row.title+"')\">删除</a>";
						return p;
					}
				  }
			  ]],
			  toolbar:'#tb'
		  });
	  }
	  function editNews(id){
		  parent.swNewTab("修改景点信息","spot/goEdit?id="+id);
	  }
	  function delNews(newsid,title0){
		  id = newsid;
		  title = title0;
		  parent.$.messager.confirm("系统提示","您确定要删除“"+title+"”吗？",function(r){
			  if(r){
				$.ajax({
					url:"spot/doDell",
					data:{"id":id},
					type:"post",
					success:function(res){
						if(res.delflag){
							parent.$.messager.alert("系统提示","您已删除景点："+title,"info");							
							id="";s_name="";
							loadGrid();
						}else{
							parent.$.messager.alert("系统提示",res,"error");
						}
						return false;
					},
					error:function(res){
						parent.$.messager.alert("系统提示","系统错误-newlist-delNews函数","error");
						}
			  });
			}
		});
	  }
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
	  });