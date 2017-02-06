<form class="form-horizontal" action="/salt/deploy" method="post">
  <fieldset>
     <div class="form-group">
        <label class="col-sm-1 control-label" for="ds_username">目标主机</label>
        <div class="col-sm-11">
          <textarea class="form-control" name="tgt" type="textarea" rows="5" placeholder="请输入IP列表">{{.tgt}}</textarea>
        </div>
     </div>
    <div class="form-group">
      <label class="col-sm-1 control-label">选择应用</label>
        <div class="col-sm-3">
          <select class="form-control" name="app" size="5">
            <option value="redis.install">redis</option>
          </select>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-1 control-label"></label>
        <div class="col-sm-3"><button type="submit" class="btn btn-primary">安装应用</button></div>
    </div>
    <div class="form-group">
      <label class="col-sm-1 control-label">返回结果</label>
      <div class="col-sm-11">
        <textarea class="form-control" name="return" type="textarea" rows="12">{{.return}}</textarea>
      </div>
    </div>
  </fieldset>
</div>
