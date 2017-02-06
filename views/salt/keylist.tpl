<div class="form-horizontal" role="form">
  <fieldset>
     <div class="form-group">
        <label class="col-sm-1 control-label">已认证</label>
        <div class="col-sm-3">
          <form action="/salt/keydelete" method="get">
            <select class="form-control" name="match" size="15">
            {{range .minions}} 
              <option>{{.}}</option>
            {{end}}
            </select>
            <button type="submit" class="btn btn-primary" style="margin:15px 30px 15px 0">删除认证</button>
          </form>
        </div>
        <label class="col-sm-1 control-label">待认证</label>
        <div class="col-sm-3">
          <form action="/salt/keyaccept" method="get">
            <select class="form-control" name="match" size="15">
            {{range .minions_pre}}
              <option>{{.}}</option>
            {{end}}
            </select>
            <button type="submit" class="btn btn-primary" style="margin:15px 30px 15px 0">接受认证</button>
          </form>
        </div>
     </div>
  </fieldset>
</div>
