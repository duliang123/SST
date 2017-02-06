<form class="form-horizontal" action="/salt/cpgetfile" method="post">
  <fieldset>
     <div class="form-group">
        <label class="col-sm-1 control-label" for="ds_username">目标主机</label>
        <div class="col-sm-11">
          <textarea class="form-control" name="tgt" type="textarea" rows="12" placeholder="请输入IP列表"></textarea>
        </div>
     </div>
     <div class="form-group">
       <label class="col-sm-1 control-label" for="ds_name">源文件</label>
       <div class="col-sm-3">
         <input class="form-control" name="sarg" type="text" placeholder="源文件路径/srv/salt/目录下 salt://" value="{{.sarg}}"/>
       </div>
       <label class="col-sm-2 control-label" for="ds_name">目标文件名</label>
       <div class="col-sm-5">
         <input class="form-control" name="darg" type="text" placeholder="目标文件路径 如: /root/readme.txt" value="{{.darg}}"/>
       </div>
     </div>
     <div class="form-group">
       <label class="col-sm-1 control-label"></label>
       <div class="col-sm-3">
         <button type="submit" class="btn btn-primary">执行下发</button>
       </div>
     </div>
     <div class="form-group">
        <label class="col-sm-1 control-label">返回结果</label>
        <div class="col-sm-11">
        <textarea class="form-control" name="return" type="textarea" rows="12">{{.return}}</textarea>
    </div>
  </fieldset>
</from>
