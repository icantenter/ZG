

<!--#include file="conn.asp"-->
<!--#include file="seeion.asp"-->
<!--#include file="function.asp"-->
<%


Const MaxPerPage=20
dim totalPut,CurrentPage,TotalPages
dim UploadDir,TruePath,fso,theFolder,theFile,whichfile,thisfile,FileCount,TotleSize

if request("page")<>"" then
    currentPage=cint(request("page"))
else
	currentPage=1
end if

if right(SaveUpFilesPath,1)<>"/" then
	UploadDir="../" & SaveUpFilesPath & "/"
else
	UploadDir="../" & SaveUpFilesPath
end if
TruePath=Server.MapPath(UploadDir)
If not IsObjInstalled("Scripting.FileSystemObject") Then
	Response.Write "<b><font color=red>��ķ�������֧�� FSO(Scripting.FileSystemObject)! ����ʹ�ñ�����</font></b>"
Else
	set fso=CreateObject("Scripting.FileSystemObject")
	if request("Action")="Del" then
		whichfile=server.mappath(Request("FileName")) 
		Set thisfile = fso.GetFile(whichfile) 
		thisfile.Delete True
	end if

%>
<link href="images/style.css" type="text/css" rel="stylesheet" />
<table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="862" align="center" valign="top">
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
        <tr>
          <td height="30" bgcolor="#FFFFFF"><div align="center">
              <table width="100%" border="0" cellpadding="0" cellspacing="1">
                <tr>
                  <td height="30" bgcolor="#F7F7F7"><div  style="padding-left:20px;"><strong>�� 
                  �� �� �� �� ��</strong>����������</div></td>
                </tr>
              </table>
          </div></td>
        </tr>
        <tr>
          <td bgcolor="#FFFFFF"><table width="100%" border="1" align="center" cellpadding="6" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#F7F7F7">
              <tr>
                <td width="89%" height="37" bgcolor="#FFFFFF"><%
  if fso.FolderExists(TruePath)then
	FileCount=0
	TotleSize=0
	Set theFolder=fso.GetFolder(TruePath)
	For Each theFile In theFolder.Files
		FileCount=FileCount+1
		TotleSize=TotleSize+theFile.Size
	next
    totalPut=FileCount
	if currentpage<1 then
   		currentpage=1
   	end if
   	if (currentpage-1)*MaxPerPage>totalput then
		if (totalPut mod MaxPerPage)=0 then
	  		currentpage= totalPut \ MaxPerPage
	  	else
	      	currentpage= totalPut \ MaxPerPage + 1
		end if

    end if
	if currentPage=1 then
		showpage2 strFileName,totalput,MaxPerPage
		showContent     	
		showpage2 strFileName,totalput,MaxPerPage
		response.write "<br><div align='center'>��ҳ����ʾ <b>" & FileCount & "</b> ���ļ���ռ�� <b>" & TotleSize\1024 & "</b> K</div>"
   	else
   	   	if (currentPage-1)*MaxPerPage<totalPut then
			showpage2 strFileName,totalput,MaxPerPage
			showContent     	
			showpage2 strFileName,totalput,MaxPerPage
			response.write "<br><div align='center'>��ҳ����ʾ <b>" & FileCount & "</b> ���ļ���ռ�� <b>" & TotleSize\1024 & "</b> K</div>"
       	else
        	currentPage=1
			showpage2 strFileName,totalput,MaxPerPage
			showContent     	
			showpage2 strFileName,totalput,MaxPerPage
			response.write "<br><div align='center'>��ҳ����ʾ <b>" & FileCount & "</b> ���ļ���ռ�� <b>" & TotleSize\1024 & "</b> K</div>"
    	end if
	end if
  else
	response.write "�Ҳ����ļ��У���������������"
  end if
end if

sub showContent()
   	dim c
	FileCount=0
	TotleSize=0
%></td>
              </tr>
              <tr>
                <td bgcolor="#FFFFFF"><table width="95%" border="0" align="center" cellpadding="2" cellspacing="0" class="border">
                  <tr bgcolor="A4B6D7" class="title">
                    <td height="25" colspan="2" align="center" bgcolor="#CCCCCC">�ļ���</td>
                    <td width="103" height="20" align="center" bgcolor="#CCCCCC">�ļ���С</td>
                    <td width="110" height="20" align="center" bgcolor="#CCCCCC">�ļ�����</td>
                    <td width="206" height="20" align="center" bgcolor="#CCCCCC">����޸�ʱ��</td>
                    <td width="50" height="20" align="center" bgcolor="#CCCCCC">����</td>
                  </tr>
                  <%

For Each theFile In theFolder.Files
	c=c+1
	if FileCount>=MaxPerPage then
		exit for
	elseif c>MaxPerPage*(CurrentPage-1) then
%>
                  <tr class="tdbg">
                    <td width="119" height="22" bgcolor="#FFFFFF"><a href="<%=(UploadDir & theFile.Name)%>" target="_blank" class="img"><img src="<%=(UploadDir & theFile.Name)%>" alt="������´������ͼƬԭ�ߴ�" width="80" height="50" border="0"  onload="javascript:if(this.width&gt;150)this.width=150" /></a></td>
                    <td width="287" bgcolor="#FFFFFF"><input type="text" class="bule" value="/<%=SaveUpFilesPath&"/"&theFile.Name%>" size="30" disabled="disabled" />
                      <button  onclick="window.clipboardData.setData('text',this.previousSibling.value)">����</button></td>
                    <td width="103" align="right" bgcolor="#FFFFFF"><%=theFile.size%>�ֽ�</td>
                    <td width="110" align="center" bgcolor="#FFFFFF"><%=theFile.type%></td>
                    <td width="206" align="center" bgcolor="#FFFFFF"><%=theFile.DateLastModified%></td>
                    <td width="50" align="center" bgcolor="#FFFFFF"><input type="button" name="Submit" value="ɾ��" onclick="javascript:if(confirm('ȷ��ɾ����ɾ���󲻿ɻָ�!')){window.location.href='<%=strFileName%>Action=Del&amp;FileName=<%=UploadDir&theFile.Name%>';}else{history.go(0);}" /> </td>
                  </tr>
                  <%
		FileCount=FileCount+1
		TotleSize=TotleSize+theFile.Size
	end if
Next
%>
                </table></td>
              </tr>
            </table>
              </form>
          </td>
        </tr>
      </table>
    <%
end sub
%> </td>
  </tr>
</table>
<%
sub showpage2(sfilename,totalnumber,maxperpage)
	dim n, i,strTemp
	if totalnumber mod maxperpage=0 then
    	n= totalnumber \ maxperpage
  	else
    	n= totalnumber \ maxperpage+1
  	end if
  	strTemp= "<table align='center'><form name='showpages' method='Post' action='" & sfilename & "'><tr><td>"
	strTemp=strTemp & "�� <b>" & totalnumber & "</b> ���ļ���ռ�� <b>" & TotleSize\1024 & "</b> K&nbsp;&nbsp;&nbsp;"
	sfilename=JoinChar(sfilename)
  	if CurrentPage<2 then
    		strTemp=strTemp & "��ҳ ��һҳ&nbsp;"
  	else
    		strTemp=strTemp & "<a href='" & sfilename & "page=1'>��ҳ</a>&nbsp;"
    		strTemp=strTemp & "<a href='" & sfilename & "page=" & (CurrentPage-1) & "'>��һҳ</a>&nbsp;"
  	end if

  	if n-currentpage<1 then
    		strTemp=strTemp & "��һҳ βҳ"
  	else
    		strTemp=strTemp & "<a href='" & sfilename & "page=" & (CurrentPage+1) & "'>��һҳ</a>&nbsp;"
    		strTemp=strTemp & "<a href='" & sfilename & "page=" & n & "'>βҳ</a>"
  	end if
   	strTemp=strTemp & "&nbsp;ҳ�Σ�<strong><font color=red>" & CurrentPage & "</font>/" & n & "</strong>ҳ "
    strTemp=strTemp & "&nbsp;<b>" & maxperpage & "</b>" & "���ļ�/ҳ"
	strTemp=strTemp & "&nbsp;ת����<select name='page' size='1' onchange='javascript:submit()'>"   
    for i = 1 to n   
   		strTemp=strTemp & "<option value='" & i & "'"
		if cint(CurrentPage)=cint(i) then strTemp=strTemp & " selected "
		strTemp=strTemp & ">��" & i & "ҳ</option>"   
	next
	strTemp=strTemp & "</select>"
	strTemp=strTemp & "</td></tr></form></table>"
	response.write strTemp
end sub
%>

