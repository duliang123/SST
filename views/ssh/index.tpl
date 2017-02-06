<ul class="nav nav-tabs" id="myTab">
  <li class="active"><a href="#home">主机列表</a></li>
  <!--<li> <a href="/ssh/add" >添加主机</a></li>-->
</ul>

<div class="tab-content">
  <div role="tabpanel" class="tab-pane active" id="home" style="margin: 30px 0">
<table border="0">
<form  role="form" action="/ssh/index" method="post">
  <tr>
    <td width="300px">
      <textarea class="form-control" rows="3" name="iplist" id="iplist" placeholder="IP:端口:账号:密码" style="width:300px;height:400px;">{{.iplist}}</textarea></td>
    <td style="padding:0 30px;align:left;vertical-align: top;">
      <input type="text" style="width:300px" class="form-control" name="cmd" id="cmd" value="" placeholder="">
      <button type="submit" class="btn btn-primary" style="margin:15px 30px 15px 0">执行</button>
      {{.tips}}</br>
      <textarea class="form-control" style="width:600px;height:300px">{{.rcmd}}</textarea> 
    </td>
  </tr>
</form>
</table>
  </div>
  <div role="tabpanel" class="tab-pane" id="profile">...</div>
</div>


