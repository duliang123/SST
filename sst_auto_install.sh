#!/bin/bash

SST_PROC(){
cat << EOF >> /etc/init.d/sstd
#!/bin/sh
# chkconfig:   2345 90 10

sst_home=/usr/local/SST
sstname=/usr/local/SST/SST

status(){
ps -ef|grep SST|grep -v grep &>/dev/null
if [ \$? = 0 ];then
echo "SST is running."
else
echo "SST  is stopped."
fi
}

start(){
cd \$sst_home
./SST &
echo "SST runnins ok."
}

stop(){
killall \$sstname
echo "SST stop ok."
}

case "\$1" in
    start|stop|restart)
        \$1
        ;;
    status)
        status
        ;;
    start)
        start
        ;;
    stop)
        stop
        ;;
        *)
        echo \$"Usage: \$0 {start|stop|status}"
        exit 1
esac
EOF

chmod a+x /etc/init.d/sstd
/sbin/chkconfig --add sstd
/sbin/chkconfig sstd on

}

RUNSST(){
#service salt-minion stop &>/dev/null
#rpm -e salt-minion &>/dev/null
service salt-master restart
/etc/rc.d/init.d/salt-api start
/sbin/chkconfig salt-api on
if [ $? != 0 ];then
/etc/rc.d/init.d/salt-api restart
fi
chkconfig --add salt-master
SST_PROC
ps -ef |grep salt-master
ps -ef |grep salt-api
ps -ef|grep SST
echo ""
echo "SST运维作业平台、stal-master已安装启动成功！！！"
sstuser=`cat /usr/local/SST/conf/app.conf|awk '/loginuser/{print $3}'`
sstpass=`cat /usr/local/SST/conf/app.conf|awk '/loginpasswd/{print $3}'`
read -p "打开 http://$ipadd:8080  用户名/密码：$sstuser/$sstpass"
clear

}


CK(){
echo "开始生成自签名证书，请稍等......"
echo ""
echo "master: $ipadd" >> /etc/salt/minion
echo "id: test" >> /etc/salt/minion
sed -i '/#log_file/s/^#//' /etc/salt/minion
sed -i '/#key_logfile/s/^#//' /etc/salt/minion
service salt-master restart &>/dev/null
service salt-minion restart &>/dev/null
service salt-api start &>/dev/null
salt-key -L &>/dev/null
salt-call tls.create_self_signed_cert
if [ $? != 0 ];then
salt-call tls.create_self_signed_cert
fi
read -t 4 -p "证书生成完毕。"
clear
}

minion_install(){
clear
rpm -ql salt-minion >/dev/null
if [ $? = 0 ];then
read -p "salt-minion 已经安装，可直接进行操作！"
return
fi
yum install -y epel-release
yum install -y python python26 python-jinja2 salt-minion
if [ ! -s /etc/rc.d/init.d/salt-minion ];then
clear
read -t 5 -p "安装没有成功，请检查！"
return
fi
read -p "设置master IP：" serverip
sed -i '/#master/s/^#//' /etc/salt/minion
sed -i "/^master:/s/salt/$serverip/" /etc/salt/minion
read -p "设定客户端名称编号：" clientip
sed -i '/#id/s/^#//' /etc/salt/minion
sed -i "/^id/s/id:/id: $clientip/" /etc/salt/minion
sed -i '/#log_file/s/^#//' /etc/salt/minion
sed -i '/#key_logfile/s/^#//' /etc/salt/minion
service iptables status &>/dev/null
if [ $? = 0 ];then
iptables -I INPUT -p tcp --dport 4506 -j ACCEPT
iptables -I INPUT -p udp --dport 4506 -j ACCEPT
service iptables save
fi
service salt-minion restart
chkconfig --add salt-minion
ps -ef|grep salt-minion
read -t 5 -p "salt-minion已安装启动成功！！！"
clear
}


master_install(){
clear
rpm -ql salt-master > /dev/null
if [ $? = 0 ];then
read -t 5 -p "salt-master 已经安装，可直接进行操作！"
return
fi
yum install -y epel-release
yum install -y git python python26 python-jinja2 salt-master salt-api salt-minion pyOpenSSL
if [ ! -s /etc/rc.d/init.d/salt-master ];then
clear
read -t 5 -p "安装没有成功，请检查！"
return
fi
service iptables status &>/dev/null
if [ $? = 0 ];then
iptables -I INPUT -p tcp --dport 4505 -j ACCEPT
iptables -I INPUT -p udp --dport 4505 -j ACCEPT
iptables -I INPUT -p udp --dport 8080 -j ACCEPT
iptables -I INPUT -p udp --dport 8000 -j ACCEPT
service iptables save
fi
sed -i '/#interface/s/^#//' /etc/salt/master
ipnum=`ifconfig |grep "inet addr"|sed -n 1p|awk -F: '{print $2}'|awk '{print $1}'`
sed -i "/interface/s/0.0.0.0/$ipnum/" /etc/salt/master
sed -i '/#auto_accept/s/^#//' /etc/salt/master
sed -i '/auto_accept/s/False/True/' /etc/salt/master
sed -i '/#log_file/s/^#//' /etc/salt/master
sed -i '/#key_logfile/s/^#//' /etc/salt/master
sed -i '/#default_include/s/#default/default/g' /etc/salt/master
[ ! -d /etc/salt/master.d ] && mkdir /etc/salt/master.d
cat /etc/passwd|grep saltss &>/dev/null
if [ $? != 0 ];then
useradd -M -s /sbin/nologin saltss
echo "saltss123" | passwd saltss --stdin
fi
cat << EOF > /etc/salt/master.d/api.conf
rest_cherrypy:
  port: 8000
  ssl_crt: /etc/pki/tls/certs/localhost.crt
  ssl_key: /etc/pki/tls/certs/localhost.key
EOF
cat << EOF > /etc/salt/master.d/eauth.conf
external_auth:
  pam:
    saltss:
      - .*
      - '@wheel'
      - '@runner'
EOF

clear
ipnum=`ip ad|grep global|awk -F"[ /]+" '{print $3}'|wc -l`
if [ $ipnum = 1 ];then
ipadd=`ip ad|grep global|awk -F"[ /]+" '{print $3}'`
CK
cd /usr/local
git config --global http.postBuffer 24288000
git clone https://github.com/duliang123/SST.git
chmod a+x SST/SST
sed -i "s/127.0.0.1/$ipadd/g" /usr/local/SST/conf/app.conf
sed -i "/salt_username/d" /usr/local/SST/conf/app.conf
sed -i "/salt_password/d" /usr/local/SST/conf/app.conf
echo "salt_username = saltss" >> /usr/local/SST/conf/app.conf
echo "salt_password = saltss123" >> /usr/local/SST/conf/app.conf

cd /usr/local/SST
./SST &
RUNSST
else
ip ad|grep global|awk -F"[ /]+" '{print $3}'
read -p "系统有多个IP地址，请选择： " ipadd
CK
cd /usr/local
git clone https://github.com/duliang123/SST.git
chmod a+x SST/SST
sed -i "s/127.0.0.1/$ipadd/g" /usr/local/SST/conf/app.conf
sed -i "/salt_username/d" /usr/local/SST/conf/app.conf
sed -i "/salt_password/d" /usr/local/SST/conf/app.conf
echo "salt_username = saltss" >> /usr/local/SST/conf/app.conf
echo "salt_password = saltss123" >> /usr/local/SST/conf/app.conf
cd /usr/local/SST
./SST &
RUNSST

fi

}




while true
clear
cat << EOF
********************************************************
*                                                      *
*   集成安装配置SST维作业平台、salt-master\minion\api  *
*                                                      *
*   1、安装配置SST平台\salt-master\api                 *
*   2、安装配置minion                                  *
*   0、exit                                            *
*                                                      *
********************************************************
EOF
read -p "请输入相应的选择项：" num
do
case $num in
1)
master_install
;;
2)
minion_install
;;
0)
clear
exit
;;
esac
done

