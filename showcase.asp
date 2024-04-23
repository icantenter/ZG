<!--#include file="conn.asp"-->
<!--#include file="config.asp" -->


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<META CONTENT="简阳市川空精密铸钢有限公司,四川省川空，炼钢，精密，精密制造，铸钢。" NAME="description">
<title>简阳川空精密铸钢有限公司——产品类</title>
<script type='text/javascript' src='roller.js' ></script>
<script type='text/javascript' src='jquery-1.2.6.min.js'></script>
<script type='text/javascript' src='kwicks.js'></script>
<script type='text/javascript' src='custom.js'></script>
<link href="style.css" rel="stylesheet" style="text/css" />
<script language="javascript">
		<!--
			function outliner()
			{ 
				var child = document.all[event.srcElement.getAttribute("child",false)];
				if (null != child){
					if(child.className == "expanded")
					{
						child.className = "collapsed";
						return;
					}
					if(child.className == "collapsed")
					{
						child.className = "expanded";
						return;
					}
				}
			}
		//-->
		</script>

</head>
<body>
<% 
	id=request("id")
	if id="" or not isnumeric(id) then
	Response.Write "<script language='javascript'>alert('非法！参数错误!');document.location.href('index.asp');</script>"
	Response.End()
	end if
exec="select * from case where id="&id 
set rs=server.createobject("adodb.recordset") 
rs.open exec,conn,1,1 
	if rs.eof and rs.bof then
	Response.Write "<script language='javascript'>alert('参数错误!ID不存在!');document.location.href('index.asp');</script>"
	Response.End()
	end if 
%>
<!--#include file="top.asp"-->
<div id="flash" align="center">
 <!--#include file="flash.asp"-->
 </div>
<div id="main1">
<div id="main_left1">
 <div id="pic"><img src="img/case.jpg" /></div>

<div id="jianjie1">

<table width="100%" border="0" cellpadding="0" cellspacing="2" class="table1">
      
      <tr>
        <td height="35" background="img/bg4.jpg" class="td">&nbsp;<a href="home.asp" class="news"><font class="body3">&nbsp;&nbsp;首页&nbsp;&nbsp;&gt;&gt;</font></a> <a href="case.asp" class="news"><font class="body3">成功案例&nbsp;&nbsp;&gt;&gt;&nbsp;&nbsp;</font></a><font class="body">案例：<%=rs("title")%>&nbsp;详细资料</font></td>
        </tr>
      <tr>
        <td colspan="2"><table width="100%" border="0" cellpadding="5" cellspacing="0" class="td">
         
          <tr>
            <td height="70" class="td"><div align="center"><font class="body3"><strong><%=rs("title")%></strong></font></div></td>
          </tr>
        </table></td>
      </tr>
      
      <tr>
        <td colspan="2"  class="td"><div style="font-size:<%=config("font_size")%>px; color:#333333; line-height:<%=config("font_show")%>px;"><%=rs("body")%></div></td>
      </tr>
      <tr>
        <td colspan="2" bgcolor="f9f9f9" class="td"><div>
          <div align="right"> <a href="javascript:self.print()" class="news">【打印本页】</a>  <a href="javascript:window.close()" class="news">【关闭窗口】</a></div>
        </div></td>
      </tr>
    </table>

</div>
</div>
<!--#include file="right.asp"-->
</div>
 <!--#include file="bottom.asp"-->
 
</body>

</html>
