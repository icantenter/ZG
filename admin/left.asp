<!--#include file="utf-8.asp"-->
<!--#include file="conn.asp"--> 
<!--#include file="seeion.asp"--> 
<html>
<head>
<title>left</title>
<style type="text/css">
body {
background-color: #EBEBEB; 
color: #336699; 
SCROLLBAR-FACE-COLOR:#3c74d0; 
SCROLLBAR-SHADOW-COLOR: #b1caf3; 
SCROLLBAR-HIGHLIGHT-COLOR: #b1caf3; 
SCROLLBAR-3DLIGHT-COLOR: #b1caf3; 
SCROLLBAR-DARKSHADOW-COLOR: #b1caf3; 
SCROLLBAR-TRACK-COLOR:#b1caf3; 
SCROLLBAR-ARROW-COLOR: #92C0D1;
}

<!--
*{margin:0;padding:0;border:0;}
body {font-family: arial, 宋体, serif;font-size:12px;margin-left: 3px;margin-top: 0px;margin-right: 0px;margin-bottom: 0px;}
#nav {width:140px;line-height: 24px; list-style-type: none;text-align:left;/*定义整个ul菜单的行高和背景色*/}
/*==================一级目录===================*/
#nav a {width:140px; display: block;padding-left:40px;/*Width(一定要)，否则下面的Li会变形*/
}#nav li {width:140px; background-image:url(images/left_title.gif); /*一级目录的背景色*/border-bottom:#F7F7F7 1px solid; /*下面的一条白边*/float:left;/*float：left,本不应该设置，但由于在Firefox不能正常显示继承Nav的width,限制宽度，li自动向下延伸*/}
#nav li a:hover{ background-image:url(images/left_title2.gif);	/*一级目录onMouseOver显示的背景色*/}
#nav a:link  {color:#000; text-decoration:none;}
#nav a:visited  {color:#000;text-decoration:none;}
#nav a:hover  {color:#000;text-decoration:none;}
/*==================二级目录===================*/
#nav li ul {list-style:none;text-align:left;}
#nav li ul li{background: #EBEBEB; /*二级目录的背景色*/}
#nav li ul a{ padding-left:40px;width:140px;/* padding-left二级目录中文字向右移动，但Width必须重新设置=(总宽度-padding-left)*/}
/*下面是二级目录的链接样式*/
#nav li ul a:link  {color:#000; text-decoration:none;}
#nav li ul a:visited  {color:#000;text-decoration:none;}
#nav li ul a:hover {color:#000;text-decoration:none;font-weight:normal;background:#cccccc;/* 二级onmouseover的字体颜色、背景色*/}
/*==============================*/
#nav li:hover ul {left: auto;}
#nav li.sfhover ul {left: auto;}
#content {clear: left; }
#nav ul.collapsed {display: none;}
-->
#PARENT{width:140px;padding-left:0px;}
</style>
</head>
<body>
<div id="PARENT" style="padding-top:5px;">
<ul id="nav">
<li><a href="#Menu=ChildMenu1"  onclick="DoMenu('ChildMenu1')">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;网站管理</a>
	<ul id="ChildMenu1" class="expanded">
  <li><a href="wzsz.asp" target="main">系统管理</a></li>
  <li><a href="xiugaipassword.asp" target="main">修改密码</a></li>
  <li><a href="Manage_backup.asp" target="main">数据备份</a></li>
  <li><a href="ManagePartPic.asp" target="main">上传文件管理</a></li>
	</ul>
</li>
<li><a href="#Menu=ChildMenu2" onClick="DoMenu('ChildMenu2')">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;单页管理</a>
	<ul id="ChildMenu2" class="expanded">
        <li><a href="add_about.asp" target="main">增加单页</a></li>
        <li><a href="admin_about.asp" target="main">管理单页</a></li>
	</ul>
</li>
<li><a href="#Menu=ChildMenu3" onClick="DoMenu('ChildMenu3')">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新闻管理</a>
	<ul id="ChildMenu3" class="expanded">
        <li><a href="add_news.asp" target="main">增加新闻</a></li>
        <li><a href="admin_news.asp" target="main">管理新闻</a></li>
        <li><a href="news_fl.asp" target="main">分类管理</a></li>
	</ul>
</li>
<li><a href="#Menu=ChildMenu4" onClick="DoMenu('ChildMenu4')">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;产品管理</a>
	<ul id="ChildMenu4" class="expanded">
        <li><a href="add_shop.asp" target="main">增加产品</a></li>
        <li><a href="admin_shop.asp" target="main">管理产品</a></li>
        <li><a href="shop_fl.asp" target="main">分类管理</a></li>
	</ul>
</li>
<li><a href="#Menu=ChildMenu4" onClick="DoMenu('ChildMenu4')">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;工程案例</a>
	<ul id="ChildMenu4" class="expanded">
        <li><a href="add_Case.asp" target="main">增加工程</a></li>
        <li><a href="admin_Case.asp" target="main">管理工程</a></li>
        <li><a href="Case_fl.asp" target="main">分类管理</a></li>
	</ul>
</li>


<li><a href="#Menu=ChildMenu5" onClick="DoMenu('ChildMenu5')">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;人才管理</a>
	<ul id="ChildMenu5" class="expanded">
        <li><a href="add_zw.asp" target="main">发布职位</a></li>
        <li><a href="admin_zw.asp" target="main">管理职位</a></li>
		<li><a href="admin_jobly.asp" target="main">招聘留言</a></li>
	</ul>
</li>
<li><a href="#Menu=ChildMenu8" onClick="DoMenu('ChildMenu8')">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;幻灯管理</a>
	<ul id="ChildMenu8" class="expanded">
        <li><a href="add_flash.asp" target="main">增加广告</a></li>
        <li><a href="admin_flash.asp" target="main">管理广告</a></li>
	</ul>
</li>
<li><a href="#Menu=ChildMenu8" onClick="DoMenu('ChildMenu8')">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;幻灯管理2</a>
	<ul id="ChildMenu8" class="expanded">
        <li><a href="add_flash1.asp" target="main">增加广告</a></li>
        <li><a href="admin_flash1.asp" target="main">管理广告</a></li>
	</ul>
</li>

</ul>
</div>
</body>
</html>
<script type=text/javascript><!--
var LastLeftID = "";
function menuFix() {
	var obj = document.getElementById("nav").getElementsByTagName("li");
	
	for (var i=0; i<obj.length; i++) {
		obj[i].onmouseover=function() {
			this.className+=(this.className.length>0? " ": "") + "sfhover";
		}
		obj[i].onMouseDown=function() {
			this.className+=(this.className.length>0? " ": "") + "sfhover";
		}
		obj[i].onMouseUp=function() {
			this.className+=(this.className.length>0? " ": "") + "sfhover";
		}
		obj[i].onmouseout=function() {
			this.className=this.className.replace(new RegExp("( ?|^)sfhover\b"), "");
		}
	}
}
function DoMenu(emid)
{
	var obj = document.getElementById(emid);	
	obj.className = (obj.className.toLowerCase() == "expanded"?"collapsed":"expanded");
	if((LastLeftID!="")&&(emid!=LastLeftID))	//关闭上一个Menu
	{
		document.getElementById(LastLeftID).className = "collapsed";
	}
	LastLeftID = emid;
}
function GetMenuID()
{
	var MenuID="";
	var _paramStr = new String(window.location.href);
	var _sharpPos = _paramStr.indexOf("#");
	
	if (_sharpPos >= 0 && _sharpPos < _paramStr.length - 1)
	{
		_paramStr = _paramStr.substring(_sharpPos + 1, _paramStr.length);
	}
	else
	{
		_paramStr = "";
	}
	
	if (_paramStr.length > 0)
	{
		var _paramArr = _paramStr.split("&");
		if (_paramArr.length>0)
		{
			var _paramKeyVal = _paramArr[0].split("=");
			if (_paramKeyVal.length>0)
			{
				MenuID = _paramKeyVal[1];
			}
		}
		/*
		if (_paramArr.length>0)
		{
			var _arr = new Array(_paramArr.length);
		}
		
		//取所有#后面的，菜单只需用到Menu
		//for (var i = 0; i < _paramArr.length; i++)
		{
			var _paramKeyVal = _paramArr[i].split('=');
			
			if (_paramKeyVal.length>0)
			{
				_arr[_paramKeyVal[0]] = _paramKeyVal[1];
			}		
		}
		*/
	}
	
	if(MenuID!="")
	{
		DoMenu(MenuID)
	}
}
GetMenuID();	//*这两个function的顺序要注意一下，不然在Firefox里GetMenuID()不起效果
menuFix();
--></script>