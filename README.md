# Web聊天室
----
*本项目是个人学习和练手JavaWeb的项目，主要学习并应用了以下知识：*

* 应用Spring+Struts2+Hibernate框架
* 前端使用Kindeditor web编辑器
* 通过Maven管理项目依赖的库
* 使用websocket实现实时通讯
* 使用Git进行版本管理
* 使用MarkDown编写说明文档
## 使用说明
>1. 将项目导入myEclipse（*开发用的myEclipse版本是2017 CI 10，自带Tomcat8.5*）；
>2. 在mysql创建数据库,命名为chatroom_db,在该数据库运行DB目录下的同名.sql文件恢复数据表。（*注意连接mysql的用户名和密码都是默认的，即用户名和密码都是root*）；
>3. 部署项目到Tomcat,在myEclipse运行项目的index.jsp文件或直接在浏览器地址栏输入相应地址（*如http://localhost:8080/ChatRoom2/index.jsp*）即可。
>4. 若报错，很有可能是Myeclipse自带的Maven远程仓库访问太慢导致无法导入所需jar包，可参考[国内Maven仓库--阿里云Aliyun仓库地址及设置][1]。
## 运行截图
![预览图1][2]
![预览图2][3]

  [1]: https://blog.csdn.net/dsblt001/article/details/79485668
  [2]: https://raw.githubusercontent.com/Treyoo/ChatRoom2/dev/src/main/webapp/images/preview1.png
  [3]: https://raw.githubusercontent.com/Treyoo/ChatRoom2/dev/src/main/webapp/images/preview2.png
