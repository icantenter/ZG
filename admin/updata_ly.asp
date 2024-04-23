<!--#include file="../Conn1.asp" -->
<!--#include file="seeion1.asp" -->
<% 
id=request("id")
hf=request.form("hf")
	if id="" or not isnumeric(id) then
Response.Write "<script>alert('参数错误！');history.go(-1);</script>" 
	Response.End()
	end if
	SQL="Select * from ly where id="&id
	set rs=server.createobject("adodb.recordset")
	rs.open SQL,conn,1,3
	if rs.eof and rs.bof then
Response.Write "<script>alert('参数不正确，ID值不存在！');history.go(-1);</script>" 
	Response.End()
	end if
if hf=""  then 
response.Write("<script language=javascript>alert('请输入回复内容');history.go(-1)</script>") 
response.end 
end if
rs("hf")=hf
rs.update 
rs.close 
response.write "<script>alert('回复成功！');window.location.href='admin_ly.asp';</script>" 

%> 
