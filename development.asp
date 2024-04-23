<!--#include file="conn.asp"-->
<!--#include file="config.asp" -->


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<META CONTENT="简阳市川空精密铸钢有限公司,四川省川空，炼钢，精密，精密制造，铸钢。" NAME="description">
<title>简阳川空精密铸钢有限公司——产品研发</title>
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
exec="select * from about where title='产品研发' " '如修改了名称,请在这里做相应修改
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
