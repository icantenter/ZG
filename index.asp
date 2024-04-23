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
<title>简阳川空精密铸钢有限公司</title>
</head>
<body>
<!--#include file="top.asp"-->
 <div id="flash" align="center">
 <!--#include file="flash.asp"-->
 </div>
 <div id="main">
 <div id="main_left">
 <div id="pic"><img src="img/jianjie.jpg" /></div>
 <div id="jianjie">
 <% 
exec="select * from about where title='公司简介' " '如修改了名称,请在这里做相应修改
set rs=server.createobject("adodb.recordset") 
rs.open exec,conn,1,1 
%>
    <span style="line-height:25px; margin-bottom:20px;" class="body"><%=left(rs("body"),650)%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;...<a href="jianjie.asp?id=14" style="color:#CC0000">[查看全部]</a></span>
 </div>
 <div id="pic1"><img src="img/shop1.jpg" /></div>
 <div id="shop" align="center">
 <% 
set shop=server.createobject("adodb.recordset") 
exec="select * from shop order by id desc " 
shop.open exec,conn,1,1 
%>
      <div id="demo" style="OVERFLOW: hidden; WIDTH: 626px; align: center">
        <table cellspacing=0 cellpadding=0 align=center border=0>
          <tbody>
            <tr>
              <td id=marquePic1 valign=top><table height=160 cellspacing=0 cellpadding=0 width=720 border=0>
                <tbody>
                  <tr>
                    <td align=middle width=93><table border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <%
	  dim ii
	  ii=1
	  do while not shop.eof
	  %>
                        <td><table width="175" border="0" cellpadding="5" cellspacing="1">
                          <tr>
                            <td width="165"><a href="showshop.asp?id=<%=shop("id")%>" class="img" title="<%=shop("title")%>"><img src="<%=shop("img")%>" width="155" height="110" id="Image1" /></a></td>
                          </tr>
                          <tr>
                            <td height="20"><font class="body"><%=shop("title")%></font></td>
                          </tr>
                        </table></td>
                        <%
	  if ii mod 150 =0 then
	  response.Write "<tr>"
	  end if
	  ii=ii+1 
shop.movenext 
loop 
%>
                      </tr>
                    </table></td>
                  </tr>
                </tbody>
              </table></td>
              <td id=marquePic2 valign=top></td>
            </tr>
          </tbody>
        </table>
      </div>
      <script type=text/javascript> 
var speed=50 
marquePic2.innerHTML=marquePic1.innerHTML 
function Marquee(){ 
if(demo.scrollLeft>=marquePic1.scrollWidth){ 
demo.scrollLeft=0 
}else{ 
demo.scrollLeft++ 
}} 
var MyMar=setInterval(Marquee,speed) 
demo.onmouseover=function() {clearInterval(MyMar)} 
demo.onmouseout=function() {MyMar=setInterval(Marquee,speed)} 
</script>
 
 </div>
 </div>
 <!--#include file="right.asp"-->
 


 </div>
 <!--#include file="bottom.asp"-->
</body>
</html>