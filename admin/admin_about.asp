﻿<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<!--#include file="page.asp"-->
<!--#include file="sqlerr.asp" -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>列表管理</title>
<link href="images/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
<table width="95%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td height="30" colspan="2" bgcolor="#F7F7F7"><div><strong>列表管理</strong><span class="text2"></span></div></td>
  </tr>
  <tr>
<td colspan="2" bgcolor="#FFFFFF">
            <%	
set rs=server.createobject("adodb.recordset") 
exec="select * from about order by px_id asc" 
rs.open exec,conn,1,1 
if rs.eof then
response.Write "&nbsp;暂无内容！"
else
rs.PageSize =10 '每页记录条数
iCount=rs.RecordCount '记录总数
iPageSize=rs.PageSize
maxpage=rs.PageCount 
page=request("page")
if Not IsNumeric(page) or page="" then
page=1
else
page=cint(page)
end if
if page<1 then
page=1
elseif  page>maxpage then
page=maxpage
end if
rs.AbsolutePage=Page
if page=maxpage then
x=iCount-(maxpage-1)*iPageSize
else
x=iPageSize
end if	
%>
<%For i=1 To x%>
<form  name="add" method="post" action="admin_about.asp?xiugaipx=ok">
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
        <tr>
          <td width="23%" bgcolor="#FFFFFF"><input name="id" type="hidden" id="id" value="<%=rs("id")%>" />中文：<a href="../about.asp?id=<%=rs("id")%>" style="font-size:14px; color:#003399;" target="_blank"><%=rs("title")%></a></td>
          <td width="30%" bgcolor="#FFFFFF">英文：<a href="../eabout.asp?id=<%=rs("id")%>" style="font-size:14px; color:#003399;" target="_blank"><%=rs("etitle")%></a></td>
          <td width="14%" bgcolor="#FFFFFF">排序： 
            <input name="px_id" type="text" value="<%=rs("px_id")%>" size="2"></td>
          <td width="11%" bgcolor="#FFFFFF"><label>
            <input type="submit" name="button" id="button" value="修改排序">
          </label></td>
          <td width="11%" bgcolor="#FFFFFF"><input type="button" name="Submit3" value="修改内容" onClick="window.location.href='xiugai_about.asp?id=<%=rs("id")%>' "/> </td>
          <td width="11%" bgcolor="#FFFFFF"><input type="button" name="Submit" value="删除栏目" onClick="javascript:if(confirm('确定删除？删除后不可恢复!')){window.location.href='admin_about.asp?act=del&id=<%=rs("id")%>';}else{history.go(0);}" /> </td>
        </tr>
      </table></form>
      <%rs.movenext
next
%>
 <%
end if
%>
</td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><%'以下显示分页
 call PageControl(iCount,maxpage,page,"border=0 align=center","<p align=center>")
rs.close
set rs=nothing
%></td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
</table>
</body>
</html>
<% 
if Request.QueryString("xiugaipx")="ok" then
id=request("id") 
sql="select * from about where id="&id 
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
IF not isNumeric(request("px_id")) then
response.write("<script>alert(""排序ID必须为数字！""); history.go(-1);</script>")
response.end
end if
rs("px_id")=request.form("px_id") 
rs.update 
rs.close 
response.Write("<script language=""javascript"">alert(""修改排序成功！"");window.location.href='admin_about.asp';</script>")
end if
%> 
<%
if request("act")="del" then
	id=request("id")
	if id="" then
	Response.Write "<script language='javascript'>alert('参数错误!');document.location.href('admin_about.asp');</script>"
	Response.End()
	end if
set rs=server.createobject("adodb.recordset")
rs.open "Select * from about where id="&Request("id"),conn,1,3
if rs.bof and rs.eof then
	Response.Write "<script language='javascript'>alert('数据库中没有该记录！');document.location.href('admin_about.asp');</script>"
	Response.End()
else
	rs.Delete
	rs.Update
	Response.Write "<script language='javascript'>alert('成功删除指定的信息！');document.location.href('admin_about.asp');</script>"
end if
end if
%>
