<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<script language="javascript">
function showUploadDialog(s_Type, s_Link, s_Thumbnail){
var arr = showModalDialog("eWebEditor/dialog/i_upload.htm?style=popup&type="+s_Type+"&link="+s_Link+"&thumbnail="+s_Thumbnail, window, "dialogWidth:0px;dialogHeight:0px;help:no;scroll:no;status:no");}
</script>
<html>
<head>
<title>增加幻灯广告</title>
<link href="images/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td height="30" bgcolor="#FFFFFF"><div align="center">
      <table width="100%" border="0" cellpadding="0" cellspacing="1">
        <tr>
          <td height="30" bgcolor="#F7F7F7"><div align="center"><strong>增加幻灯广告</strong></div></td>
        </tr>
      </table>
    </div></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><FORM method="post" name="myform" action="add_flash.asp?add_flash=ok">
      <table width="100%" border="1" align="center" cellpadding="6" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#F7F7F7">
        <tr>
          <td width="15%" bgcolor="#FFFFFF"><div align="center"><font color="#FF0000">广告标题</font></div></td>
          <td width="85%" bgcolor="#FFFFFF"><input name="title" type="text" id="title" size="40"></td>
        </tr>
        <tr>
          <td width="15%" bgcolor="#F7F7F7"><div align="center"><font color="#FF0000">链接地址</font></div></td>
          <td bgcolor="#F7F7F7"><input name="link" type="text" id="link" size="40"></td>
        </tr>
        
        <tr>
          <td width="15%" bgcolor="#FFFFFF"><div align="center">幻灯图片</div></td>
          <td bgcolor="#FFFFFF"><input type=text name=img size=40>
             <input type=button value="上传图片" onClick="showUploadDialog('image', 'myform.img', '')"> 
            图片要求(jpg格式) </td>
        </tr>
        <tr>
          <td width="15%" bgcolor="#F7F7F7"><div align="center">排序ID</div></td>
          <td bgcolor="#F7F7F7"><label>
            <input name="px_id" type="text" id="px_id" size="5">
          数字越小越排前</label></td>
        </tr>
        
        <tr>
          <td bgcolor="#FFFFFF">&nbsp;</td>
          <td bgcolor="#FFFFFF"><input type="submit" name="button"  value="确认提交" /></td>
        </tr>
      </table>
      </form>    </td>
  </tr>
</table>
</body>
</html>
<% 
if Request.QueryString("add_flash")="ok" then
set rs=server.createobject("adodb.recordset")
sql="select title,link,img,px_id,tim from flash"
rs.open sql,conn,1,3
title=request.form("title")
link=request.form("link")
img=request.form("img")
px_id=request.form("px_id")
if title=""  then 
response.Write("<script language=javascript>alert('广告标题不能为空!');history.go(-1)</script>") 
response.end 
end if
if link=""  then 
response.Write("<script language=javascript>alert('链接地址不能为空!');history.go(-1)</script>") 
response.end 
end if
if img="" then 
response.Write("<script language=javascript>alert('图片不能为空!');history.go(-1)</script>") 
response.end 
end if
if px_id="" then 
response.Write("<script language=javascript>alert('排序ID不能为空!');history.go(-1)</script>") 
response.end 
end if
IF not isNumeric(request("px_id")) then
response.write("<script>alert(""排序ID必须为数字！""); history.go(-1);</script>")
response.end
end if
rs.addnew
rs("title")=title
rs("link")=link
rs("img")=img
rs("px_id")=px_id
rs.update
rs.close
set rs=nothing
conn.close
set rs=nothing
Response.Write "<script>alert('广告添加成功！点击继续添加！');window.location.href='add_flash.asp';</script>" 
end if
%> 

