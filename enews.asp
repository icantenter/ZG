<!--#include file="conn.asp"-->
<!--#include file="config.asp" -->


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<META CONTENT="简阳市川空精密铸钢有限公司,四川省川空，炼钢，精密，精密制造，铸钢。" NAME="description">
<title>简阳川空精密铸钢有限公司——新闻页</title>
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
	Response.Write "<script language='javascript'>alert('非法！参数错误!');document.location.href('index.asp');</script>"
	Response.End()
	end if
exec="select * from news where id="&id 
set rs=server.createobject("adodb.recordset") 
rs.open exec,conn,1,1 
	if rs.eof and rs.bof then
	Response.Write "<script language='javascript'>alert('参数错误!ID不存在!');document.location.href('index.asp');</script>"
	Response.End()
	end if 
%>
<div id="newstop">
<span class="body"><a href="home.asp" class="news">首页</a> &gt;&gt; <a href="news.asp" class="news">新闻中心</a>  &gt;&gt;&nbsp;<font color="#5a1717">查看新闻</font></span></div>
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
<font class="body9">来源：<%=rs("ly")%>    作者：<%=rs("zz")%>    点击：<%=rs("hits")%>    日期：<%=rs("data")%></font>
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
          <div align="right"> <a href="javascript:self.print()" class="news">【打印本页】 </a>  <a href="javascript:window.close()" class="news">【关闭窗口】</a></div>
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
