# VulneraLab
该项目旨在提供一个可用于漏洞复现和分析研究的平台，使安全研究人员能够深入探讨漏洞细节并进行相关分析工作。

这是我的一个个人项目，出于热爱我将平时分析复现的漏洞搭建成了docker环境，提供给小伙伴们。





#### 使用方法

##### 1，安装docker

Windows系统下

参考链接 https://www.runoob.com/docker/windows-docker-install.html

Linux系统下

参考链接 https://www.runoob.com/docker/ubuntu-docker-install.html

推荐使用Ubuntu系统 snap一键安装docker

```
sudo snap install docker
```

##### 2，启用环境

```
# 下载项目
git clone https://github.com/Shelter1234/VulneraLab.git

cd VulneraLab

# 进入某一个漏洞/环境的目录
cd SpringBlade/CVE-2022-27360

# 启动整个环境
docker compose up -d
```

每个环境目录下都有相应的说明文件，请阅读该文件，进行漏洞/环境测试。

测试完成后，删除整个环境

```
docker compose -v
```

#### 讨论区

如果你在使用该项目的时候遇到了任何问题，或者建议，欢迎来交流，也期待你的加入。

个人微信：MakeItLast2024



**声明**

该项目会收集了当下比较流行的漏洞环境，若有侵权，请联系我们！
