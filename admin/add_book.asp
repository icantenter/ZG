<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<script language="javascript">
function showUploadDialog(s_Type, s_Link, s_Thumbnail){
var arr = showModalDialog("eWebEditor/dialog/i_upload.htm?style=popup&type="+s_Type+"&link="+s_Link+"&thumbnail="+s_Thumbnail, window, "dialogWidth:0px;dialogHeight:0px;help:no;scroll:no;status:no");}
</script>
<html>
<head>
<title>增加书籍</title>
<link href="images/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td height="30" bgcolor="#FFFFFF"><div align="center">
      <table width="100%" border="0" cellpadding="0" cellspacing="1">
        <tr>
          <td height="30" bgcolor="#F7F7F7"><div align="center"><strong>增加书籍</strong></div></td>
        </tr>
      </table>
    </div></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><FORM method="post" name="myform" action="add_book_pass.asp">
      <table width="100%" border="1" align="center" cellpadding="6" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#F7F7F7">
        <tr>
          <td width="15%" bgcolor="#F7F7F7"><div align="center">书籍名称<font color="#FF0000"> (中文)</font></div></td>
          <td width="85%" bgcolor="#F7F7F7"><input name="title" type="text" id="title" size="40"></td>
        </tr>
        <tr>
          <td width="15%" bgcolor="#F7F7F7"><div align="center">书籍名称<font color="#FF0000"> (英文)</font></div></td>
          <td bgcolor="#F7F7F7"><input name="etitle" type="text" id="etitle" size="40"></td>
        </tr>
        <tr>
          <td width="15%" bgcolor="#F7F7F7"><div align="center">书籍分类</div></td>
          <td bgcolor="#F7F7F7"><select name="ssfl" id="select">
            <%
		  dim rsc
		  set rsc=server.CreateObject("adodb.recordset")
		  rsc.open "select * from books_fl",conn,1,1
		  while not rsc.eof
			response.Write("<option value=""" & rsc("id") & """>" & rsc("title") & "</option>")
			rsc.movenext
		wend
		rsc.close
		set rsc=nothing
		  %>
                    </select></td>
        </tr>
        <tr>
          <td width="15%" bgcolor="#F7F7F7"><div align="center">书籍编号</div></td>
          <td bgcolor="#F7F7F7"><%
ProductNo=year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)
%><label>
            <input type="text" name="ProductNo" id="ProductNo" value="<%=ProductNo%>" size="40" maxlength="50">
          </label></td>
        </tr>
        <tr>
          <td width="15%" bgcolor="#F7F7F7"><div align="center">书籍略缩图</div></td>
          <td bgcolor="#F7F7F7"><input type=text name=img size=50> <input type=button value="上传图片" onClick="showUploadDialog('image', 'myform.img', '')"> </td>
        </tr>
        
        <tr>
          <td width="15%" bgcolor="#F7F7F7"><div align="center">书籍介绍<font color="#FF0000"> (中文)</font></div></td>
          <td bgcolor="#F7F7F7"><INPUT type="hidden" name="body" value="">
<IFRAME ID="eWebEditor1" SRC="ewebeditor/ewebeditor.htm?id=body&style=popup" FRAMEBORDER="0" SCROLLING="no" WIDTH="100%" HEIGHT="400"></IFRAME> </td>
        </tr>
        

        <tr>
          <td bgcolor="#F7F7F7"><div align="center">书籍介绍 <font color="#FF0000">(英文)</font></div></td>
          <td bgcolor="#F7F7F7"><INPUT type="hidden" name="ebody" value="">
<IFRAME ID="eWebEditor1" SRC="ewebeditor/ewebeditor.htm?id=ebody&style=popup" FRAMEBORDER="0" SCROLLING="no" WIDTH="100%" HEIGHT="400"></IFRAME></td>
          </tr>
        <tr>
          <td bgcolor="#F7F7F7">&nbsp;</td>
          <td bgcolor="#F7F7F7"><input type="submit" name="button"  value="確认提交" /></td>
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
