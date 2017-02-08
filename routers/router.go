package routers

import (
    "SST/controllers"
    "SST/controllers/admin"
    "SST/controllers/ssh"
    "SST/controllers/salt"
    "github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.MainController{})
    beego.Router("/login", &admin.LoginUserController{})
    beego.Router("/loginout", &admin.LogoutUserController{})

    beego.Router("/index", &admin.AdminController{})

    beego.Router("/ssh/index", &ssh.SshController{})

    beego.Router("/salt/ping", &salt.PingController{})
    beego.Router("/salt/keylist", &salt.KeyListController{})
    beego.Router("/salt/keydelete", &salt.KeyDeleteController{})
    beego.Router("/salt/keyaccept", &salt.KeyAcceptController{})
    beego.Router("/salt/cmdrun", &salt.CmdRunController{})
    beego.Router("/salt/cpgetfile", &salt.CpGetFileController{})
    beego.Router("/salt/deploy", &salt.DeployController{})
}
