<%
response.buffer=true '���û��崦��
dim conn,db
dim connstr
db="../data/#gg6hh.mdb"'���ݿ�����·��
connstr="DBQ="+server.mappath(""&db&"")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
set conn=server.createobject("ADODB.CONNECTION")
conn.open connstr
If Err Then
err.Clear
Set Conn = Nothing
Response.Write "���ݿ����ӳ����������ݿ������ļ��е����ݿ�������á�"
Response.End
End If 
sub Chkhttp()
server_vv=len(Request.ServerVariables("SERVER_NAME"))
server_v1=left(Cstr(Request.ServerVariables("HTTP_REFERER")),server_vv)
server_v2=left(Cstr("http://"&Request.ServerVariables("SERVER_NAME")),server_vv)
if server_v1<>server_v2 or server_v1="" or server_v1="" then
response.Charset="utf-8"
response.write("<script>alert('���󣺽�ֹ��վ���ⲿ�ύ����!.')</script>")
response.end
end if
end sub
%>