package ssh

import (
    "fmt"
     _ "io"
    "bytes"
    "strings"
    "time"
    "golang.org/x/crypto/ssh"
    "SST/controllers"
    "github.com/astaxie/beego"

    "sync"
)

var j = 0
var m map[string]string

//ssh主机列表
type SshController struct {
    controllers.BaseController
}

func (this *SshController) Get() {

    this.Data["title"] = beego.AppConfig.String("title")
    this.Data["culture"] = beego.AppConfig.String("culture")
    this.Data["navtitle"] = "主机列表"
    this.Layout = "admin/layout.tpl"
    this.TplName = "ssh/index.tpl"
}


func ssh_cmd(ip_port, user, password, ip, cmd string, wg *sync.WaitGroup) {
    defer wg.Done() 
    Conf := ssh.ClientConfig{User: user, Auth: []ssh.AuthMethod{ssh.Password(password)}}
    Client, err := ssh.Dial("tcp", ip_port, &Conf)
    if err != nil {
        fmt.Println(err)
        return
    }
    defer Client.Close()
    if session, err := Client.NewSession(); err == nil {
        defer session.Close()
        j = j+1
        buf, _ := session.CombinedOutput(cmd)
        m[ip] = string(buf)
    }
}


func (this *SshController) Post(){
    iplist := this.GetString("iplist")
    tmp := strings.Split(iplist, "\n")
    cmd := this.GetString("cmd")
    m = make(map[string]string)
    start := time.Now()

    wg := sync.WaitGroup{}
    wg.Add(len(tmp))

    for i := 0; i < len(tmp); i++ {
        if len(tmp[i]) != 0 {
            split := strings.Split(tmp[i], ":")

            var ip_port string
            ip_port   = fmt.Sprintf("%s:%s",split[0],split[1]) //"ip:22" fmt.Sprintf("%s:%s",split[0],split[1])
            user     := split[2]
            password := strings.TrimSpace(split[3])
        
            go ssh_cmd(ip_port, user, password, split[0], cmd, &wg)
        }
    }
    wg.Wait()
    fmt.Println(len(tmp))
    var ret bytes.Buffer
    for k, v := range m {
        fmt.Println(k,":",v)
        ret.WriteString(fmt.Sprintf("%s\n%s", k, v))
        ret.WriteString(fmt.Sprintf("------------------------------\n"))
    }
    
    runtime := time.Now().Sub(start).Seconds()
    get_j := j
    j = 0

    this.Data["title"] = beego.AppConfig.String("title")
    this.Data["culture"] = beego.AppConfig.String("culture")
    this.Data["navtitle"] = "执行命令"
    this.Data["iplist"] = iplist
    this.Data["rcmd"] = ret.String()
    this.Data["tips"] = fmt.Sprintf("%s 主机数:%d 执行时间:%ds", cmd, get_j, int(runtime))
    this.Data["runtime"] = runtime
    this.Layout = "admin/layout.tpl"
    this.TplName = "ssh/index.tpl"
}

