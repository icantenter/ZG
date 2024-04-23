<div id="main_right">
<div id="xinwentop"></div>
<div id="main_right_new">
<table width="95%" border="0" cellpadding="7" cellspacing="0" >
          
          <tr>
            <td valign="top"><!--公司新闻开始-->

<% 
set rs=server.createobject("adodb.recordset") 
exec="select top 7 * from [news] where ssfl=1  order by id desc  " '如修改了新闻类别,请在这里做相应修改.
rs.open exec,conn,1,1 
if rs.eof and rs.bof then
response.Write("暂无公司新闻!")
else
end if
response.write"<ul>"
do while not rs.eof

 response.Write("<li>&nbsp;<img src='img/arrow_2.gif' /><a href=""enews.asp?id=" & rs("id") & """ class='main_right_new'>"  & left(rs("title"),15) & "</a>&nbsp;<font class='main_right_new'>  " & year(rs("data"))&"." & month(rs("data"))&"."&day(rs("data"))& "</font></li>")
rs.movenext 
loop 
response.write"</ul>"
response.write"<div>"
%>
</td>
          </tr>
        </table>

</div>
<div id="cpsy_top"></div>

<div class=right_1>
        <div class=r_c_1><a href="shop_1.asp" rel=sexylightbox>tel</a></div>
		<div class=r_c_2><a href="shop_2.asp" rel=sexylightbox>tel</a></div>
		<div class=r_c_3><a href="shop_3.asp" rel=sexylightbox>tel</a></div>
		<div class=r_c_4><a href="http://mail.ckjmzg.com/login.php" rel=sexylightbox>mail</a></div>
		<div class=r_c_5><a href="Contact.asp" rel=sexylightbox>tel</a></div>
      </div>
</div>