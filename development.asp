<!--#include file="conn.asp"-->
<!--#include file="config.asp" -->


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<META CONTENT="�����д��վ����������޹�˾,�Ĵ�ʡ���գ����֣����ܣ��������죬���֡�" NAME="description">
<title>�������վ����������޹�˾������Ʒ�з�</title>
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
 <div id="pic"><img src="img/development.jpg" /></div>

<div id="jianjie1">
<% 
exec="select * from about where title='��Ʒ�з�' " '���޸�������,������������Ӧ�޸�
set rs=server.createobject("adodb.recordset") 
rs.open exec,conn,1,1 
%>
    <span style="line-height:25px; margin-bottom:20px;" class="body6"><%=left(rs("body"),3000)%></span></div>



</div>
<!--#include file="right.asp"-->
</div>
 <!--#include file="bottom.asp"-->
 
</body>

</html>
