<!--#include file="conn.asp"-->
<!--#include file="config.asp" -->


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<META CONTENT="简阳市川空精密铸钢有限公司,四川省川空，炼钢，精密，精密制造，铸钢。" NAME="description">
<title>简阳川空精密铸钢有限公司简介</title>
<script type='text/javascript' src='roller.js' ></script>
<script type='text/javascript' src='jquery-1.2.6.min.js'></script>
<script type='text/javascript' src='kwicks.js'></script>
<script type='text/javascript' src='custom.js'></script>
<script language="javascript">
		<!--
			function outliner()
			{ 
				var child = document.all[event.srcElement.getAttribute("child",false)];
				if (null != child){
					if(child.className == "expanded")
					{
						child.className = "collapsed";
						return;
					}
					if(child.className == "collapsed")
					{
						child.className = "expanded";
						return;
					}
				}
			}
		//-->
		</script>
<link href="style.css" rel="stylesheet" style="text/css" />
<style type="text/css">
body { background: #fff; } ul { padding: 0; margin: 0; } li { list-style: none; } img { border: 0; }
.play { width: 600px; height: 410px; margin: 0px auto 0; background: #e5e5e5; font: 12px Arial; }
.big_pic { width: 600px; height: 320px; overflow: hidden; border-bottom: 1px solid #ccc; background: #222; position: relative; }
.big_pic li { width: 600px; height: 320px; overflow: hidden; position: absolute; top: 0; left: 0; z-index: 0; background: url(http://www.webdm.cn/images/loading.gif) no-repeat center center; }
.mark_left { width: 300px; height: 320px; position: absolute; left: 0; top: 0; background: red; filter: alpha(opacity:0); opacity: 0; z-index:3000; }
.mark_right { width: 300px; height: 320px; position: absolute; left: 200px; top: 0; background: green; filter: alpha(opacity:0); opacity: 0; z-index:3000; }
.big_pic .prev { width: 60px; height: 60px; background: url(http://www.webdm.cn/images/20110429/btn.gif) no-repeat; position: absolute; top: 130px; left: 10px; z-index: 3001; display: none; cursor: pointer; }
.big_pic .next { width: 60px; height: 60px; background: url(http://www.webdm.cn/images/20110429/btn.gif) no-repeat 0 -60px; position: absolute; top: 130px; right: 10px; z-index: 3001; display: none;cursor: pointer; }
.big_pic .text { position: absolute; left: 10px; top: 302px; z-index: 3000; color: #ccc; }
.big_pic .length { position: absolute; right: 10px; bottom: 4px; z-index: 3000; color: #ccc; }
.big_pic .bg { width: 600px; height: 25px; background: #000; filter: alpha(opacity=60); opacity: 0.6; position: absolute; z-index: 2999; bottom: 0; left: 0; }
.small_pic { width: 580px; height: 74px; position: relative; top: 7px; left: 10px; overflow: hidden; }
.small_pic ul { height: 94px; position: absolute; top: 0; left: -2px; }
.small_pic li { width: 120px; height: 94px; float: left; padding-right: 5px; background:#e5e5e5; no-repeat center center; cursor: pointer; filter: alpha(opacity=60); opacity: 0.6; }
.small_pic img { width: 120px; height: 94px; }
</style>
<script type="text/javascript">
var g_aImgInfo=
[
 
 {info: "诚信务实、团结奋发"},
 {info: "产品展示"},
 {info: "产品展示"},
 {info: "产品展示"},
 {info: "产品展示"},
 {info: "生产加工"},
 {info: "生产加工"},
 {info: "生产加工"},
 {info: "设备检测"},
 {info: "生产加工"},
 {info: "生产加工"},
 {info: "生产加工"},
 {info: "生产加工"},
 {info: "生产加工"},
 {info: "生产加工"}
];
var oDiv=null;
var oUlContent=null;
var oUlBtn=null;
var aLiImg=null;
var aLiBtn=null;
var oBtnPrev=null;
var oBtnNext=null;
var oTxtInfo=null;
var oTxtLength=null;
var oMarkPrev=null;
var oMarkNext=null;
var g_aTimerImg=[];
var g_aTimerBtn=[];
var g_oTimerUl=null;
var g_oTimerAutoPlay=null;
var g_aLiBtnAlpha=[];
var g_iNowImg=0;
var g_iZIndexBase=2;
window.onload=function ()
{
 var i=0;
 
 //获取各类元素
 oDiv=document.getElementById('playimages');
 oUlContent=oDiv.getElementsByTagName('ul')[0];
 oUlBtn=oDiv.getElementsByTagName('ul')[1];
 
 oBtnPrev=oDiv.getElementsByTagName('div')[0];
 oBtnNext=oDiv.getElementsByTagName('div')[1];
 
 oTxtInfo=oDiv.getElementsByTagName('div')[2];
 oTxtLength=oDiv.getElementsByTagName('div')[3];
 
 oMarkPrev=oDiv.getElementsByTagName('a')[0];
 oMarkNext=oDiv.getElementsByTagName('a')[1];
 
 aLiImg=oUlContent.getElementsByTagName('li');
 aLiBtn=oUlBtn.getElementsByTagName('li');
 
 //为元素添加属性
 oTxtInfo.innerHTML=g_aImgInfo[0].info;
 oTxtLength.innerHTML='1/'+aLiImg.length;
 
 oMarkPrev.href=g_aImgInfo[0].href;
 oMarkNext.href=g_aImgInfo[0].href;
 
 oBtnPrev.miaovOpacity=0;
 oBtnNext.miaovOpacity=0;
 
 oBtnPrev.miaovTime=0;
 oBtnNext.miaovTime=0;
 
 oUlBtn.style.width=aLiBtn[0].offsetWidth*aLiBtn.length+'px';
 
 //为元素添加事件
 function showPrev()
 {
  showBtn(oBtnPrev);
  hideBtn(oBtnNext);
  
  stopAutoPlay();
 }

 
 function showNext()
 {
  hideBtn(oBtnPrev);
  showBtn(oBtnNext);
  
  stopAutoPlay();
 }
 
 function hideAll()
 {
  hideBtn(oBtnPrev);
  hideBtn(oBtnNext);
  
  startAutoPlay();
 }
 
 oMarkPrev.onmouseover =showPrev;
 oBtnPrev.onmouseover =showPrev;
 oMarkNext.onmouseover =showNext;
 oBtnNext.onmouseover =showNext;
 
 oBtnPrev.onmouseout  =hideAll;
 oBtnNext.onmouseout  =hideAll;
 oMarkPrev.onmouseout =hideAll;
 oMarkNext.onmouseout =hideAll;
 
 oBtnPrev.onmousedown =gotoPrev;
 oBtnNext.onmousedown =gotoNext;
 
 oUlBtn.onmouseover  =stopAutoPlay;
 oUlBtn.onmouseout  =startAutoPlay;
 
 for(i=0;i<aLiBtn.length;i++)
 {
  aLiBtn[i].miaovIndex=i;
  aLiBtn[i].onmouseover=function ()
  {
   if(g_iNowImg!=this.miaovIndex)
   {
    showLiBtn(this.miaovIndex);
   }
  };
  aLiBtn[i].onmouseout=function ()
  {
   if(g_iNowImg!=this.miaovIndex)
   {
    hideLiBtn(this.miaovIndex);
   }
  };
  aLiBtn[i].onmousedown=function ()
  {
   gotoImg(this.miaovIndex);
  };
  g_aTimerBtn[i]=null;
  g_aLiBtnAlpha[i]=60;
 }
 
 g_aLiBtnAlpha[0]=100;
 
 startAutoPlay();
};
function showBtn(oBtn)
{
 if(oBtn.miaovTimer)
 {
  clearInterval(oBtn.miaovTimer);
 }
 
 oBtn.miaovTimer=setInterval
 (
  function ()
  {
   if(oBtn.miaovOpacity<100)
   {
    oBtn.miaovOpacity+=10;
    
    oBtn.style.display='block';
    oBtn.style.filter="alpha(opacity:"+oBtn.miaovOpacity+")";
    oBtn.style.opacity=oBtn.miaovOpacity/100;
   }
   else
   {
    oBtn.style.filter="";
    oBtn.style.opacity="";
    
    clearInterval(oBtn.miaovTimer);
    oBtn.miaovTimer=0;
   }
  }, 30
 );
}
function hideBtn(oBtn)
{
 if(oBtn.miaovTimer)
 {
  clearInterval(oBtn.miaovTimer);
 }
 
 oBtn.miaovTimer=setInterval
 (
  function ()
  {
   if(oBtn.miaovOpacity>0)
   {
    oBtn.miaovOpacity-=10;
    
    oBtn.style.filter="alpha(opacity:"+oBtn.miaovOpacity+")";
    oBtn.style.opacity=oBtn.miaovOpacity/100;
   }
   else
   {
    oBtn.style.display='none';
    oBtn.style.filter="";
    oBtn.style.opacity="";
    
    clearInterval(oBtn.miaovTimer);
    oBtn.miaovTimer=0;
   }
  }, 30
 );
}
function gotoImg(index)
{
 if(index==g_iNowImg)
 {
  return;
 }
 
 aLiImg[index].style.height='0px';
 aLiImg[index].style.display='block';
 aLiImg[index].style.zIndex=g_iZIndexBase++;
 
 if(g_aTimerImg[index])
 {
  clearInterval(g_aTimerImg[index]);
 }
 g_aTimerImg[index]=setInterval("slideDown("+index+")", 30);
 
 for(i=0;i<aLiBtn.length;i++)
 {
  if(i==index)
  {
   showLiBtn(i);
  }
  else
  {
   hideLiBtn(i);
  }
 }
 
 moveUlBtn(index);
 
 oTxtInfo.innerHTML=g_aImgInfo[index].info;
 oTxtLength.innerHTML=(index+1)+'/'+aLiImg.length;
 
 oMarkPrev.href=g_aImgInfo[index].href;
 oMarkNext.href=g_aImgInfo[index].href;
 
 g_iNowImg=index;
}
function slideDown(index)
{
 var h=aLiImg[index].offsetHeight+10;
 
 if(h>=oUlContent.offsetHeight)
 {
  h=oUlContent.offsetHeight;
  
  clearInterval(g_aTimerImg[index]);
  g_aTimerImg[index]=null;
 }
 
 aLiImg[index].style.height=h+'px';
}
function gotoNext()
{
 gotoImg((g_iNowImg+1)%aLiImg.length);
}
function gotoPrev()
{
 gotoImg((g_iNowImg-1+aLiImg.length)%aLiImg.length);
}
function showLiBtn(index)
{
 if(g_aTimerBtn[index])
 {
  clearInterval(g_aTimerBtn[index]);
 }
 g_aTimerBtn[index]=setInterval("showLiBtnInner("+index+")", 30);
}
function showLiBtnInner(index)
{
 var alpha=g_aLiBtnAlpha[index]+10;
 
 if(alpha>=100)
 {
  aLiBtn[index].style.filter='';
  aLiBtn[index].style.opacity='1';
  
  clearInterval(g_aTimerBtn[index]);
  g_aTimerBtn[index]=null;
 }
 else
 {
  aLiBtn[index].style.filter='alpha(opacity:'+alpha+')';
  aLiBtn[index].style.opacity=alpha/100;
 }
 
 g_aLiBtnAlpha[index]=alpha;
}
function hideLiBtn(index)
{
 if(g_aTimerBtn[index])
 {
  clearInterval(g_aTimerBtn[index]);
 }
 g_aTimerBtn[index]=setInterval("hideLiBtnInner("+index+")", 30);
}
function hideLiBtnInner(index)
{
 var alpha=g_aLiBtnAlpha[index]-10;
 
 if(alpha<=60)
 {
  alpha=60;
  
  clearInterval(g_aTimerBtn[index]);
  g_aTimerBtn[index]=null;
 }
 aLiBtn[index].style.filter='alpha(opacity:'+alpha+')';
 aLiBtn[index].style.opacity=alpha/100;
 
 g_aLiBtnAlpha[index]=alpha;
}
function moveUlBtn(index)
{
 var iTarget=0;
 
 if(index==0)
 {
  index=1;
 }
 else if(index==aLiBtn.length-1)
 {
  index=aLiBtn.length-2;
 }
 
 iTarget=-(index-1)*aLiBtn[0].offsetWidth;
 
 if(g_oTimerUl)
 {
  clearInterval(g_oTimerUl);
 }
 
 g_oTimerUl=setInterval("moveUlBtnInner("+iTarget+")", 30);
}
function moveUlBtnInner(iTarget)
{
 var iSpeed=(iTarget-oUlBtn.offsetLeft)/7;
 
 if(iSpeed>0)
 {
  iSpeed=Math.ceil(iSpeed);
 }
 else
 {
  iSpeed=Math.floor(iSpeed);
 }
 
 if(oUlBtn.offsetLeft==iTarget)
 {
  clearInterval(g_oTimerUl);
  g_oTimerUl=null;
 }
 else
 {
  oUlBtn.style.left=oUlBtn.offsetLeft+iSpeed+'px';
 }
}
function startAutoPlay()
{
 if(g_oTimerAutoPlay)
 {
  clearInterval(g_oTimerAutoPlay);
 }
 
 g_oTimerAutoPlay=setInterval(gotoNext, 6000);
}
function stopAutoPlay()
{
 if(g_oTimerAutoPlay)
 {
  clearInterval(g_oTimerAutoPlay);
  g_oTimerAutoPlay=null;
 }
}
</script> 
</head>
<body>
<!--#include file="top.asp"-->
<div id="flash" align="center">
 <!--#include file="flash.asp"-->
 </div>
<div id="main1">
<div id="main_left1">
 <div id="pic"><img src="img/jianjie.jpg" /></div>
 <div id="jjtop" align="center"><span class="body2"><strong>简阳川空精密铸钢有限公司简介</strong></span></div>
<div id="jianjie1">
<% 
exec="select * from about where title='公司简介' " '如修改了名称,请在这里做相应修改
set rs=server.createobject("adodb.recordset") 
rs.open exec,conn,1,1 
%>
    <span style="line-height:25px; margin-bottom:20px;" class="body6"><%=left(rs("body"),3000)%></span></div>
<div>
<table bgcolor=#000000 border=0 bordercolor=#000000 bordercolordark=#ffffff cellpadding=0 cellspacing=0 width="636" height="12" align="right" >
        <tr> 
              
          
              <td  class=xingcheng height=12 onMouseOver="this.bgColor='#ce1212';" onMouseOut="this.bgColor='#000000';" width="450" > 
                
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class=xingcheng >
              <tr> 
                    
                <td style="cursor: hand" onClick="outliner()" child="3ALL"  height="25">&nbsp;&nbsp;&nbsp;&nbsp;附：公司常规铸造材质牌号  --- 点击展开详细介绍</td>
              </tr>
                </table>
              </td>
  </tr>
</table>
            <div   class="collapsed"   id="3ALL" align="center"> 
          <div child="3ALL2" onClick="outliner()" align="center"> 
            
          <table class=xingchengt width="600" border="0" >
            <tr> 
                
              <td> 
               <div id="cpjsnr" align="left">
<% 
exec="select * from about where title='公司常规铸造材质牌号' " '如修改了名称,请在这里做相应修改
set rs=server.createobject("adodb.recordset") 
rs.open exec,conn,1,1 
%>
    <span style="line-height:25px; margin-bottom:20px;" class="body6"><%=left(rs("body"),8000)%></span></div>

              </td>
            </tr>
            </table></div></div>
</div>
<div id="playimages" class="play" align="center"> 
    <ul class="big_pic"> 
 
  <div class="prev"></div> 
  <div class="next"></div> 
 
  <div class="text">Add captions……</div> 
  <div class="length">Calculate the number of pictures……</div> 
  
  <a class="mark_left" href="javascript:;"></a> 
  <a class="mark_right" href="javascript:;"></a> 
  <div class="bg"></div> 
  
        <li style="z-index:1;"><img src="images/15.jpg" /></li> 
            <li><img src="images/01.jpg" /></li> 
            <li><img src="images/02.jpg" /></li> 
            <li><img src="images/03.jpg" /></li> 
            <li><img src="images/04.jpg" /></li> 
            <li><img src="images/05.jpg" /></li>
			<li><img src="images/06.jpg" /></li>
			<li><img src="images/07.jpg" /></li>
			<li><img src="images/08.jpg" /></li>
			<li><img src="images/09.jpg" /></li>
			<li><img src="images/10.jpg" /></li>
			<li><img src="images/11.jpg" /></li>
			<li><img src="images/12.jpg" /></li>
			<li><img src="images/13.jpg" /></li>
			<li><img src="images/14.jpg" /></li>
			
 
    </ul> 
    <div class="small_pic"> 
        <ul style="width:600px;"> 
            <li style="filter: 100; opacity: 1;"><img src="images/15.jpg" /><img src="images/15.jpg" /></li> 
            <li><img src="images/01.jpg" /></li> 
            <li><img src="images/02.jpg" /></li> 
            <li><img src="images/03.jpg" /></li> 
            <li><img src="images/04.jpg" /></li> 
            <li><img src="images/05.jpg" /></li> 
			<li><img src="images/06.jpg" /></li>
			<li><img src="images/07.jpg" /></li>
			<li><img src="images/08.jpg" /></li>
			<li><img src="images/09.jpg" /></li>
			<li><img src="images/10.jpg" /></li>
			<li><img src="images/11.jpg" /></li>
			<li><img src="images/12.jpg" /></li>
			<li><img src="images/13.jpg" /></li>
			<li><img src="images/14.jpg" /></li>
        </ul> 
    </div> </div>
</div>
<!--#include file="right.asp"-->
</div>
 <!--#include file="bottom.asp"-->
 <script>

roller.init('nav_container','h',-200,0,100,20);
roller.init('nav_container2','v',0,-45,100,20);
roller.init('nav_container3','h',-200,-24,100,20);
roller.init('nav_container4','v',-66,0,250,20);
roller.init('nav_container5','v',0,-45,80,15);

</script>
</body>

</html>
