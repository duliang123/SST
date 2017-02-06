<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{.title}}</title>
    <meta name="keywords" content="{{.title}}">
    <meta name="description" content="{{.title}}">
    <!-- Bootstrap -->
    <link href="/static/css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="/static/css/font-awesome/font-awesome.min.css" rel="stylesheet">
    <link href="/static/css/base.css" rel="stylesheet">
    <link href="/static/css/app_theme.css" rel="stylesheet">
    <link href="/static/css/ijobs.css" rel="stylesheet">
    <link href="/static/css/custom.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="/static/js/html5shiv.min.js"></script>
      <script src="/static/js/respond.min.js"></script>
    <![endif]-->
  </head>
  <body style="background-color:#fafafa;position:relative;">
    <!-- 封面 -->
    <div id="cover" style="z-index:3000;position: fixed;top:0;left:0;height:100%;width:100%;text-align: center;display: none;">
      <div style="width:100%;height:100%;background: #000;opacity: 0.5;"></div>
      <img src="./img/cover.png" style="position: fixed;top:60px;left:50%;width:900px;height:600px;margin-left:-450px;"/>
      <a class="king-btn king-btn-icon king-round king-default" title="关闭" style="position: fixed;top:80px;left:50%;margin-left:400px;" id="coverClose">
               <i class="fa fa-close btn-icon"></i>
          </a>
    </div>
    <!-- 封面 end -->
    <header class="king-main-header" style="z-index:2995;">
      <div style="width:230px;" class="pull-left">
        <a class="logo" href="/index">
          <img alt="" src="./img/ijobs.png">
          <span class="logo-lg">{{.title}}</span>
        </a>
        <a class="navbar-minimalize  pull-right" href="#" style="font-size:22px;min-width:20px;padding:12px 0;height:44px;"></a>
      </div>
      <nav class="navbar">
        <div class="king-business-select pull-left dropdown ml20">
            <span>当前版本: Beta1.0 </span>
            <span><input name="author" value="程序开发：Duliang"  readonly="true" style="height: 34px;width: 248px;border: none;border: 1px solid #4A9BFF;padding: 0 10px" /></span>
        </div>
        <div class="navbar-custom-menu">
          <ul class="nav navbar-nav">
            <li>
               <a href="javascript:void(0);" class="">
               <span>当前登录用户:admin</span>
               </a>
            </li> 
            <li class="dropdown">
              <a aria-expanded="false" aria-haspopup="true" role="button" data-toggle="dropdown" class="dropdown-toggle" href="#" id="drop4">帮助中心
                <span class="caret"></span>
              </a>
              <ul aria-labelledby="drop4" class="dropdown-menu" id="menu1">
                <li><a href="javascript:;" id="menu1-instruction">平台介绍</a></li>
                <li><a href="/loginout" id="menu1-logout">注销</a></li>
              </ul>
            </li>  
          </ul>
        </div>
      </nav>
    </header>

    <div class="king-layout6-main">
    <!-- 左边 start -->
      <div class="king-layout6-sidebar" style=" background:#293038">
        <section class="king-sidebar" style="height: auto;">
          <ul class="king-sidebar-menu">
            <li class="treeview ">
              <a href="#">
                <i class="fa fa-calendar-o"></i>
                <span>SSH模式</span>
                <span class="fa fa-angle-right pull-right"></span>
              </a>
              <ul class="treeview-menu" style="background: #1C2026;">
                <li><a href="/index"><i class="fa"></i>管理首页</a></li>
                <!--<li><a href="/ssh/add"><i class="fa"></i>添加主机</a></li> -->
                <li><a href="/ssh/index"><i class="fa"></i>执行命令</a></li>
              </ul>
            </li>
            <li class="treeview ">
              <a href="#">
                <i class="fa fa-calendar-o"></i>
                <span>运维模式</span>
                <span class="fa fa-angle-right pull-right"></span>
              </a>
              <ul class="treeview-menu" style="background: #1C2026;">
                <li><a href="/salt/keylist"><i class="fa"></i>minion端配置</a></li>
                <li><a href="/salt/ping"><i class="fa"></i>当前联机状态</a></li> 
                <li><a href="/salt/cmdrun"><i class="fa"></i>批量分发命令</a></li>
                <li><a href="/salt/cpgetfile"><i class="fa"></i>快速分发脚本</a></li>
                <li><a href="/salt/deploy"><i class="fa"></i>自动部署应用</a></li>
              </ul>
            </li>
          </ul>
        </section>
      </div>
      <!-- 左边 end -->
      <!-- 右边 start -->
      <div class="king-layout6-content">
         <section style="padding:0 15px">
            <ol class="breadcrumb" style="margin-bottom:0;border-bottom:1px solid #eee;background:none;border-radius:0;padding-left:5px;">
              <li id='breadcrumb-2'><i class="fa fa-dashboard"></i> <a href="/index">后台首页</a></li>
              <li id='breadcrumb-3'>{{.navtitle}}</li>
            </ol>
          </section>
          <section class="king-content" id="king-content1">
            <div class="panel panel-default ijobs-innerbox" style="padding:20px;min-height:300px;">{{.LayoutContent}}</div>
          </section>
      </div>
      <!-- 右边 end -->

    </div>
    <section class="section-copyright">{{.culture}}</section>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/static/js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/jquery.validate.js"></script>
    <script src="/static/js/app.js"></script>
    <script src="/static/js/common.js"></script>
    <script src="/static/js/custom.js"></script>
  </body>
</html>
