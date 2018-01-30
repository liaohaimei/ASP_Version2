<!--#include file="../../../../common/easp.asp" -->
<%
Dim sql,rs,rsjson,json
'定义SQL
sql = "Select * From wspcms_admin"
'定义每页记录数
Easp.Db.PageSize = 5
'取得分页记录集
Set rs = Easp.Db.GetRS(sql)
'不用\uxxxx形式编码生成JSON中的中文字符
Easp.Json.EncodeUnicode = False
'生成JSON格式数据
rsjson = Easp.Encode(rs)
Easp.Db.Close(rs)
'解析JSON，准备为JSON添加数据
Set json = Easp.Decode(rsjson)
'为JSON数据添加"总记录数"、"总页数"、"当前页码"和"每页记录数"
json.Put "total", Easp.Db.PageRecordCount
json.Put "pagecount", Easp.Db.PageCount
json.Put "pageindex", Easp.Db.PageIndex
json.Put "pagesize", Easp.Db.PageCurrentSize
'输出更新后的JSON
Easp.Echo json.toString()
Set json = nothing
%>