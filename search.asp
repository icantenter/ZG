<!--#include file="conn.asp"-->
<!--#include file="config.asp" -->


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<META CONTENT="�����д��վ����������޹�˾,�Ĵ�ʡ���գ����֣����ܣ��������죬���֡�" NAME="description">
<link rel="stylesheet" href="style.css" type="text/css" media="screen" />
<script type='text/javascript' src='jquery-1.2.6.min.js'></script>
<script type='text/javascript' src='kwicks.js'></script>
<script type='text/javascript' src='custom.js'></script>
<title>�������վ����������޹�˾��������ҳ</title>
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
<!--�����¼����Ϊ�վͷ�ҳ��ʾ-->
<%
if not rs.bof and not rs.eof then 
'--------------------------------------------------------------------------------------
'�жϵ�ǰ��ʾ�ڼ�ҳ,�����һ�δ�����ʾ��һҳ
	dim pagenumber

	if request.QueryString("pagenumber")="" then
	pagenumber=1
	else
	pagenumber=cint(request.QueryString("pagenumber"))
	end if
'--------------------------------------------------------------------------------------
'��ʼ��ҳ��ʾ��¼
	rs.pagesize=5			'ָ��ÿҳ��ʾ�ļ�¼��
	rs.absolutepage=pagenumber	'���õ�ǰ��ʾ�ڼ�ҳ
	dim i				'���Ƶ�ǿ��ʾҳ���¼�ı���
	i=rs.pagesize
	'----------------------------------------
	'ѭ����ʾÿҳ��¼
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
	'��ͬ��ҳ����
	
	response.Write("<font color=#333333 size='-1'>ѡ������ҳ��:&nbsp;</font>")

	'-------------------------
	'��ҳ��ʾ
	response.Write("<a href='search.asp?zx="&zx&"&pagenumber=1'><font color=#333333>��ҳ</font></a>&nbsp;&nbsp;")
	'------------------------
	'��һҳ
	'if pagenumber<>1 then	
		'response.Write("<a href='search2.asp?pagenumber="&pagenumber-1&"'>��һҳ</a>&nbsp;&nbsp;")	
	'end if
	if pagenumber=1 then
		response.Write("<a href='search.asp?pagenumber="&pagenumber&"'><font color=#333333>��һҳ</font></a>&nbsp;&nbsp;")
	end if
	
	if pagenumber>1 then	
		response.Write("<a href='search.asp?zx="&zx&"&pagenumber="&pagenumber-1&"'><font color=#333333>��һҳ</font></a>&nbsp;&nbsp;")	
	end if
	'---------------------------------------
	'��һҳ��ʾЧ��
	'if pagenumber<>rs.pagecount then
		'response.Write("<a href='search2.asp?pagenumber="&pagenumber+1&"'>��һҳ</a>&nbsp;&nbsp;")
	'end if
	if pagenumber=rs.pagecount then
		response.Write("<a href='search.asp?pagenumber="&pagenumber&"'><font color=#333333>��һҳ</font></a>&nbsp;&nbsp;")
	end if

	if pagenumber<rs.pagecount then	
		response.write ("<a href='search.asp?zx="&zx&"&pagenumber="&pagenumber+1&"'><font color=#333333>��һҳ</font></a>&nbsp;&nbsp;")	
	end if
	
''ѭ����ʾҳ����Ϣ,������ǵ�ǰҳ,��Ϊ��ǰҳ��������
	'for yema=1 to rs.pagecount
		'if yema=pagenumber then
			'response.Write("<font color=blue size='-1'>[&nbsp;"&yema&"&nbsp;]"&"&nbsp;&nbsp;</font>")
		'else
			'response.Write("<a href='search2.asp?zx="&zx&"&pagenumber="&yema&"'><font color=#333333>"&"[&nbsp;"&yema&"&nbsp;]"&"</font></a>&nbsp;&nbsp;")
		'end if
	'next
	'-----------------
	'βҳ
	response.Write("&nbsp;&nbsp;<a href='search.asp?zx="&zx&"&pagenumber="&rs.pagecount&"'><font color=#333333>βҳ</font></a>")
	%>
	  <%
		'�жϹ��ж���ҳ,��ǰ�Ǻö�ҳ
		response.write("<font color=#333333 size='-1'>��ǰ��"&pagenumber&"ҳ����"&rs.pagecount&"ҳ</font>")
		
	%></div>

<%	
else
	response.Write("<div class='body' align='center'>��ļ�¼����Ϊ��!</div>")
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
