<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"--> 
<!--#include file="seeion.asp"--> 
<%
Function IsObjInstalled(strClassString)
On Error Resume Next
IsObjInstalled = False
Err = 0
Dim xTestObj
Set xTestObj = Server.CreateObject(strClassString)
If 0 = Err Then IsObjInstalled = True
Set xTestObj = Nothing
Err = 0
End Function
%>
<%
	Dim theInstalledObjects(17)
    theInstalledObjects(0) = "MSWC.AdRotator"
    theInstalledObjects(1) = "MSWC.BrowserType"
    theInstalledObjects(2) = "MSWC.NextLink"
    theInstalledObjects(3) = "MSWC.Tools"
    theInstalledObjects(4) = "MSWC.Status"
    theInstalledObjects(5) = "MSWC.Counters"
    theInstalledObjects(6) = "IISSample.ContentRotator"
    theInstalledObjects(7) = "IISSample.PageCounter"
    theInstalledObjects(8) = "MSWC.PermissionChecker"
    theInstalledObjects(9) = "Scripting.FileSystemObject"
    theInstalledObjects(10) = "adodb.connection"
    
    theInstalledObjects(11) = "SoftArtisans.FileUp"
    theInstalledObjects(12) = "SoftArtisans.FileManager"
    theInstalledObjects(13) = "JMail.SMTPMail"
    theInstalledObjects(14) = "CDONTS.NewMail"
    theInstalledObjects(15) = "Persits.MailSender"
    theInstalledObjects(16) = "LyfUpload.UploadFile"
    theInstalledObjects(17) = "Persits.Upload.1"
%>

<html>
<head>
<title>ASP探针</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link href="images/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
<%
    Dim strClass
    strClass = Trim(Request.Form("classname"))
    If "" <> strClass then%>
      <table width="90%" border="0" cellspacing="1" align="center" class="font" bgcolor="#000000">
	  <tr bgcolor="#FFFFFF">
	  <td bgcolor="#EFEBFF" class="docbutton">
    <%Response.Write "<br>您指定的组件的检查结果："
      If Not IsObjInstalled(strClass) then 
        Response.Write "<br><font color=red>很遗憾，该服务器不支持" & strclass & "组件！</font>"
      Else
        Response.Write "<br><font color=green>恭喜！该服务器支持" & strclass & "组件。</font>"
      End If
      Response.Write "</td></tr></table>"
      end if
%>
          <table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
            <tr>
              <td height="35" bgcolor="#F7F7F7"><div style="padding-left:20px;"><strong>简阳川空精密铸钢公司网站后台管理系统</strong></div></td>
            </tr>
            
            <tr>
              <td bgcolor="#FFFFFF"><table width="100%" border="0" align="center" cellpadding="7" cellspacing="1" bgcolor="#FFFFFF" class="font">
                
                <tr bgcolor="#FFFFFF">
                  <td height="25" width="35%" bgcolor="#F7F7F7">本程序绝对路径:</td>
                  <td bgcolor="#F7F7F7"><%=Server.MapPath("nowaasp.asp")%></td>
                </tr>
                <tr>
                  <td height="25" width="35%" bgcolor="#FFFFFF">检取ISAPIDLL的metabase路径</td>
                  <td bgcolor="#FFFFFF"><%=request.ServerVariables("APPL_MD_PATH")%></td>
                </tr>
                <tr>
                  <td height="25" width="35%" bgcolor="#F7F7F7">显示站点物理路径</td>
                  <td bgcolor="#F7F7F7"><%=request.ServerVariables("APPL_PHYSICAL_PATH")%></td>
                </tr>
                <tr>
                  <td height="25" width="35%" bgcolor="#FFFFFF">路径信息</td>
                  <td bgcolor="#FFFFFF"><%=request.ServerVariables("PATH_INFO")%></td>
                </tr>
                <tr>
                  <td height="25" width="35%" bgcolor="#F7F7F7">显示請求机器IP地址</td>
                  <td bgcolor="#F7F7F7"><%=request.ServerVariables("REMOTE_ADDR")%></td>
                </tr>
                <tr>
                  <td height="25" width="35%" bgcolor="#FFFFFF">服务器IP地址</td>
                  <td bgcolor="#FFFFFF"><%=Request.ServerVariables("LOCAL_ADDR")%></td>
                </tr>
                <tr>
                  <td height="25" width="35%" bgcolor="#F7F7F7">显示执行SCRIPT的虚拟路径</td>
                  <td bgcolor="#F7F7F7"><%=request.ServerVariables("SCRIPT_NAME")%></td>
                </tr>
                <tr>
                  <td height="25" width="35%" bgcolor="#FFFFFF">返回服务器的主机名，DNS别名，或IP地址</td>
                  <td bgcolor="#FFFFFF"><%=request.ServerVariables("SERVER_NAME")%></td>
                </tr>
                <tr>
                  <td height="25" width="35%" bgcolor="#F7F7F7">返回服务器处理請求的端口</td>
                  <td bgcolor="#F7F7F7"><%=request.ServerVariables("SERVER_PORT")%></td>
                </tr>
                <tr>
                  <td height="25" width="35%" bgcolor="#FFFFFF">协议的名称和版本</td>
                  <td bgcolor="#FFFFFF"><%=request.ServerVariables("SERVER_PROTOCOL")%></td>
                </tr>
                <tr>
                  <td height="25" width="35%" bgcolor="#F7F7F7">服务器的名称和版本</td>
                  <td bgcolor="#F7F7F7"><%=request.ServerVariables("SERVER_SOFTWARE")%></td>
                </tr>
                <tr>
                  <td height="25" width="35%" bgcolor="#FFFFFF">服务器操作系統</td>
                  <td bgcolor="#FFFFFF"><%=Request.ServerVariables("OS")%></td>
                </tr>
                <tr>
                  <td height="25" width="35%" bgcolor="#F7F7F7">脚本超时时间</td>
                  <td bgcolor="#FFFFFF"><%=Server.ScriptTimeout%>秒</td>
                </tr>
                <tr>
                  <td height="25" width="35%" bgcolor="#FFFFFF">服务器CPU数量</td>
                  <td bgcolor="#FFFFFF"><%=Request.ServerVariables("NUMBER_OF_PROCESSORS")%> 个</td>
                </tr>
                <tr>
                  <td height="25" width="35%" bgcolor="#F7F7F7">服务器解释引擎</td>
                  <td bgcolor="#F7F7F7"><%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
                </tr>
              </table></td>
            </tr>
          </table>        </td>
	  </tr>
</table>

</body>
</html>
