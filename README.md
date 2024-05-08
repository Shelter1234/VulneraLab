# VulneraLab
  该项目收集了很多厂商产品CMS的漏洞环境，以web为主。漏洞环境主要以Dockerfile的文件形式呈现，用户只需一键启动相应漏斗环境，使用项目文章中提供的poc，便可进行复现。漏洞环境收集于官网提供的docker环境，或者由本人下载源码在本地搭建docker环境运行。由于github有上传限制Dockerfile 及相应源码无法上传，所以我将靶场环境上传到了dockerhub官网上，用户只需拉取对应docker本地启动即可。除此之外，文档参考提供了对应的漏洞研究分析文章供大家参考观看，这是我个人的csdn博客，,欢迎大家留言评论（拙作，望请拨忙斧正，不胜感谢！）。






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
