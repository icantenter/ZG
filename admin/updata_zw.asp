<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"--> 
<!--#include file="sqlerr.asp" -->
<% 
	id=request("id")
	if id="" or not isnumeric(id) then
	Response.Write "<script language='javascript'>alert('参数错误!');document.location.href('News_Manage.asp');</script>"
	Response.End()
	end if
	SQL="Select * from job where id="&id
	set rs=server.createobject("adodb.recordset")
	rs.open SQL,conn,1,3
	if rs.eof and rs.bof then
	Response.Write "<script language='javascript'>alert('参数错误!');document.location.href('News_Manage.asp');</script>"
	Response.End()
	end if
rs("zw_name")=request.form("zw_name")
rs("ezw_name")=request.form("ezw_name")
rs("sex")=request.form("sex")
rs("esex")=request.form("esex")
rs("nn1")=request.form("nn1")
rs("nn2")=request.form("nn2")
rs("xueli")=request.form("xueli")
rs("exueli")=request.form("exueli")
rs("renshu")=request.form("renshu")
rs("yaoqiu")=request.form("yaoqiu")
rs("eyaoqiu")=request.form("eyaoqiu")
rs.update 
rs.close 
response.write "<script>alert('职位修改成功!');window.location.href='admin_zw.asp';</script>"  
%> 

