<%if session("admin")<>"" then%>
<%
else
response.write "<script>alert('���ӳ�ʱ�����ȵ�½���ٽ��в�����');window.location.href='login.asp';</script>"
response.end
end if
%>

