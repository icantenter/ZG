<%if session("admin")<>"" then%>
<%
else
response.write "<script>alert('非法操作，请先登陆后再进行操作！');window.location.href='index.asp';</script>"
end if%>