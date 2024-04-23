<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"--> 
<!--#include file="seeion.asp"--> 
<html>
<head>
<title>发布职位</title>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="images/style.css" rel=stylesheet type=text/css>
</head>
<body>
<form name="form1" method="post" action="add_zw_pass.asp">
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td height="30" bgcolor="#F7F7F7"><div style="padding:10px; font-weight:bold;">发布招聘职位</div></td>
  </tr>
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" align="center" cellpadding="6" cellspacing="1" bgcolor="#FFFFFF">
      
      <tr>
        <td width="14%" bgcolor="#FFFFFF">职位名称</td>
        <td bgcolor="#FFFFFF"><input type="text" name="zw_name" />
            <font color="#FF0000">(中文) </font></td>
        <td bgcolor="#FFFFFF"><font color="#FF0000">
          <input type="text" name="ezw_name" />
          <font color="#FF0000">(英文)</font></font></td>
      </tr>
      <tr>
        <td bgcolor="#F7F7F7">性别</td>
        <td width="35%" bgcolor="#F7F7F7"><input type="radio" name="sex"  value="1" />
          男
          <input type="radio" name="sex"  value="2" />
          女
          <input name="sex" type="radio"  value="0" checked="checked" />
          不限 <font color="#FF0000">(中文)</font></td>
        <td width="51%" bgcolor="#F7F7F7"><input type="radio" name="esex"  value="1" />
        Man 
          <input type="radio" name="esex"  value="2" />
          Woman
          <input name="esex" type="radio"  value="0" checked="checked" />
          Open <font color="#FF0000"><font color="#FF0000">(英文)</font></font></td>
      </tr>
      <tr>
        <td bgcolor="#FFFFFF">年龄</td>
        <td colspan="2" bgcolor="#FFFFFF"><input name="nn1" type="text"  value="20" size="5" />
          至
          <input name="nn2" type="text" value="35" size="5" />
          岁</td>
      </tr>
      <tr>
        <td bgcolor="#F7F7F7">文化程度</td>
        <td bgcolor="#F7F7F7"><label>
          <select name="xueli" id="select">
            <option>初中以上</option>
            <option>高中/中专</option>
            <option>大专以上</option>
            <option>本科以上</option>
            <option>硕士/博士/研究生</option>
          </select>
          <font color="#FF0000">(中文)</font></label></td>
        <td bgcolor="#F7F7F7"><select name="exueli" id="exueli">
            <option>More than junior high school</option>
            <option>High school / secondary</option>
            <option>College</option>
            <option>College-level or higher</option>
            <option>Master / Dr / Graduate</option>
          </select>
            <font color="#FF0000"><font color="#FF0000">(英文)</font></font></td>
      </tr>
      <tr>
        <td bgcolor="#FFFFFF">招聘人数</td>
        <td colspan="2" bgcolor="#FFFFFF"><input name="renshu" type="text" value="1"  size="10" />
          人</td>
      </tr>
      <tr>
        <td bgcolor="#F7F7F7">其它要求</td>
        <td colspan="2" bgcolor="#F7F7F7"><textarea name="yaoqiu" cols="60" rows="8"></textarea>
            <font color="#FF0000">(中文)</font></td>
      </tr>
      <tr>
        <td bgcolor="#FFFFFF">其它要求</td>
        <td colspan="2" bgcolor="#FFFFFF"><textarea name="eyaoqiu" cols="60" rows="8"></textarea>
            <font color="#FF0000"><font color="#FF0000">(英文)</font></font></td>
      </tr>
      <tr>
        <td bgcolor="#F7F7F7">&nbsp;</td>
        <td colspan="2" bgcolor="#F7F7F7"><input type="submit" name="button" id="button" value="发布职位" /></td>
      </tr>
    </table></td>
  </tr>
</table></form>
</body>
</html>
