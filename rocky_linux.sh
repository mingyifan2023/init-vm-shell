

# 用备份来解决错误修改的问题
# 1. 将密钥专门放到单独的一个地方
# 2. 然后专门引用时专门去引用那里就可以解决错误生成和错误引用的问题

#  专门用来维护的密钥目录
mkdir /home/mojoru/keys/id_rsa

#   # 1. client (windows or linux )
ssh-keygen -t rsa -b 4096 -f /home/mojoru/keys/id_rsa



# 用别名来禁止某个命令或某个命令的语句

#bash 
~/.bashrc或~/.bash_profile，
alias ssh-keygen ="控制创建密钥权限，兄弟先想一想吧"
# 配置下


alias ssh-keygen ="控制创建密钥权限，兄弟先想一想吧"
source ~/.bashrc或~/.bash_profile，



# zsh



~/.bashrc或~/.bash_profile，
alias ssh-keygen ="控制创建密钥权限，兄弟先想一想吧"
# 配置下
source ~/.bashrc或~/.bash_profile，






#  引用备份的公钥，来上传到目标服务器
ssh-copy-id -i /home/mojoru/keys/id_rsa/id_rsa.pub  root@serverIP

# 1.ssh-keygen
# 2. install zsh tmux docker docker-compose  
# 3. 专门使用 docker安装的mysql，mongodb，nginx 




# ssh-keygen -t rsa -b 4096

# # 用cat命令查看是否生成产生公钥私钥对

# ls -Rl /root/.ssh
# #- id_rsa---->private key
# #- id_rsa.pub---->public key

# #第二步:用ssh-copy-id将公钥复制到远程机器中 (from client)
#  ssh-copy-id -i /root/.ssh/id_rsa.pub  root@serverIP
#  # 注意: ssh-copy-id 将key写到远程机器的 ~/ .ssh/authorized_key.文件中

#  # 这里假定服务器还可以使用密码登录。当时添加公钥之后，就要修改ssh服务的配置文件。取消密码登录，只能用证书登陆
#  # 并重启ssh服务
#  vim /etc/ssh/sshd_config
#  PasswordAuthentication no
# RSAAuthentication yes
# PubkeyAuthentication yes
# service sshd restart

# # 第三步: 登录到远程机器不用输入密码

# # client : linux
# ssh root@serverIP

# # client : windows
# ssh -i id_rsa root@serverIP




# 开始部署

#  先给bash上保护措施 ok 


echo alias ssh-keygen="控制创建密钥权限，兄弟先想一想吧" >> ~/.bashrc
source ~/.bashrc




# 然后在安装zsh之后，再给zsh上保护措施 ok 





clear
echo
echo "#############################################################"
echo "#install zsh                                                #"
echo

# https://blog.csdn.net/qierkang/article/details/85941316
 echo $SHELL;
 cat /etc/shells ;
 yum -y install zsh;
 chsh -s /bin/zsh;
 yum install -y wget git ;
 wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh;


cd ~/.oh-my-zsh/plugins;
wget http://mimosa-pudica.net/src/incr-0.2.zsh;
source incr*.zsh;


cd ~/.oh-my-zsh/plugins;
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions;

sed -i 's\robbyrussell\cypher\g' ~/.zshrc;
sed -i 's\(git)\(git history history-substring-search node npm wd web-search last-working-dir zsh-autosuggestions)\g' ~/.zshrc;



# 然后在安装zsh之后，再给zsh上保护措施 ok 

echo alias ssh-keygen="控制创建密钥权限，兄弟先想一想吧" >> ~/.zshrc
source ~/.zshrc




clear
echo
echo "#############################################################"
echo "#install tmux                                               #"
echo
 

 yum install tmux -y;


clear
echo
echo "#############################################################"
echo "#install docker                                            #"
echo
 

uname -r;
yum -y update;
yum -y upgrade;
yum remove docker  docker-common docker-selinux docker-engine;
yum install -y yum-utils device-mapper-persistent-data lvm2;

yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo;


yum list docker-ce --showduplicates | sort -r;
yum -y install docker-ce;
systemctl start docker;
systemctl enable docker;
docker  version;



yum install -y net-tools



clear
echo
echo "#############################################################"
echo "#install golang                                             #"
echo
 
wget  https://go.dev/dl/go1.19.3.linux-amd64.tar.gz;
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.3.linux-amd64.tar.gz;
export PATH=$PATH:/usr/local/go/bin;
go version;



clear
echo
echo "#############################################################"
echo "#install nginx                                              #"
echo

yum install -y nginx 


systemctl enable nginx 
systemctl start nginx 



# 开放一些端口

systemctl restart firewalld;
sudo firewall-cmd --add-service=http --permanent;
sudo firewall-cmd --add-service=https --permanent;
sudo firewall-cmd --add-port=80/tcp --permanent; # nginx


sudo firewall-cmd --reload;
sudo firewall-cmd --list-ports;
