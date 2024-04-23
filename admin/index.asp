<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="config.asp" -->
<html>
<head>
<title>简阳川空精密铸钢有限公司网站后台管理系统</title>
<link href="images/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {background-color:#0066CC;}
-->
</style>
</head>
<body>
<form  name="add" method="post" action="adminpass.asp">
<div style="padding-top:100px;">
  <table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="89" rowspan="5"><img src="images/login_01.jpg" width="89" height="400"></td>
    <td colspan="2"><img src="images/login_02.jpg" width="437" height="100"></td>
    <td width="74" rowspan="5"><img src="images/login_03.jpg" width="75" height="400"></td>
  </tr>
  <tr>
    <td width="339" height="177" rowspan="3" valign="top" background="images/login_04.jpg"><table width="100%" border="0" align="center" cellpadding="8" cellspacing="0"><tr><td><table width="100%" border="0" align="center" cellpadding="8" cellspacing="0">
      <tr>
        <td width="124"><p align="center" style="MARGIN-TOP: 10px; ">帐&nbsp;&nbsp;&nbsp;号</p></td>
        <td><input name="admin" type="text" size="23"></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><p align="center" style="MARGIN-TOP: 10px; ">密&nbsp;&nbsp;&nbsp;码</p></td>
        <td><input name="password" type="password" size="25"></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><div align="center">验证码</div></td>
        <td><input name="VerifyCode" type="text"  id="VerifyCode" size="10" maxlength="5"/>
            <img src="vCode.asp?" onClick="this.src+=Math.random()" alt="图片看不清？点击重新得到验证码" style="cursor:hand;" /> </td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
        </tr>
    </table></td>
    <td width="103" height="61" background="images/login_05.jpg">&nbsp;</td>
  </tr>
  <tr>
    <td><input border=0 cache height=59 src="images/login_06.jpg" type=image width=103 name="image"></td>
  </tr>
  <tr>
    <td width="103" height="57" background="images/login_07.jpg">&nbsp;</td>
  </tr>
  <tr>
    <td height="123" colspan="2" background="images/login_08.jpg"></td>
    </tr>
</table>
</div>
</form>
</body>
</html>