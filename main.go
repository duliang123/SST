package main

import (
    _ "SST/routers"
    "github.com/astaxie/beego"
    "github.com/astaxie/beego/context" 
)

func main() {
    beego.SetStaticPath("/down", "download")  
    //验证用户是否已经登录, 应用于全部的请求.
    beego.InsertFilter("/*", beego.BeforeRouter, FilterUser)
    beego.Run()
}

var FilterUser = func(ctx *context.Context) {
    _, ok := ctx.Input.Session("userLogin").(string)
    if !ok && ctx.Request.RequestURI != "/login" {
        ctx.Redirect(302, "/login")
    }
}
