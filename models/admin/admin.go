package admin

import (
    "errors"
    //"SST/models"

    "github.com/astaxie/beego"
    //"github.com/astaxie/beego/orm"
)

type Users struct {
    Id       int64
    Username string
    Password string
    Avatar   string
    Status   int
}

//登录
func LoginUser(username, password string) (err error, user Users) {

    var users Users
    if username == beego.AppConfig.String("loginuser") && password == beego.AppConfig.String("loginpasswd") {
        users.Id = 1
        users.Username = "duliang"
        users.Avatar = "ok"
    }else{
        err = errors.New("Error username or password!")
    }
    return err, users
}
