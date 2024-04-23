<!--#include file="../Conn1.asp" -->
<!--#include file="seeion1.asp"-->
<!--#include file="page1.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" type="text/css" id="css" href="images/style1.css">
<title>留言管理</title>
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
</head>
<body>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#ffffff">
  <tr>
    <td height="30"><div  style="padding-left:10px; font-weight:bold; color:#000000">留言管理</div></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
    <form id="form1" name="form1" method="post" action=""> 
    
      <tr>
        <td bgcolor="#FFFFFF"><%	
set rs=server.createobject("adodb.recordset") 
exec="select * from jobly order by id desc" 
rs.open exec,conn,1,1 
if rs.eof then
response.write ("<div style=""padding:10px;"">暂无留言!</div>")
else
rs.PageSize =30 '每页记录条数
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
%>        </td>
      </tr>
      
      <tr onmouseover="style.backgroundColor='#EEEEEE'" onmouseout="style.backgroundColor='<%=bg%>'" bgcolor="<%=bg%>">
        <td colspan="2"><table width="100%" border="0" cellpadding="5" cellspacing="0">
         <tr bgcolor="#D9D9FF">
         <td width="8%">id</td>
         <td width="22%">招聘职位</td>
         <td width="10%">招聘姓名</td>
         <td width="15%">留言时间</td>
         <td width="12%">回复</td>
         <td width="13%">删除</td>
         </tr>
            <tr>
              <td width="8%" class="td"><input name="ID" type="checkbox" id="ID" value="<%=rs("id")%>" />
                <%=rs("id")%></td>
              <td width="22%" height="25" class="td"><a href="xiugai_jobly.asp?id=<%=rs("id")%>" style="color:#003399"><%=left(rs("title"),20)%></a></td>
              <td width="10%" class="td"><%=rs("name1")%></td>
              <td width="15%" class="td"><%=rs("data")%></td>
              <td width="12%" class="td">
                <input type="button" name="Submit3" value="回复" onclick="window.location.href='xiugai_ly.asp?id=<%=rs("id")%>' "  class="btn"/></td>
             
             <td width="13%" class="td">
               
                <input type="button" name="Submit" value="删除" onclick="javascript:if(confirm('确定删除？删除后不可恢复!')){window.location.href='?id=<%=rs("id")%>&amp;del=ok';}else{history.go(0);}"  class="btn"/>
                </td>
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
        <td width="49%" height="30"><table width="100%" border="0" cellpadding="5" cellspacing="0">
          <tr>
            <td width="47%" bgcolor="#F1F5F8">
          <input type="checkbox" name="allbox" onclick="CheckAll()" /><label>
         <select name="lx">
            <option selected="selected" value="">操作类型</option>
            <option value="1">通过审核</option>
            <option value="2">取消审核</option>
            <option value="3">批量删除</option>
          </select>
          <input type="submit" name="button" id="button" value="提交"  class="btn"/>
        </label></td>
            <td width="53%" bgcolor="#F1F5F8"><%call PageControl(iCount,maxpage,page,"border=0 align=right","<p align=right>")
rs.close
set rs=nothing
%></td>
          </tr>
        </table></td>
      </tr> </form>
    </table></td>
  </tr>
</table>
</body>
</html>
<%
if request("del")="ok" then
set rs=server.createobject("adodb.recordset")
id=Request.QueryString("id")
sql="select * from jobly where id="&id
rs.open sql,conn,2,3
rs.delete
rs.update
Response.Write "<script>alert('删除成功！');window.location.href='admin_jobly.asp';</script>"
end if 
%>
<%
if Request.QueryString("del")="checkbox" then
if Request("id")="" then
Response.Write "<script>alert('错误!请选择要操作的记录!');window.location.href='admin_ly.asp';</script>" 
response.end()
end if
dim sql
lx=request.Form("lx")
if lx="" then
Response.Write "<script>alert('错误!请选择操作类型!');window.location.href='admin_ly.asp';</script>" 
response.end
end if
if lx=1 then
sql="update ly set sh=1 where id in ("&Request("id")&")" 
conn.execute(sql) 
elseif lx=2 then 
sql="update ly set sh=0 where id in ("&Request("id")&")" 
conn.execute(sql) 
else
sql="delete from ly where id in ("&Request("id")&")"
conn.Execute ( sql )
end if
conn.close
set conn=nothing
Response.Write "<script>alert('恭喜!操作成功!');window.location.href='admin_ly.asp';</script>" 

end if
%>