<ul class="nav nav-tabs" role="tablist" id="myTab">
  <li role="presentation" class="active"><a href="#home" role="tab" data-toggle="tab">添加主机</a></li>
  <li role="presentation"><a href="/ssh/index"  role="tab" >主机列表</a></li>
</ul>

<div class="tab-content">
  <div role="tabpanel" class="tab-pane active" id="home" style="margin: 30px 0">
    <form class="form-inline" role="form" action="/ssh/add" method="post">
      <div class="form-group">
        <label class="sr-only" for="ip">host ip</label>
        <input type="text" class="form-control" name="ip" id="ip" placeholder="主机IP">
      </div>
      <div class="form-group">
        <label class="sr-only" for="port">port</label>
        <input type="text" size="5" class="form-control" name="port" id="port" value="22" placeholder="22">
      </div>
      <div class="form-group">
        <label class="sr-only" for="user">user</label>
        <input type="text" size="5" class="form-control" name="user" id="user" value="root" placeholder="root">
      </div>
      <div class="form-group">
        <label class="sr-only" for="password">password</label>
        <input type="password" class="form-control" name="password" id="password" placeholder="密码(空自动生成)">
      </div>
      <button type="submit" class="btn btn-primary">添加</button>
    </form>
  </div>
  <div role="tabpanel" class="tab-pane" id="profile">...</div>
</div>


