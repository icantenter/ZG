<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<!--#include file="sqlerr.asp" --> 
<%
set rs=server.createobject("adodb.recordset")
sql="select title,ProductNo,etitle,body,ebody,ssfl,img,data from books"
rs.open sql,conn,1,3
title=request.form("title")
ProductNo=request.form("ProductNo")
etitle=request.form("etitle")
body=request.form("body")
ebody=request.form("ebody")
ssfl=request.form("ssfl")
img=request.form("img")
if title=""  then 
response.Write("<script language=javascript>alert('书籍中文名称不能为空!');history.go(-1)</script>") 
response.end 
end if
if etitle=""  then 
response.Write("<script language=javascript>alert('书籍英文名称不能为空!');history.go(-1)</script>") 
response.end 
end if
if body="" then 
response.Write("<script language=javascript>alert('书籍中文内容不能为空!');history.go(-1)</script>") 
response.end 
end if
if ebody="" then 
response.Write("<script language=javascript>alert('书籍英文内容不能为空!');history.go(-1)</script>") 
response.end 
end if

rs.addnew
rs("title")=title
rs("ProductNo")=ProductNo
rs("etitle")=etitle
rs("body")=body
rs("ebody")=ebody
rs("ssfl")=ssfl
rs("img")=img
rs.update
rs.close
set rs=nothing
conn.close
set rs=nothing
%>

<%
Response.Write "<script>alert('书籍增加成功！点击继续添加！');window.location.href='add_book.asp';</script>" 
%>

