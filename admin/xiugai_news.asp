<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<% 
exec="select * from news where id="& request.QueryString("id") 
set rs=server.createobject("adodb.recordset") 
rs.open exec,conn,1,1 
%>
<html>
<head>
<title>增加新闻</title>
<link href="images/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td height="30" bgcolor="#FFFFFF"><div align="center">
      <table width="100%" border="0" cellpadding="0" cellspacing="1">
        <tr>
          <td height="30" bgcolor="#F7F7F7"><div align="center"><strong>修改新闻</strong></div></td>
        </tr>
      </table>
    </div></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><FORM method="post" name="myform" action="updata_news.asp">
      <table width="100%" border="1" align="center" cellpadding="6" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#F7F7F7">
        <tr>
          <td width="13%" bgcolor="#F7F7F7"><div align="center">新闻标题<font color="#FF0000"> (中文)</font></div></td>
          <td colspan="3" bgcolor="#F7F7F7"><input name="title" type="text" id="title" value="<%=rs("title")%>" size="40"><input name="id" type="hidden" id="id" value="<%=request.querystring("id")%>" /></td>
        </tr>
        <tr>
          <td width="13%" bgcolor="#F7F7F7"><div align="center">新闻标题<font color="#FF0000"> (英文)</font></div></td>
          <td colspan="3" bgcolor="#F7F7F7"><input name="etitle" type="text" id="etitle" value="<%=rs("etitle")%>" size="40"></td>
        </tr>
        <tr>
          <td width="13%" bgcolor="#F7F7F7"><div align="center">新闻分类</div></td>
          <td colspan="3" bgcolor="#F7F7F7"><select name="ssfl" id="select">
            <%
		  dim rsc
		  set rsc=server.CreateObject("adodb.recordset")
		  rsc.open "select * from news_fl",conn,1,1
		  while not rsc.eof
		    if rs("ssfl")=rsc("id") then
			response.Write("<option value=""" & rsc("id") & """ selected>" & rsc("title") & "</option>")
			else
			response.Write("<option value=""" & rsc("id") & """>" & rsc("title") & "</option>")
			end if
			rsc.movenext
		wend
		rsc.close
		set rsc=nothing
		  %>
          </select></td>
        </tr>
        <tr>
          <td width="13%" bgcolor="#F7F7F7"><div align="center">作者</div></td>
          <td width="22%" bgcolor="#F7F7F7"><input name="zz" type="text" id="zz" value="<%=rs("zz")%>"></td>
          <td width="7%" bgcolor="#F7F7F7"><div align="center">来源</div></td>
          <td width="58%" bgcolor="#F7F7F7"><input name="ly" type="text" id="ly" value="<%=rs("ly")%>"></td>
        </tr>
        
        <tr>
          <td width="13%" bgcolor="#F7F7F7"><div align="center">新闻内容<font color="#FF0000"> (中文)</font></div></td>
          <td colspan="3" bgcolor="#F7F7F7"><input type="hidden" name="body" value='<%=replace(rs("body"),"'","&#39;")%>'/>
<IFRAME ID="eWebEditor1" SRC="ewebeditor/ewebeditor.htm?id=body&style=popup" FRAMEBORDER="0" SCROLLING="no" WIDTH="100%" HEIGHT="400"></IFRAME></td>
        </tr>
        

        <tr>
          <td bgcolor="#F7F7F7"><div align="center">新闻内容 <font color="#FF0000">(英文)</font></div></td>
          <td colspan="3" bgcolor="#F7F7F7"><input type="hidden" name="ebody" value='<%=replace(rs("ebody"),"'","&#39;")%>'/>
<IFRAME ID="eWebEditor1" SRC="ewebeditor/ewebeditor.htm?id=ebody&style=popup" FRAMEBORDER="0" SCROLLING="no" WIDTH="100%" HEIGHT="400"></IFRAME></td>
          </tr>
        <tr>
          <td bgcolor="#F7F7F7">&nbsp;</td>
          <td colspan="3" bgcolor="#F7F7F7"><input type="submit" name="button"  value="確认修改" /></td>
        </tr>
      </table>
      </form>
    </td>
  </tr>
  <tr>
    <td><div align="right"></div></td>
  </tr>
</table>
</body>
</html>
