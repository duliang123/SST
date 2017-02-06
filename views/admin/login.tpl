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
    <link href="/static/css/login.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="/static/js/html5shiv.min.js"></script>
      <script src="/static/js/respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="loginBg">
    <div class="container">
      <form class="form-login" id="form-login" action="/login" method="post">
        <div class="header">
          <h1 class="title">{{.culture}}</h1>
          <div class="subtitle">《{{.title}}》</div>
          <div class="wrap">
            <input type="text" class="form-control" name="username" placeholder="请填写用户名" autofocus>
            <input type="password" class="form-control" name="password" placeholder="请填写密码">
            <button class="btn btn-primary btn-block" type="submit"> 登录</button>
          </div>
        </div>
      </form>
    </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/static/js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/jquery.validate.js"></script>
    <script src="/static/js/custom.js"></script>
  </body>
</html>
