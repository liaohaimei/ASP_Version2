<!--#include file="../../../common/easp.asp" -->
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>用户总数--layui后台管理模板</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="../../plugins/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="../../src/css/common.css" media="all" />
  <link rel="stylesheet" href="../../src/css/user.css" media="all" />
</head>
<body class="childrenBody">
  <blockquote class="layui-elem-quote news_search">
    <div class="layui-inline">
        <div class="layui-input-inline">
          <input type="text" value="" placeholder="请输入关键字" class="layui-input search_input">
        </div>
        <a class="layui-btn search_btn">查询</a>
    </div>
    <div class="layui-inline">
      <a class="layui-btn layui-btn-normal " onclick="fun.popCreate()">添加</a>
    </div>
    <div class="layui-inline">
      <a class="layui-btn layui-btn-danger batchDel">批量删除</a>
    </div>
  </blockquote>
  <div class="layui-form users_list">
      <table class="layui-table">
        <colgroup>
        <col width="50">
        <col>
        <col width="18%">
        <col width="8%">
        <col width="12%">
        <col width="12%">
        <col width="18%">
        <col width="15%">
        </colgroup>
        <thead>
        <tr>
          <th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose" id="allChoose"></th>
          <th class="text-left">登录名</th>
          <th class="text-left">邮箱</th>
          <th>性别</th>
          <th>会员等级</th>
          <th>会员状态</th>
          <th>最后登录时间</th>
          <th>操作</th>
        </tr> 
        </thead>
        <tbody class="users_content">

        </tbody>
    </table>
  </div>
  <div id="page"></div>
  <div id="pageDemo"></div>
  <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
   <script src="../../plugins/layui/layui.js"></script>
  <!-- <script type="text/javascript" src="js/controller.js"></script> -->
  <script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
  
  <!-- 这里同样支持 laytpl 语法，如： -->
  {{#  if(d.auth > 2){ }}
    <a class="layui-btn layui-btn-xs" lay-event="check">审核</a>
  {{#  } }}
</script>

<script>
layui.use('table', function(){
  var table = layui.table;
  table.render({
    cols: [[
      {field:'id', title:'ID', width:100}
      ,{fixed: 'right', width:150, align:'center', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器
    ]]
  });
});
$(function(){


  $.get('data/json_data.asp',  //分页页面地址
      {page:5},   //要获取的页码
      function(data){  //回调
        console.log(data);
        //alert(data.rows[2].产品名称); //第3行记录的产品名称
      }, 
      'json'  //指定ajax返回后的是json格式数据
);
})
</script>
</body>
</html>