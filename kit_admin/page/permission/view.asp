<!--#include file="../../../common/easp.asp" -->
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>后台管理系统</title>
<link rel="stylesheet" href="../../plugins/layui/css/layui.css" media="all">
<link rel="stylesheet" href="../../src/css/common.css" media="all" />
<link rel="stylesheet" href="../../src/css/user.css" media="all" />
<link rel="stylesheet" href="../../src/fonts/iconfont.css" media="all" />
</head>
<body>

<div class="layui-fluid">
<%
dim sql,rsObj
Easp.Var("btnName")="新增"
Easp.Var("sty")="layui-hide"
Easp.Var("typ")=0
Easp.Var("id")=Easp.Get("id")        '当前ID
sql = "select * from cms_auth_item_child where parentid = {id}"
Set rsObj = Easp.Db.GetRS(sql)
if not rsObj.eof then
Easp.Var("parent")	= rsObj("parent")
end if
Easp.Db.Close(rsObj)
%>
<!--#include file="models/_formroute.asp"-->
</div>
</body>
</html>
