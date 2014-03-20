<%@ page language="java" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<HTML>
<!--
 ---------------------------------------------------------------------------
 this script is copyright (c) 2001 by Michael Wallner!
 http://www.wallner-software.com
 mailto:dhtml@wallner-software.com

 you may use this script on web pages of your own
 you must not remove this copyright note!

 This script featured on Dynamic Drive (http://www.dynamicdrive.com)
 Visit http://www.dynamicdrive.com for full source to this script and more
 ---------------------------------------------------------------------------
-->
<head>
 <base href="<%=basePath%>"/>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html;CHARSET=utf-8">
<TITLE>Outlook Like Bar</TITLE>

<!--
  you need this style or you will get an error in ns4 on first page load!
-->
<STYLE>
  div    {
         position:absolute;
         }
         body{
         font-size:12px;
         }
</STYLE>

<script type="text/javascript" src="js/crossbrowser.js" ></script>
<script type="text/javascript" src="js/outlook.js" >
</script>

<script type="text/javascript">

// ---------------------------------------------------------------------------
// Example of howto: use OutlookBar
// ---------------------------------------------------------------------------


  //create OutlookBar
  var o = new createOutlookBar('Bar',0,0,screenSize.width,screenSize.height,'#436372','white')//'#000099') // OutlookBar
  var p

  //create first panel
  p = new createPanel('al','Back Stage management System');
  p.addButton('images/icon/netm.gif','Data Management','parent.main.location="Search.action"');
  p.addButton('images/icon/news.gif','Register','parent.main.location="<%=basePath%>register.jsp"');
  p.addButton('images/icon/word.gif','Delete','parent.main.location="Delete.action"');
  p.addButton('images/icon/peditor.gif','Update','parent.main.location="update.jsp"');
  p.addButton('images/icon/mail.gif','Login','parent.main.location="login.jsp"');
  o.addPanel(p);
  
  p = new createPanel('p','数据管理');
  p.addButton('images/icon/mail.gif','Mail 2','alert("Mail2")');
  p.addButton('images/icon/peditor.gif','Personal<BR>Editor','alert("Personal Editor")');
  p.addButton('images/icon/word.gif','Projekte','aler("Projekte")');
  p.addButton('images/icon/news.gif','Adresse','alert("Adresse")');
  p.addButton('images/icon/mail.gif','Postausgang','alert("Postausgang")');
  p.addButton('images/icon/mail.gif','Posteingang','alert("Posteingang")');
  p.addButton('images/icon/news.gif','Information aus<BR>erster Hand','alert("Infos")');
  p.addButton('images/icon/peditor.gif','Gelbe Post','alert("Gelbe Post")');
  p.addButton('images/icon/word.gif','Schreiben','alert("Schreiben")');
  o.addPanel(p);

  p = new createPanel('l','积分管理');
  o.addPanel(p);

  p = new createPanel('l2','系统管理');
  o.addPanel(p);

  o.draw();         //draw the OutlookBar

//-----------------------------------------------------------------------------
//functions to manage window resize
//-----------------------------------------------------------------------------
//resize OP5 (test screenSize every 100ms)
function resize_op5() {
  if (bt.op5) {
    o.showPanel(o.aktPanel);
    var s = new createPageSize();
    if ((screenSize.width!=s.width) || (screenSize.height!=s.height)) {
      screenSize=new createPageSize();
      //need setTimeout or resize on window-maximize will not work correct!
      //ben鰐ige das setTimeout oder das Maximieren funktioniert nicht richtig
      setTimeout("o.resize(0,0,screenSize.width,screenSize.height)",100);
    }
    setTimeout("resize_op5()",100);
  }
}

//resize IE & NS (onResize event!)
function myOnResize() {
  if (bt.ie4 || bt.ie5 || bt.ns5) {
    var s=new createPageSize();
    o.resize(0,0,s.width,s.height);
  }
  else
    if (bt.ns4) location.reload();
}

</script>

</head>
<!-- need an onResize event to redraw outlookbar after pagesize changes! -->
<!-- OP5 does not support onResize event! use setTimeout every 100ms -->
<body onLoad="resize_op5();" onResize="myOnResize();">
</body>
</html>


