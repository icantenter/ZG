<!--#include file="conn.asp"-->
<!--#include file="config.asp" -->


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<META CONTENT="�����д��վ����������޹�˾,�Ĵ�ʡ���գ����֣����ܣ��������죬���֡�" NAME="description">
<title>�������վ����������޹�˾��������ҳ</title>
<script type='text/javascript' src='roller.js' ></script>
<script type='text/javascript' src='jquery-1.2.6.min.js'></script>
<script type='text/javascript' src='kwicks.js'></script>
<script type='text/javascript' src='custom.js'></script>
<link href="style.css" rel="stylesheet" style="text/css" />
 
</head>
<body>
<!--#include file="top.asp"-->
<div id="flash" align="center">
 <!--#include file="flash.asp"-->
 </div>
<div id="main1">
<div id="main_left1">
 <div id="pic"><img src="img/news.jpg" /></div>
 <div id="newsmain">
   <div id="news">
  <% 
	id=request("id")
	if id="" or not isnumeric(id) then
	Response.Write "<script language='javascript'>alert('�Ƿ�����������!');document.location.href('index.asp');</script>"
	Response.End()
	end if
exec="select * from news where id="&id 
set rs=server.createobject("adodb.recordset") 
rs.open exec,conn,1,1 
	if rs.eof and rs.bof then
	Response.Write "<script language='javascript'>alert('��������!ID������!');document.location.href('index.asp');</script>"
	Response.End()
	end if 
%>
<div id="newstop">
<span class="body"><a href="home.asp" class="news">��ҳ</a> &gt;&gt; <a href="news.asp" class="news">��������</a>  &gt;&gt;&nbsp;<font color="#5a1717">�鿴����</font></span></div>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="2">
      
      <tr>
        <td colspan="2"><table width="580" border="0" cellpadding="5" cellspacing="0">
          <tr>
            <td height="60"><div align="center"><font class="body2"><strong><%=rs("title")%></strong></font></div></td>
          </tr>
          <tr>
            <td height="20"><div style="text-align:right; color:#421E00" class="body1">
			<%
set rs = server.createobject("adodb.recordset") 
curid=request("id") 
sql = "UPDATE news SET hits = hits + 1 WHERE id = " + cstr(curid) 
conn.execute sql 
sql = "SELECT * FROM news WHERE id = " + cstr(curid) 
rs.open sql,conn,1,1
%>
<font class="body9">��Դ��<%=rs("ly")%>    ���ߣ�<%=rs("zz")%>    �����<%=rs("hits")%>    ���ڣ�<%=rs("data")%></font>
</div>
<hr  id="hrp"/>
</td>
          </tr>
          <tr>
            <td><font class="body6"><%=rs("body")%></font></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2"><div>
          <div align="right"> <a href="javascript:self.print()" class="news">����ӡ��ҳ�� </a>  <a href="javascript:window.close()" class="news">���رմ��ڡ�</a></div>
        </div></td>
      </tr>
      </table> 
   
   
   
   </div>
 </div>
</div>
<!--#include file="right.asp"-->
</div>
 <!--#include file="bottom.asp"-->

</body>

</html>
