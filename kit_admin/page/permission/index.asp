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
        <col width="15%">
        </colgroup>
        <thead>
        <tr>
          <th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose" id="allChoose"></th>
          <th class="text-left">名称</th>
          <th class="text-left">描述</th>
          <th>操作</th>
        </tr> 
        </thead>
        <tbody class="users_content">
<%
Dim rs,sql
Easp.Db.PageSize = 1
'这里演示下如何使用使用Like需要的参数，通过在超级变量中嵌入静态标签就组合成了新的参数
Easp.Var("likeKey") = "%{=key}%"
'获取内容记录集
Easp.Var("type") = 2
sql = "Select id,name,description,updated_at From wspcms_auth_item  where type = {type}"
Set rs = Easp.Db.GetRS(sql)

'Set rs = Easp.Db.GetRS("Select a.ContentID, a.ContentClassID, b.ContentClassName, a.ContentTitle, a.AnnounceTime, b.SortLevel From EC_Content a Inner join EC_ContentClass b On a.ContentClassID = b.ContentClassID Where a.AnnounceTime<=NOW() And ({classid}='' Or a.ContentClassID = {classid}) And ({key}='' Or a.ContentTitle Like {likeKey}) Order By AnnounceTime Desc")
If Easp.Has(rs) Then
Easp.Console rs
While Not rs.Eof
%>
<tr data-id="<%=rs("id")%>">
                    <td>
                        <input type="checkbox" value="15" name="id" lay-skin="primary" lay-filter="choose">
                        <div class="layui-unselect layui-form-checkbox" lay-skin="primary">
                            <i class="layui-icon"></i>
                        </div>
                    </td>
                    <td class="text-left">
                        <%=rs("name")%>
                    </td>
                    <td class="text-left">
                        <%=rs("description")%>
                    </td>
                    <td>
                        <a class="layui-btn layui-btn-primary layui-btn-xs users_edit" onclick="fun.popView(<%=rs("id")%>)">查看</a><a class="layui-btn layui-btn-xs users_edit" onclick="fun.popUpdate(<%=rs("id")%>)"> 编辑</a><a class="layui-btn layui-btn-danger layui-btn-xs del-data" data-id="<%=rs("id")%>"><i class="layui-icon"></i> 删除</a>
                    </td>
                </tr>
<%
    rs.MoveNext()
  Wend
Else
%>
<tr>
  <td colspan="5">没有数据</td>
</tr>
 <%
End If
Easp.Db.Close(rs)
%>

        </tbody>
    </table>
  </div>
<%
Easp.WN "每页数量：" & Easp.Db.PageSize
Easp.WN "总记录数：" & Easp.Db.PageRecordCount
Easp.WN "总页数：" & Easp.Db.PageCount
Easp.WN "当前页码：" & Easp.Db.PageIndex
Easp.WN "当前页记录数：" & Easp.Db.PageCurrentSize
Easp.WN "当前页最小记录行号：" & Easp.Db.PageMinRow
Easp.WN "当前页最大记录行号：" & Easp.Db.PageMaxRow
%>

<%Easp.Print Easp.Db.GetPager("default")%>

  <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
   <script src="../../plugins/layui/layui.js"></script>
</body>
</html>