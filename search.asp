<!--#include file="conn.asp"-->
<!--#include file="config.asp" -->


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<META CONTENT="简阳市川空精密铸钢有限公司,四川省川空，炼钢，精密，精密制造，铸钢。" NAME="description">
<link rel="stylesheet" href="style.css" type="text/css" media="screen" />
<script type='text/javascript' src='jquery-1.2.6.min.js'></script>
<script type='text/javascript' src='kwicks.js'></script>
<script type='text/javascript' src='custom.js'></script>
<title>简阳川空精密铸钢有限公司——搜索页</title>
</head>
<body>
<!--#include file="top.asp"-->
 <div id="flash" align="center">
 <!--#include file="flash.asp"-->
 </div>
<div id="main1">
<div id="main_left1">
<div id="pic"><img src="img/ProductSearch.jpg" /></div>
<div id="jianjie1">


<div align="justify">
<%
	zx=trim(request("zx"))
	Set db=Server.CreateObject("ADODB.Connection")
	Db.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="& Server.Mappath("data/#gg6hh.mdb") & ""
	set rs=Server.CreateObject("ADODB.recordset")
	strsql="select * from [shop] where title like '%"&zx&"%' order by id desc" 
	rs.open strsql,db,3,3
%>
<!--如果记录集不为空就分页显示-->
<%
if not rs.bof and not rs.eof then 
'--------------------------------------------------------------------------------------
'判断当前显示第几页,如果第一次打开则显示第一页
	dim pagenumber

	if request.QueryString("pagenumber")="" then
	pagenumber=1
	else
	pagenumber=cint(request.QueryString("pagenumber"))
	end if
'--------------------------------------------------------------------------------------
'开始分页显示记录
	rs.pagesize=5			'指定每页显示的记录数
	rs.absolutepage=pagenumber	'设置当前显示第几页
	dim i				'控制当强显示页面记录的变量
	i=rs.pagesize
	'----------------------------------------
	'循环显示每页记录
%>	
	<br/>
	<table width="600" border="0" align="center">
	<%
		do while not rs.eof and i>0 
		i=i-1
	%>
		<tr>
			
			<td width="160" height="95" rowspan="2">&nbsp;<a href="showshop.asp?id=<%=rs("id")%>" class="img"><img src="<%=rs("img")%>" width="140" height="100"  class="img"/></a></td>
			<td height="29" align="center" class="body"><a href="showshop.asp?id=<%=rs("id")%>" class="news"><%=replace(rs("title"),Request.Form("key"),"<font color=red>"&Request.Form("key")&"</font>")%></a></td>		
		</tr>
		<tr>
		  <td height="66" align="center" class="table1"><font class="body"><%=rs("data")%></font></td>
	  </tr>
		<tr>
		  <td height="23" colspan="2" background="img/bg3.png">&nbsp;</td>
		  </tr>
	<%
		rs.movenext
		loop
	%>
	</table>
	<div align="center" class="body">
<%
	'-----------------------------------------
'--------------------------------------------------------------------------------------
	'不同分页操作
	
	response.Write("<font color=#333333 size='-1'>选择数据页面:&nbsp;</font>")

	'-------------------------
	'首页显示
	response.Write("<a href='search.asp?zx="&zx&"&pagenumber=1'><font color=#333333>首页</font></a>&nbsp;&nbsp;")
	'------------------------
	'上一页
	'if pagenumber<>1 then	
		'response.Write("<a href='search2.asp?pagenumber="&pagenumber-1&"'>上一页</a>&nbsp;&nbsp;")	
	'end if
	if pagenumber=1 then
		response.Write("<a href='search.asp?pagenumber="&pagenumber&"'><font color=#333333>上一页</font></a>&nbsp;&nbsp;")
	end if
	
	if pagenumber>1 then	
		response.Write("<a href='search.asp?zx="&zx&"&pagenumber="&pagenumber-1&"'><font color=#333333>上一页</font></a>&nbsp;&nbsp;")	
	end if
	'---------------------------------------
	'下一页显示效果
	'if pagenumber<>rs.pagecount then
		'response.Write("<a href='search2.asp?pagenumber="&pagenumber+1&"'>下一页</a>&nbsp;&nbsp;")
	'end if
	if pagenumber=rs.pagecount then
		response.Write("<a href='search.asp?pagenumber="&pagenumber&"'><font color=#333333>下一页</font></a>&nbsp;&nbsp;")
	end if

	if pagenumber<rs.pagecount then	
		response.write ("<a href='search.asp?zx="&zx&"&pagenumber="&pagenumber+1&"'><font color=#333333>下一页</font></a>&nbsp;&nbsp;")	
	end if
	
''循环显示页面消息,如果不是当前页,就为当前页加上连接
	'for yema=1 to rs.pagecount
		'if yema=pagenumber then
			'response.Write("<font color=blue size='-1'>[&nbsp;"&yema&"&nbsp;]"&"&nbsp;&nbsp;</font>")
		'else
			'response.Write("<a href='search2.asp?zx="&zx&"&pagenumber="&yema&"'><font color=#333333>"&"[&nbsp;"&yema&"&nbsp;]"&"</font></a>&nbsp;&nbsp;")
		'end if
	'next
	'-----------------
	'尾页
	response.Write("&nbsp;&nbsp;<a href='search.asp?zx="&zx&"&pagenumber="&rs.pagecount&"'><font color=#333333>尾页</font></a>")
	%>
	  <%
		'判断共有多少页,当前是好多页
		response.write("<font color=#333333 size='-1'>当前是"&pagenumber&"页共有"&rs.pagecount&"页</font>")
		
	%></div>

<%	
else
	response.Write("<div class='body' align='center'>你的记录内容为空!</div>")
end if
%>
</div>


</div>

</div>

<!--#include file="right.asp"-->
</div>
 <!--#include file="bottom.asp"-->
</body>

</html>
