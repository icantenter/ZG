<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"--> 
<!--#include file="seeion.asp"--> 
<!--#include file="sqlerr.asp" -->
<%
set rs=server.createobject("adodb.recordset")
sql="select zw_name,ezw_name,sex,esex,nn1,nn2,xueli,exueli,renshu,yaoqiu,eyaoqiu,data from job"
rs.open sql,conn,1,3
zw_name=request.form("zw_name")
ezw_name=request.form("ezw_name")
sex=request.form("sex")
esex=request.form("esex")
nn1=request.form("nn1")
nn2=request.form("nn2")
xueli=request.form("xueli")
exueli=request.form("exueli")
renshu=request.form("renshu")
yaoqiu=request.form("yaoqiu")
eyaoqiu=request.form("eyaoqiu")
if zw_name="" or ezw_name="" then 
response.Write("<script language=javascript>alert('职位名称不能为空!');history.go(-1)</script>") 
response.end 
end if
if renshu="" then 
response.Write("<script language=javascript>alert('招聘人数不能为空!');history.go(-1)</script>") 
response.end 
end if
if yaoqiu="" or eyaoqiu="" then 
response.Write("<script language=javascript>alert('职位要求不能为空!');history.go(-1)</script>") 
response.end 
end if
rs.addnew
rs("zw_name")=zw_name
rs("ezw_name")=ezw_name
rs("sex")=sex
rs("esex")=esex
rs("nn1")=nn1
rs("nn2")=nn2
rs("xueli")=xueli
rs("exueli")=exueli
rs("renshu")=renshu
rs("yaoqiu")=yaoqiu
rs("eyaoqiu")=eyaoqiu
rs.update
rs.close
set rs=nothing
conn.close
set rs=nothing
%>
<%
Response.Write "<script>alert('职位发布成功！');window.location.href='admin_zw.asp';</script>" 
%>

