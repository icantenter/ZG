<!--#include file="../Conn1.asp" -->
<!--#include file="seeion1.asp"-->
<!--#include file="page1.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" type="text/css" id="css" href="images/style.css">
<title>订单管理</title>
<script language="javascript"> 
<!-- 
function CheckAll(){ 
 for (var i=0;i<eval(form1.elements.length);i++){ 
  var e=form1.elements[i]; 
  if (e.name!="allbox") e.checked=form1.allbox.checked; 
 } 
} 
--> 
</script> 
<%
Function DelHtml(Str1)
  Dim regEx
  Set regEx = New RegExp
  regEx.Pattern = "(<[^>]*?>)"
  regEx.Global = True
  regEx.IgnoreCase = True
  DelHtml = replace(regEx.Replace(""&str1,""),"&nbsp;","")
End Function
%>
<%
Function InterceptString(txt,length)
    txt=trim(txt)
    x = len(txt)
    y = 0
    if x >= 1 then
        for ii = 1 to x
            if asc(mid(txt,ii,1)) < 0 or asc(mid(txt,ii,1)) >255 then '如果是汉字
                y = y + 2
            else
                y = y + 1
            end if
            if y >= length then
                txt = left(trim(txt),ii) '字符串限长
                exit for
            end if
        next
        InterceptString = txt
    else
        InterceptString = ""
    end if
End Function
%>
</head>
<body>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#666666">
  <tr>
    <td height="30" background="images/bg_list.gif"><div  style="padding-left:10px; font-weight:bold; color:#FFFFFF">留言管理</div></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
        <form id="form1" name="form1" method="post" action="admin_orders.asp?del=checkbox"> 
      <tr>
       
 <td colspan="2">
<%	
id= request.QueryString("lxid") 
set rs=server.createobject("adodb.recordset")
if id<>"" then
exec="select * from [ly] where state="& id &"  order by id desc" 
else
exec="select * from [ly] order by id desc"  
end if
rs.open exec,conn,1,1 
if rs.eof then
response.write ("<div style=""padding:10px;"">暂无记录!</div>")
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
<% 
for i=1 to rs.pagesize 
j=i 
if j mod 2=0 then 
bg="#F1F5F8" 
else 
bg="#FFFFFF" 
end if 
%>
</td>
      </tr>
      <tr onmouseover="style.backgroundColor='#EEEEEE'" onmouseout="style.backgroundColor='<%=bg%>'" bgcolor="<%=bg%>">
        <td colspan="3" ><table width="100%" border="0" cellpadding="5" cellspacing="0">
            <tr>
              <td width="3%" class="td"><input name="ID" type="checkbox" id="ID" value="<%=rs("id")%>" /></td>
              <td width="30%" class="td">留言：<a href="xiugai_orders.asp?id=<%=rs("id")%>"><b><%=InterceptString(DelHtml(rs("title")),40)%></b></a></td>
              
              <td width="17%" class="td"><%=rs("data")%></td>
              <td width="7%" class="td"><div align="center">
                <input type="button" name="Submit3" value="查看留言" onclick="window.location.href='xiugai_ly.asp?id=<%=rs("id")%>' "  class="btn"/>
              </div></td>
             <%if session("qx")=2 then%> <td width="7%" class="td">
                  
                  <div align="center">
                    <input type="button" name="Submit" value="删除" onclick="javascript:if(confirm('确定删除该订单？删除后不可恢复!')){window.location.href='admin_book.asp?id=<%=rs("id")%>&amp;del=ok';}else{history.go(0);}"  class="btn"/>
                  </div></td><%end if%>
            </tr>
          </table>
            <% 
rs.movenext 
if rs.eof then exit for 
next 
%>
            <%
end if
%></td>
      </tr>
      <tr onmouseover="style.backgroundColor='#EEEEEE'" onmouseout="style.backgroundColor='<%=bg%>'" bgcolor="<%=bg%>">
        <td width="60" height="30"> <div style="padding-left:5px;">
          <input type="checkbox" name="allbox" onclick="CheckAll()" />
        </div>
         </td>
        <td width="45%"><label>
         <select name="lxid">
            <option selected="selected" value="">操作类型</option>
            <option value="1">标记为新订单</option>
            <option value="2">标记为已处理</option>
          </select>
          <input type="submit" name="button" id="button" value="提交"  class="btn"/>
        </label></td>
        </form><td width="49%" height="30"><%call PageControl(iCount,maxpage,page,"border=0 align=right","<p align=right>")
rs.close
set rs=nothing
%></td>
      </tr>  
    </table></td>
  </tr>
</table>
</body>
</html>
<%
if request("del")="ok" then
set rs=server.createobject("adodb.recordset")
id=Request.QueryString("id")
sql="select * from orders where id="&id
rs.open sql,conn,2,3
rs.delete
rs.update
Response.Write "<script>alert('当前订单删除成功！');window.location.href='admin_orders.asp';</script>"
end if 
%>
<%
if Request.QueryString("del")="checkbox" then
if Request("id")="" then
Response.Write "<script>alert('错误!请选择要操作的记录!');window.location.href='admin_orders.asp';</script>" 
response.end()
end if
dim sql
lx=request.Form("lxid")
if lx="" then
Response.Write "<script>alert('错误!请选择操作类型!');window.location.href='admin_orders.asp';</script>" 
response.end
end if
if lx=1 then
sql="update orders set state=1 where id in ("&Request("id")&")" 
conn.execute(sql) 
elseif lx=2 then 
sql="update orders set state=2 where id in ("&Request("id")&")" 
conn.execute(sql)
elseif lx=3 then
sql="update orders set state=3 where id in ("&Request("id")&")" 
conn.execute(sql) 
elseif lx=4 then 
sql="update orders set state=4 where id in ("&Request("id")&")" 
conn.execute(sql) 
else
sql="delete from orders where id in ("&Request("id")&")"
conn.Execute ( sql )
end if
conn.close
set conn=nothing
Response.Write "<script>alert('恭喜!操作成功!');window.location.href='admin_orders.asp';</script>" 

end if
%>