<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<% 
exec="select * from about where id="& request.QueryString("id") 
set rs=server.createobject("adodb.recordset") 
rs.open exec,conn,1,1 
%>
<html>
<head>
<title>修改页面</title>
<link href="images/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td height="30" bgcolor="#FFFFFF"><div align="center">
      <table width="100%" border="0" cellpadding="0" cellspacing="1">
        <tr>
          <td height="30" bgcolor="#F7F7F7"><div align="center"><strong>修改页面</strong><span class="text2"></span></div></td>
        </tr>
      </table>
    </div></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><form action="updata_about.asp" method="post"  name="myform"/>
      <table width="100%" border="1" align="center" cellpadding="6" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#F7F7F7">
        <tr>
          <td width="15%" bgcolor="#F7F7F7"><div align="center">标题<font color="#FF0000"> (中文)</font></div></td>
          <td width="85%" bgcolor="#F7F7F7"><input name="title" type="text" id="title" value="<%=rs("title")%>" size="40"> <input name="id" type="hidden" id="id" value="<%=request.querystring("id")%>" /></td>
        </tr>
        <tr>
          <td width="15%" bgcolor="#F7F7F7"><div align="center">标题<font color="#FF0000"> (英文)</font></div></td>
          <td bgcolor="#F7F7F7"><input name="etitle" type="text" id="etitle" value="<%=rs("etitle")%>" size="40"></td>
        </tr>
        <tr>
          <td width="15%" bgcolor="#F7F7F7"><div align="center">内容<font color="#FF0000"> (中文)</font></div></td>
          <td bgcolor="#F7F7F7"><input type="hidden" name="body" value='<%=replace(rs("body"),"'","&#39;")%>'/>
<IFRAME ID="eWebEditor1" SRC="ewebeditor/ewebeditor.htm?id=body&style=popup" FRAMEBORDER="0" SCROLLING="no" WIDTH="100%" HEIGHT="400"></IFRAME></td>
        </tr>
        

        <tr>
          <td bgcolor="#F7F7F7"><div align="center">内容 <font color="#FF0000">(英文)</font></div></td>
          <td bgcolor="#F7F7F7"><input type="hidden" name="ebody" value='<%=replace(rs("ebody"),"'","&#39;")%>'/>
<IFRAME ID="eWebEditor1" SRC="ewebeditor/ewebeditor.htm?id=ebody&style=popup" FRAMEBORDER="0" SCROLLING="no" WIDTH="100%" HEIGHT="400"></IFRAME></td>
          </tr>
        <tr>
          <td bgcolor="#F7F7F7">&nbsp;</td>
          <td bgcolor="#F7F7F7"><input type="submit" name="button"  value="提交修改" /></td>
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
