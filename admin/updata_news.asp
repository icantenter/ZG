﻿<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"--> 
<!--#include file="sqlerr.asp" -->
<% 
	id=request("id")
	if id="" or not isnumeric(id) then
	Response.Write "<script language='javascript'>alert('参数错误!');document.location.href('News_Manage.asp');</script>"
	Response.End()
	end if
	SQL="Select * from news where id="&id
	set rs=server.createobject("adodb.recordset")
	rs.open SQL,conn,1,3
	if rs.eof and rs.bof then
	Response.Write "<script language='javascript'>alert('参数错误!');document.location.href('News_Manage.asp');</script>"
	Response.End()
	end if
rs("title")=request.form("title")
rs("etitle")=request.form("etitle")
rs("body")=request.form("body")
rs("ebody")=request.form("ebody")
rs("ssfl")=request.form("ssfl")
rs("zz")=request.form("zz")
rs("ly")=request.form("ly")
rs.update 
rs.close 
response.write "<script>alert('新闻修改成功！');window.location.href='admin_news.asp';</script>" 
%> 
