<div id="flash"><table width="975" height="182" border="0px" align="center" cellpadding="0" cellspacing="0" class="td1">
  <tr>
    <td width="975" height="182" class="td1">
    <script type=text/javascript>
        <!--
        var focus_width=975//ͼƬ��
        var focus_height=182//ͼƬ��
        var text_height=0//������ʾ���ֱ���߶�,���Ϊ20���������ʾ����ֵ��Ϊ0���ɣ�
        var swf_height = focus_height+text_height
        //var pics=""
        //var links=""
        //var texts=""
		<%
		set db=conn.execute("select top 5 * from flash order by px_id asc")'Ĭ����ʾ�������¹��
			i=0
			do while not db.eof
				 pics=pics&"|"&db("img")
				 links=links&"|"&db("link")
				 texts=texts&"|"&db("title")
				db.moveNext
				i=i+1
			loop
response.write "var pics='"&right(pics,len(pics)-1)&"'"&vbcrlf
response.write "var links='"&right(links,len(links)-1)&"'"&vbcrlf
response.write "var texts='"&right(texts,len(texts)-1)&"'"&vbcrlf
		%>
        document.write('<object ID="focus_flash" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ focus_width +'" height="'+ swf_height +'">');
        document.write('<param name="allowScriptAccess" value="sameDomain"><param name="movie" value="img/adplay.swf"><param name="quality" value="high"><param name="bgcolor" value="#f5f5f5">');
        document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
        document.write('<param name="FlashVars" value="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'">');
        document.write('<embed ID="focus_flash" src="img/adplay.swf" wmode="opaque" FlashVars="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'" menu="false" bgcolor="#C5C5C5" quality="high" width="'+ focus_width +'" height="'+ swf_height +'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />');document.write('</object>'); 
        //-->
</script>
    </td>
  </tr>
</table>
</div>