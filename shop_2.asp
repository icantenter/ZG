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
<!--#include file="top.asp"-->
<div id="flash" align="center">
 <!--#include file="flash.asp"-->
 </div>
<div id="main1">
<div id="main_left1">
 <div id="pic"><img src="img/shop.jpg" /></div>

<div id="jianjie1">
<div>
<table bgcolor=#791515 border=0 bordercolor=#000000 bordercolordark=#ffffff cellpadding=0 cellspacing=0 width="600" height="12" align="center" >
        <tr> 
              
          <td bgcolor=#791515 width=150 align="center"><b><font color="#FFFFFF" size="1"><img src="img/click.png" /></font></b><spacer type="block" width="5"></td>
              <td  class=xingcheng height=12 onMouseOver="this.bgColor='#ce1212';" onMouseOut="this.bgColor='#791515';" width="450" > 
                
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class=xingcheng >
              <tr> 
                    
                <td style="cursor: hand" onClick="outliner()" child="3ALL"  height="25">&nbsp;&nbsp;&nbsp;&nbsp;公司铸钢及不锈钢树脂砂铸造产品介绍  --- 点击展开详细</td>
              </tr>
                </table>
              </td>
  </tr>
</table>
            <div   class="collapsed"   id="3ALL" align="center"> 
          <div child="3ALL2" onClick="outliner()" align="center"> 
            
          <table class=xingchengt width="600" border="0" >
            <tr> 
                
              <td> 
               <div id="cpjsnr" align="left">
<% 
exec="select * from about where title='铸钢及不锈钢铸造介绍' " '如修改了名称,请在这里做相应修改
set rs=server.createobject("adodb.recordset") 
rs.open exec,conn,1,1 
%>
    <span style="line-height:25px; margin-bottom:20px;" class="body6"><%=left(rs("body"),8000)%></span></div>

              </td>
            </tr>
            </table></div></div>
</div>
<table>
   <tr> 
   <td bgcolor=#db7100 width=20 align="center"><b><font color="#FFFFFF" size="1">>>></font></b><spacer type="block" width="5"></td>
   <td height=25  width="600"  align="center" class="body" bgcolor="#c1c1c1">简阳川空精密铸钢——铸钢及不锈钢树脂砂铸造产品一览</td>
              </tr>
                </table>
<table width="100%" border="0" cellpadding="0" cellspacing="2">
      <tr>
        <td colspan="2" valign="top"><table width="100%" border="0" cellpadding="7" cellspacing="0">
          
          <tr>
            <td valign="top"><!--公司新闻开始-->

<%	
set rs=server.createobject("adodb.recordset") 
exec="select * from shop where ssfl=38 order by id desc" 
rs.open exec,conn,1,1 
if rs.eof then
response.Write "&nbsp;暂无产品！"
else
rs.PageSize =9 '每页记录条数
iCount=rs.RecordCount '记录总数
iPageSize=rs.PageSize
maxpage=rs.PageCount 
page=request("page")
if Not IsNumeric(page) or page="" then
page=1
else
page=cint(page)
end if
if page<1 then
page=1
elseif  page>maxpage then
page=maxpage
end if
rs.AbsolutePage=Page
if page=maxpage then
x=iCount-(maxpage-1)*iPageSize
else
x=iPageSize
end if	
%>
<%For i=1 To x%>

<div style="float:left">
<table width="180" height="160" border="0" cellpadding="0" cellspacing="2">
  <tr>
    <td align="center"><div align="center"><a href="showshop.asp?id=<%=rs("id")%>" title="<%=rs("title")%> 样图" class="img"><img src="<%=rs("img")%>" width="180" height="120" class="img"/></a></div></td>
  </tr>
  <tr> 
    <td height="30" align="center" background="img/bg5.jpg"><a href="showshop.asp?id=<%=rs("id")%>" title="<%=rs("title")%>" class="news"><%=left(rs("title"),40)%></a></td>
  </tr>
</table>
</div>

 <%rs.movenext
next
%>
<%
end if
%></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2">
		  <div align="left" class="body">
		    <%
'提示错误信息
sub strA(str1)
      Response.Write("<script language=""JavaScript"">alert("""&str1&""");history.go(-1);</script>")
	  response.End()
end sub	  	

'成功提示信息
sub strB(str2,url)
      Response.Write("<script language=""JavaScript"">alert("""&str2&""");window.location='"&url&"';</script>")
	  response.End()
end sub	   

'页面自动跳转
sub AutoJump(str1,url)
    Response.Write("<br/>&nbsp;&nbsp;<font color=red>"&str1&"</font><br/>")
	Response.Write("<br/>&nbsp;&nbsp;正在跳转...<br/>")
	Response.Write("<br/>&nbsp;&nbsp;页面没有自动跳转<a href="&url&">【点这里】</a><br/>")
	Response.Write("<meta http-equiv=refresh content=2;url='"&url&"'>")
end sub


'分页子程序
Sub PageControl(iCount,pagecount,page,table_style,font_style)
'生成上一页下一页链接
    Dim query, a, x, temp
    action = "http://" & Request.ServerVariables("HTTP_HOST") & Request.ServerVariables("SCRIPT_NAME")
    query = Split(Request.ServerVariables("QUERY_STRING"), "&")
    For Each x In query
        a = Split(x, "=")
        If StrComp(a(0), "page", vbTextCompare) <> 0 Then
            temp = temp & a(0) & "=" & a(1) & "&"
        End If
    Next
    Response.Write("<table width=100% border=0 cellpadding=0 cellspacing=0 >" & vbCrLf )        
    Response.Write("<form method=get onsubmit=""document.location = '" & action & "?" & temp & "Page='+ this.page.value;return false;""><TR >" & vbCrLf )
    Response.Write("<TD align=left  class=hui>" & vbCrLf )
    Response.Write(font_style & vbCrLf ) 
	'response.Write "<A href=javascript:history.back()>【返回前页】</a>&nbsp;&nbsp;&nbsp;"
    if page<=1 then
        Response.Write ("首页 " & vbCrLf)        
        Response.Write ("上一页 " & vbCrLf)
    else        
        Response.Write("<A HREF=" & action & "?" & temp & "Page=1><font color=#5b0f0f>首页</font></A> " & vbCrLf)
        Response.Write("<A HREF=" & action & "?" & temp & "Page=" & (Page-1) & "><font color=#5b0f0f>上一页</font></A> " & vbCrLf)
    end if
    if page>=pagecount then
        Response.Write ("下一页 " & vbCrLf)
        Response.Write ("尾页 " & vbCrLf)            
    else
        Response.Write("<A HREF=" & action & "?" & temp & "Page=" & (Page+1) & "><font color=#5b0f0f>下一页</font></A> " & vbCrLf)
        Response.Write("<A HREF=" & action & "?" & temp & "Page=" & pagecount & "><font color=#5b0f0f>尾页</font></A> " & vbCrLf)            
    end if
    Response.Write("页次：" & page & "/" & pageCount & "页"&  vbCrLf)
    Response.Write(" 共" & iCount & "条记录" &  vbCrLf)
    Response.Write(" 转" & "<INPUT  TYEP=TEXT NAME=page SIZE=2 Maxlength=5 VALUE=" & page & " >" & "页"  & vbCrLf & "<INPUT CLASS=input2 type=submit value=GO>")
    Response.Write("</TD>" & vbCrLf )                
    Response.Write("</TR></form>" & vbCrLf )        
    Response.Write("</table>" & vbCrLf )        
End Sub


sub Left1(str1,url)
    Response.Write("<br/>&nbsp;&nbsp;<font color=red>"&str1&"</font><br/>")
	Response.Write("<br/>&nbsp;&nbsp;正在跳转...<br/>")
	Response.Write("<br/>&nbsp;&nbsp;页面没有自动跳转<a href="&url&">【点这里】</a><br/>")
	Response.Write("<meta http-equiv=refresh content=2;url='"&url&"'>")
end sub
%>
		    
	          <%'以下显示分页
 call PageControl(iCount,maxpage,page,"border=0 align=center","<p align=center>")
rs.close
set rs=nothing
%>
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
