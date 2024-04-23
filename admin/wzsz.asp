<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<% 
set config=server.createobject("adodb.recordset") 
exec="select top 10 * from  config  " 
config.open exec,conn,1,1 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>网站设置</title>
<LINK href="images/style.css" type=text/css rel=stylesheet>

</head>
<body>
<form  name="add" method="post" action="updata_wzsz.asp">
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td height="35" bgcolor="#F7F7F7"><div style="padding-left:20px;"><strong>网站设置</strong></div></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><table width="100%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="font">
      <tr bgcolor="#FFFFFF">
        <td height="25" width="17%" bgcolor="#F7F7F7">网站名称 <font color="#FF0000">(中文)</font></td>
        <td colspan="3" bgcolor="#F7F7F7"><input name="title" type="text" value="<%=config("title")%>" size="50" /> <input name="id" type="hidden" id="id" value="<%=config("id")%>" /></td>
      </tr>
      <tr>
        <td height="25" width="17%" bgcolor="#FFFFFF">网站名称 <font color="#FF0000">(英文)</font></td>
        <td colspan="3" bgcolor="#FFFFFF"><input name="etitle" type="text" " value="<%=config("etitle")%>" size="50" /></td>
      </tr>
      <tr>
        <td height="25" width="17%" bgcolor="#F7F7F7">网站域名</td>
        <td colspan="3" bgcolor="#F7F7F7"><input name="url" type="text"  value="<%=config("url")%>" size="50" /></td>
      </tr>
      <tr>
        <td height="25" width="17%" bgcolor="#FFFFFF">联系人</td>
        <td colspan="3" bgcolor="#FFFFFF"><input name="name" type="text" value="<%=config("name")%>" size="20" />
          <font color="#FF0000">(中文)</font>
          <input name="ename" type="text" value="<%=config("ename")%>"  size="20" /> 
          <font color="#FF0000">(英文)</font></td>
      </tr>
      <tr>
        <td height="25" width="17%" bgcolor="#F7F7F7">公司邮箱</td>
        <td colspan="3" bgcolor="#F7F7F7"><input name="mail" type="text" value="<%=config("mail")%>"  size="50" /></td>
      </tr>
      <tr>
        <td height="25" width="17%" bgcolor="#FFFFFF">公司电话</td>
        <td colspan="3" bgcolor="#FFFFFF"><input name="tel" type="text" value="<%=config("tel")%>" size="50" /></td>
      </tr>
      <tr>
        <td height="25" width="17%" bgcolor="#F7F7F7">公司传真</td>
        <td colspan="3" bgcolor="#F7F7F7"><input name="fax" type="text"  value="<%=config("fax")%>" size="50" /></td>
      </tr>
      <tr>
        <td height="25" width="17%" bgcolor="#FFFFFF">公司地址<font color="#FF0000">(中文)</font></td>
        <td colspan="3" bgcolor="#FFFFFF"><input name="dz" type="text" id="textfield8" value="<%=config("dz")%>" size="50" /></td>
      </tr>
      <tr>
        <td width="17%" height="12" bgcolor="#F7F7F7">公司地址<font color="#FF0000">(英文)</font></td>
        <td colspan="3" bgcolor="#F7F7F7"><input name="edz" type="text" id="textfield10" value="<%=config("edz")%>" size="50" /></td>
      </tr>
      <tr>
        <td width="17%" height="5" bgcolor="#FFFFFF">备案编号</td>
        <td colspan="3" bgcolor="#FFFFFF"><input name="beian" type="text" value="<%=config("beian")%>"  size="50" /></td>
      </tr>
      <tr>
        <td width="17%" height="2" bgcolor="#F7F7F7">文章内容字体大小</td>
        <td width="27%" bgcolor="#F7F7F7"><label>
          <select name="font_size" id="select">
            <option value="12">12px</option>
            <option value="14" selected="selected">14px</option>
            <option value="16">16px</option>
          </select>
        内容页字体大小，默认14px</label></td>
        <td width="10%" bgcolor="#F7F7F7"><div align="center">行高：</div></td>
        <td width="46%" bgcolor="#F7F7F7"><select name="font_show">
          <option value="20">20px</option>
          <option value="25" selected="selected" >25px</option>
          <option value="30">30px</option>
                </select> 
          文本行间距离，默认：25px</td>
      </tr>
      <tr>
        <td width="17%" height="3" bgcolor="#FFFFFF">网站背景颜色</td>
        <td bgcolor="#FFFFFF"><input name="bg" type="text" value="<%=config("bg")%>" size="15" />
         <a   href="#"  style="color:#ff0000" onclick="window.open('color.asp','','');return   false;"> 颜色代码对照表</a></td>
        <td bgcolor="#FFFFFF"><label>
          <div align="center">当前颜色：</div>
        </label></td>
        <td width="46%" bgcolor="#FFFFFF" ><font color="<%=config("bg")%>">■</font></td>
      </tr>
      <tr>
        <td width="17%" height="5" bgcolor="#FFFFFF">网站访问量</td>
        <td colspan="3" bgcolor="#FFFFFF"><label>
          <input name="js" type="text"  value="<%=config("js")%>" size="10" />
        次</label></td>
      </tr>
      <tr>
        <td width="17%" height="2" bgcolor="#FFFFFF">网页关键字
          <font color="#FF0000">(中文) </font></td>
        <td bgcolor="#FFFFFF"><label>
          <input name="keywords" type="text" value="<%=config("keywords")%>" size="40"  />
        </label></td>
        <td bgcolor="#FFFFFF"><div align="center"><font color="#FF0000">(英文)</font></div></td>
        <td bgcolor="#FFFFFF"><input name="ekeywords" type="text" value="<%=config("ekeywords")%>" size="40"  /></td>
      </tr>
      <tr>
        <td height="3" bgcolor="#FFFFFF">网站描述 
          <font color="#FF0000">(中文) </font></td>
        <td bgcolor="#FFFFFF"><input name="description" type="text" value="<%=config("description")%>" size="40"/></td>
        <td bgcolor="#FFFFFF"><div align="center"><font color="#FF0000">(英文)</font></div></td>
        <td bgcolor="#FFFFFF"><input name="edescription" type="text" value="<%=config("edescription")%>" size="40"/></td>
      </tr>
      <tr>
        <td width="17%" height="12" bgcolor="#FFFFFF">版权信息 <font color="#FF0000">(中文)</font></td>
        <td colspan="3" bgcolor="#FFFFFF"><textarea name="copyright" cols="50" rows="4"><%=config("copyright")%></textarea></td>
      </tr>
      <tr>
        <td height="25" bgcolor="#FFFFFF">版权信息 <font color="#FF0000">(英文)</font></td>
        <td colspan="3" bgcolor="#FFFFFF"><textarea name="ecopyright" cols="50" rows="4"><%=config("ecopyright")%></textarea></td>
      </tr>
      <tr>
        <td height="25" bgcolor="#FFFFFF">&nbsp;</td>
        <td colspan="3" bgcolor="#FFFFFF"><label>
          <input type="submit" name="button" id="button" value="确定修改" />
        </label></td>
      </tr>
      
    </table></td>
  </tr>
</table>
</form>
</body>
</html>
