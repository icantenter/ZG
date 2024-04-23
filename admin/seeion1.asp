<%if session("admin")<>"" then%>
<%
else
response.write "<script>alert('链接超时！请先登陆后再进行操作！');window.location.href='login.asp';</script>"
response.end
end if
%>

