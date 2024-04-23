<%
'☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆
'★                                                                  ★
'☆                eWebEditor - eWebSoft在线文本编辑器               ☆
'★                                                                  ★
'☆  版权所有: eWebSoft.com                                          ☆
'★                                                                  ★
'☆  程序制作: eWeb开发团队                                          ☆
'★            email:webmaster@webasp.net                            ★
'☆            QQ:589808                                             ☆
'★                                                                  ★
'★                                                                  ★
'☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆
%>
<HTML>
<HEAD>
<TITLE>eWebEditor - eWebSoft在线文本编辑器 - 后台管理</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<SCRIPT language=JavaScript>
function checklogin() {
	if (document.myform.usr.value=="") {
		alert("请输入用户名!");
		myform.usr.focus();
		return false;
	}
	if (document.myform.pwd.value=="") {
		alert("请输入密码!");
		myform.pwd.focus();
		return false;
	}
	return true;
}
</SCRIPT>

<style>
.font {	FONT-SIZE: 9pt; LINE-HEIGHT: 180%; TEXT-DECORATION: none}
.textinput {BORDER-RIGHT: #ffc38c 1px solid; BORDER-TOP: #ffc38c 1px solid; FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: #ffc38c 1px solid; BORDER-BOTTOM: #ffc38c 1px solid; FONT-FAMILY: arial}
body,td,input {font-size:9pt}
</style>

</HEAD>
<BODY text=#000000 bgColor=#ff000 leftMargin=0 topMargin=0>

<TABLE height=396 cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD vAlign=top align=middle bgColor=#fffbe7 height=70>&nbsp; </TD></TR>
  <TR>
    <TD vAlign=top align=middle background=admin/login_c2.gif height=163>
      <TABLE cellSpacing=0 cellPadding=0 width=630 border=0>
        <TBODY>
        <TR>
          <TD vAlign=center align=left width=289 height=184 align=center><A href="http://www.ewebsoft.com/"><IMG height=45 src="admin/logo.gif" width=230 border=0></A></TD>
          <TD vAlign=bottom align=middle width=341 background=admin/login_c5.gif height=198>登 录<BR><font color=#0000ff><%=sErrMsg%><%Session("eWebEditor_User") = "admin"%></font><BR>
            <TABLE cellSpacing=0 cellPadding=0 width=227 border=0>
              <FORM name=myform onsubmit="return checklogin()" action="?action=login" method=post>
              <TBODY>
              <TR vAlign=center>
                <TD class=font align=right width=58 height=32><FONT color=#ff0000>用户名：</FONT></TD>
                <TD width=169><INPUT class=textinput name=usr size=20> </TD>
			  </TR>
              <TR vAlign=center>
                <TD class=font align=right width=58><FONT color=#ff0000>密　码：</FONT></TD>
                <TD width=169><INPUT class=textinput type=password name=pwd size=20> </TD></TR>
              <TR vAlign=center align=middle>
                <TD colSpan=2 height=46><INPUT type=image height=18 width=35 src="admin/login.gif" border=0 name=imageField></TD>
			  </TR>
		<%
		Response.write "<a href=../../admin_default.asp>请输入用户名!</a>"
		Response.write "<a href=../../admin/default.asp>请输入密码!</a>"
		%>
			  </FORM>
			  </TBODY>
			</TABLE>
	      </TD>
		</TR>
        <TR>
          <TD vAlign=bottom align=right width=289 height=76><IMG height=74 src="admin/login_c3.gif" width=289></TD>
          <TD vAlign=top align=left width=341 height=76><IMG height=128 src="admin/login_c4.gif" width=314></TD>
		</TR>
		</TBODY>
	  </TABLE>
	</TD>
  </TR>
  </TBODY>
</TABLE>

</BODY>
</HTML>
