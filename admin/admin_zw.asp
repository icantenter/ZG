﻿<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<!--#include file="page.asp"-->
<!--#include file="sqlerr.asp" -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>职位管理</title>
<link href="images/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
<table width="95%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td height="30" bgcolor="#F7F7F7"><div><strong>职位管理</strong><span class="text2"></span></div></td>
  </tr>
  <tr>
<td bgcolor="#FFFFFF">
            <%	
set rs=server.createobject("adodb.recordset") 
exec="select * from job order by id asc" 
rs.open exec,conn,1,1 
if rs.eof then
response.Write "&nbsp;暂无职位！"
else
rs.PageSize =20 '每页记录条数
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
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolor="#FFFFFF">
        <tr>
          <td width="21%" bgcolor="#FFFFFF">职位名称：<b><%=left(rs("zw_name"),30)%></b></td>
          <td width="15%" bgcolor="#FFFFFF">年龄：<%=rs("nn1")%>-<%=rs("nn2")%>岁</td>
          <td width="11%" bgcolor="#FFFFFF">性别：
          <%
if rs("sex")=1 then 
response.write "男" 
elseif rs("sex")=2 then
response.write "女" 
else 
response.write("不限")
end if
%></td>
          <td width="12%" bgcolor="#FFFFFF">学历：<%=rs("xueli")%></td>
          <td width="20%" bgcolor="#FFFFFF">人数：<%=rs("renshu")%></td>
          <td width="9%" bgcolor="#FFFFFF"><input type="button" name="Submit3" value="修改职位" onClick="window.location.href='xiugai_zw.asp?id=<%=rs("id")%>' "/> </td>
          <td width="12%" bgcolor="#FFFFFF"><input type="button" name="Submit" value="删除职位" onClick="javascript:if(confirm('确定删除？删除后不可恢复!')){window.location.href='admin_zw.asp?act=del&id=<%=rs("id")%>';}else{history.go(0);}" /> </td>
        </tr>
      </table>
      <%rs.movenext
next
%>
    <%
end if
%></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><%'以下显示分页
 call PageControl(iCount,maxpage,page,"border=0 align=center","<p align=center>")
rs.close
set rs=nothing
%></td>
  </tr>
</table>
</body>
</html>

<%
if request("act")="del" then
	id=request("id")
	if id="" then
	Response.Write "<script language='javascript'>alert('参数错误!');document.location.href('admin_zw.asp');</script>"
	Response.End()
	end if
set rs=server.createobject("adodb.recordset")
rs.open "Select * from job where id="&Request("id"),conn,1,3
if rs.bof and rs.eof then
	Response.Write "<script language='javascript'>alert('数据库中没有该记录！');document.location.href('admin_zw.asp');</script>"
	Response.End()
else
	rs.Delete
	rs.Update
	Response.Write "<script language='javascript'>alert('成功删除指定的信息！');document.location.href('admin_zw.asp');</script>"
end if
end if
%>
