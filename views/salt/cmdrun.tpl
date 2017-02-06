<div class="form-horizontal" role="form">
  <fieldset>
     <div class="form-group">
        <label class="col-sm-1 control-label">主机列表</label>
        <div class="col-sm-3">
          <form action="/salt/cmdrun" method="post">
            <textarea class="form-control" name="tgt" type="textarea" rows="12" placeholder="请输入IP列表">{{.tgt}}</textarea>
            <input type="text" class="form-control" name="arg" value="{{.arg}}" style="margin:15px 30px 15px 0" placeholder="请输入命令">
            <button type="submit" class="btn btn-primary" style="margin:0px 30px 15px 0">执行</button>
          </form>
        </div>
        <label class="col-sm-1 control-label">返回结果</label>
        <div class="col-sm-7">
          <textarea class="form-control" name="return" type="textarea" rows="15">{{.return}}</textarea>
        </div>
     </div>
  </fieldset>
</div>
