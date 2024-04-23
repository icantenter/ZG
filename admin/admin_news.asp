<!--#include file="utf-8.asp"-->
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
    <td height="30" bgcolor="#F7F7F7"><div><strong>新闻管理</strong><span class="text2"></span></div></td>
  </tr>
  <tr>
<td bgcolor="#FFFFFF">
            <%	
set rs=server.createobject("adodb.recordset") 
exec="select * from news order by id desc" 
rs.open exec,conn,1,1 
if rs.eof then
response.Write "&nbsp;暂无新闻！"
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
%><form method="POST" action="admin_news.asp?del=ok">
<%For i=1 To x%>
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolor="#FFFFFF">
        <tr>
          <td width="76%" bgcolor="#FFFFFF">
          <input type="checkbox" name="classid" value="<%=rs("id")%>">
 · <a href="../shownews.asp?id=<%=rs("id")%>" style="font-size:14px; color:#003399;"  target="_blank"> <%=left(rs("title"),30)%></a> 点击：<%=rs("hits")%></td>
          <td width="13%" bgcolor="#FFFFFF"><input type="button" name="Submit3" value="修改新闻" onClick="window.location.href='xiugai_news.asp?id=<%=rs("id")%>' "/> </td>
          <td width="11%" bgcolor="#FFFFFF"><input type="button" name="Submit" value="删除新闻" onClick="javascript:if(confirm('确定删除？删除后不可恢复!')){window.location.href='admin_news.asp?act=del&id=<%=rs("id")%>';}else{history.go(0);}" /> </td>
        </tr>
      </table>
      <%rs.movenext
next
%>
    <%
end if
%>
<br/>
<input type="submit" value="删除选中" name="B1">
</form>
</td>
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
if Request.QueryString("del")="ok" then
if Request("classid")="" then
Response.Write "<script>alert('请选择要删除的新闻!');window.location.href='admin_news.asp';</script>" 
response.end()
end if
dim sql
sql="delete from news where id in ("&Request("classid")&")"
conn.Execute ( sql )
conn.close
set conn=nothing
Response.Write "<script>alert('批量删除成功!');window.location.href='admin_news.asp';</script>" 
end if
%>

<%
if request("act")="del" then
	id=request("id")
	if id="" then
	Response.Write "<script language='javascript'>alert('参数错误!');document.location.href('admin_news.asp');</script>"
	Response.End()
	end if
set rs=server.createobject("adodb.recordset")
rs.open "Select * from news where id="&Request("id"),conn,1,3
if rs.bof and rs.eof then
	Response.Write "<script language='javascript'>alert('数据库中没有该记录！');document.location.href('admin_news.asp');</script>"
	Response.End()
else
	rs.Delete
	rs.Update
	Response.Write "<script language='javascript'>alert('成功删除指定的信息！');document.location.href('admin_news.asp');</script>"
end if
end if
%>
