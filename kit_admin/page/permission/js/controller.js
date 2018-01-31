layui.use('layer', function(){ //独立版的layer无需执行这一句
var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
})
var fun = {
	popView:function(id){//添加
	var index = layui.layer.open({
		title : "创建",
		type : 2,
		content : "view.asp?id="+id+"",
		success : function(layero, index){
			setTimeout(function(){
				layui.layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
					tips: 3
				});
			},500)
		}
	})
	//改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
	$(window).resize(function(){
		layui.layer.full(index);
	})
	layui.layer.full(index);
  	},
	popCreate:function(){//添加
	var index = layui.layer.open({
		title : "创建",
		type : 2,
		content : "create.asp",
		success : function(layero, index){
			setTimeout(function(){
				layui.layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
					tips: 3
				});
			},500)
		}
	})
	//改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
	$(window).resize(function(){
		layui.layer.full(index);
	})
	layui.layer.full(index);
  	},
  	popUpdate:function(id){//添加
	var index = layui.layer.open({
		title : "更新",
		type : 2,
		content : "update.asp?id="+id+"",
		success : function(layero, index){
			setTimeout(function(){
				layui.layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
					tips: 3
				});
			},500)
		}
	})
	//改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
	$(window).resize(function(){
		layui.layer.full(index);
	})
	layui.layer.full(index);
  	},
  	updateStatus:function(el,id){//删除当前一条数据
  		var _this = $(el);
  		console.log(_this.val());
  		
  	},
  	_alertMes:function(){//添加成功
      	layer.msg('添加成功', {
      	  	btn: ['继续添加', '退出添加'],
      	  	yes: function(index, layero){
      	  		history.go(-1);
      	  	},
      	  	btn2: function(index, layero){
      	  		window.parent.location.reload();
      	  		parent.layer.closeAll();
      	  	}
      	},function(){window.parent.location.reload();parent.layer.closeAll();});
  	},
  	_alertSuccess:function(){//修改成功
		layer.msg('修改成功',{
			icon: 1,
			time: 2000 //2秒关闭（如果不配置，默认是3秒）
		},function(){window.parent.location.reload();parent.layer.closeAll();});
  	},
  	_alertFail:function(){//修改成功
		layer.msg('操作失败',{
			icon: 2,
			time: 2000 //2秒关闭（如果不配置，默认是3秒）
		},function(){window.parent.location.reload();parent.layer.closeAll();});
  	}

}

