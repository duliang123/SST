# SST运维作业平台

-- 基于GO语言和Saltstack开发的WEB运维平台 author:duliang


### 说明:

1. GO语言开发，无部署运行，OS版本: CentOS 6+ x86_64；

2. 基于Saltstack，需要安装salt相关组件。

3. 两种模式(ssh与salt)均支持并发执行远程命令，问题反馈: QQ 5918983


### 配置:

1. 平台登陆账号配置

2. salt-apit配置

修改文件: vi conf/app.conf 

    title = "SST运维作业平台"
    culture = "-- 简单 . 高效 . 自动化 --"

    appname = SST
    httpport = 8080
    runmode = dev

    sessionon = true

    loginuser = duliang123 #平台Web登陆账号
    loginpasswd = duliang  #平台登陆密码 


    salt_url      = https://127.0.0.1:8000/login #salt-api登陆地址
    salt_username = salt_u_duliang
    salt_password = DLpasswd
    salt_api_url  = https://127.0.0.1:8000       #salt-api数据GET|POST地址

### 运行:
cd SST && ./SST &


**鸣谢：**
雨落寒冰(北京) 曦晨(苏州)


![image](https://github.com/duliang123/SST/blob/master/screenshot/screenshot.jpg)
![image](https://github.com/duliang123/SST/blob/master/screenshot/screenshot2.jpg)
![image](https://github.com/duliang123/SST/blob/master/screenshot/screenshot3.jpg)
