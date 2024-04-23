<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"--> 
<!--#include file="sqlerr.asp" -->
<%
set rs=server.createobject("adodb.recordset")
sql="select title,etitle,body,ebody,ssfl,zz,ly,data from news"
rs.open sql,conn,1,3
title=request.form("title")
etitle=request.form("etitle")
body=request.form("body")
ebody=request.form("ebody")
ssfl=request.form("ssfl")
zz=request.form("zz")
ly=request.form("ly")
if title=""  then 
response.Write("<script language=javascript>alert('中文标题不能为空!');history.go(-1)</script>") 
response.end 
end if
if etitle=""  then 
response.Write("<script language=javascript>alert('英文标题不能为空!');history.go(-1)</script>") 
response.end 
end if
if body="" then 
response.Write("<script language=javascript>alert('中文内容不能为空!');history.go(-1)</script>") 
response.end 
end if
if ebody="" then 
response.Write("<script language=javascript>alert('中文内容不能为空!');history.go(-1)</script>") 
response.end 
end if

rs.addnew
rs("title")=title
rs("etitle")=etitle
rs("body")=body
rs("ebody")=ebody
rs("ssfl")=ssfl
rs("zz")=zz
rs("ly")=ly

rs.update
rs.close
set rs=nothing
conn.close
set rs=nothing
%>

<%
Response.Write "<script>alert('新闻增加成功！点击继续添加！');window.location.href='add_news.asp';</script>" 
%>

