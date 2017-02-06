<form class="form-horizontal" action="/salt/ping" method="post">
  <fieldset>
     <div class="form-group">
        <label class="col-sm-1 control-label">主机列表</label>
        <div class="col-sm-3">
           <textarea class="form-control" name="tgt" type="textarea" rows="12" placeholder="*">{{.tgt}}</textarea>
        </div>
        <div class="col-sm-1">
          <button type="submit" class="btn btn-primary">查询</button>
        </div>
        <label class="col-sm-1 control-label">联机状态</label>
        <div class="col-sm-5">
           <textarea class="form-control" name="testping" type="textarea" rows="12">{{.testping}}</textarea>
        </div>
     </div>
     <!--<div class="form-group">
        <label class="col-sm-2 control-label" for="ds_username">用户名</label>
        <div class="col-sm-4">
           <input class="form-control" id="ds_username" type="text" placeholder="root"/>
        </div>
        <label class="col-sm-2 control-label" for="ds_password">密码</label>
        <div class="col-sm-4">
           <input class="form-control" id="ds_password" type="password" placeholder="123456"/>
        </div>
     </div>-->
  </fieldset> 
</form>
