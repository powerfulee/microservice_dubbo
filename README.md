SpringMVC+dubbo+zooKeeper+redis+elasticSearch实现的微服务博客
===
### 技术栈
~~~
java1.8, dubbox2.8.4, zookeeper3.4.6, elasticSearch2.4.1, redis2.8.13
~~~
![image](https://github.com/powerfulee/banking/raw/master/public/images/demo/backend.jpg)
~~~
### 开发环境
~~~
jdk1.8
eclipse4.7.3a
mysql v5.6
~~~
### 项目配置
~~~
后端数据库配置：backend/mysql.js，填写mysql服务器ip、用户名、密码、数据库名
前端接口配置：frontend/src/config/Global.js，如果使用手机真机访问，请将localhost改为ip地址
~~~
### 项目启动步骤
~~~
1、新建blogDB数据库，执行script目录中blogDB.sql脚本导入数据。
2、将etc（项目配置）目录放置在C盘根目录下，修改jdbc.properties文件中Mysql数据库服务器地址及连接帐号密码。修改config.xml文件，修改redis及elasticsearch的服务器地址密码。
3、修改provider项目spring-mvc.xml文件第41行zookeeper地址，运行com.skycentre.provider下的ServerStart.java，启动服务注册发现，成功后控制台出现server starting...，并且dubbo_admin将发现dubbo_provider服务。
~~~
![image](https://github.com/powerfulee/microservice/raw/master/public/images/demo/provider_1.jpg)
![image](https://github.com/powerfulee/microservice/raw/master/public/images/demo/provider_2.jpg)
~~~
4、修改cms项目spring-mvc.xml第111行zookeeper地址，frontend项目spring-mvc.xml第86行zookeeper地址。将cms,frontend工程放置tomcat容器启动，完成服务发现。
~~~
