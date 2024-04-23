<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<!--#include file="page.asp"-->
<!--#include file="sqlerr.asp" -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Ʒ</title>
<link href="images/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
<table width="95%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td height="30" bgcolor="#F7F7F7"><div><strong>工程管理</strong><span class="text2"></span></div></td>
  </tr>
  <tr>
<td bgcolor="#FFFFFF">
            <%	
set rs=server.createobject("adodb.recordset") 
exec="select * from case order by id desc" 
rs.open exec,conn,1,1 
if rs.eof then
response.Write "&nbsp;޲Ʒ"
else
rs.PageSize =20 'ÿҳ¼
iCount=rs.RecordCount '¼
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
      <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#FFFFFF">
        <tr>
          <td width="10%" bgcolor="#FFFFFF"><a href="<%=rs("img")%>" target="_blank"><img src="<%=rs("img")%>" width="60" height="40"></a></td>
          <td width="66%" bgcolor="#FFFFFF"><a href="../showshop.asp?id=<%=rs("id")%>" style="font-size:14px; color:#003399;" target="_blank"><%=left(rs("title"),30)%></a></td>
          <td width="13%" bgcolor="#FFFFFF"><input type="button" name="Submit3" value="修改内容" onClick="window.location.href='xiugai_case.asp?id=<%=rs("id")%>' "/> </td>
          <td width="11%" bgcolor="#FFFFFF"><input type="button" name="Submit" value="删除内容" onClick="javascript:if(confirm('确认删除?删除后不可恢复!')){window.location.href='admin_case.asp?act=del&id=<%=rs("id")%>';}else{history.go(0);}" /> </td>
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
    <td bgcolor="#FFFFFF"><%'ʾҳ
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
	Response.Write "<script language='javascript'>alert('确认删除!');document.location.href('admin_case.asp');</script>"
	Response.End()
	end if
set rs=server.createobject("adodb.recordset")
rs.open "Select * from case where id="&Request("id"),conn,1,3
if rs.bof and rs.eof then
	Response.Write "<script language='javascript'>alert('ݿ确认删除');document.location.href('admin_case.asp');</script>"
	Response.End()
else
	rs.Delete
	rs.Update
	Response.Write "<script language='javascript'>alert('删除成功');document.location.href('admin_case.asp');</script>"
end if
end if
%>
