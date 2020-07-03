==========================
Configuration File Options
==========================

:Official documents:
https://redmine.lighttpd.net/projects/lighttpd/wiki/Docs_ConfigurationOptions

<aewnfin>
-------------
Lighttpd Core
-------------

# FastCGI
server.modules += ("mod_fastcgi")
fastcgi.server
fastcgi.balance =("fair"|"least-connection"|"round-robin"|"hash"|"sticky")
fastcgi.debug = (0|1)
fastcgi.map-extensions = ( ".php3" => ".php", ".php4" => ".php" )

# streaming渐进式下载流
server.modules += ("mod_secdownload")
server.modules += ("mod_flv_streaming")
flv-streaming.extensions =(".flv")


# 虚拟主机
“mod_evhost”-增强型虚拟主机
  %% => % 符号
  %0 => 域名 + TLD
  %1 => tld
  %2 => 没有 tld 的域名
  %3 => 子域 1 名称
  %4 => 子域 2 名称
  %_ => 完整域名
  %{M.N} =>域段 %M 中在索引位置 N 处的单个字符（从1.4.43开始）
使用替换通配符以优先于 server.document-root 构建 documentroot
$HTTP ["host"] =~ "users\.example\.org" {
    evhost.path-pattern = "/home/%4/public_html/"
    server.document-root = "/home/user/sites/default/site" 
}

“mod_vhostdb”-虚拟主机数据库
状态：实验性
“mod_mysql_vhost”-基于MySQL的虚拟主机
可以将给定主机的文档根目录的路径存储在MySQL数据库中
注意：请记住，一次只能激活一个虚拟主机模块。不要将mod_simple_vhost与mod_mysql_vhost混合使用。

“mod_setenv”-条件请求头
允许影响外部应用程序的环境以及服务器发送给客户端的响应头

例如：使浏览器自动解压 gzip 压缩的 ‘文本文件’
$HTTP ["url"] =~ "(README|ChangeLog|\.txt)\.gz$" {
    setenv.add-response-header =("Content-Encoding" => "gzip")
    mimetype.assign =("" =>"text/plain")
}

“mod_simple_vhost”-简单的虚拟主机

simple-vhost.document-root 文档根 覆盖 server.document-root
simple-vhost.server-root 服务器根
simple-vhost.default-host 主机名
simple-vhost.debug

要将条件条件与simple-vhost一起使用，应执行以下操作：
```
$HTTP ["host"] != "news.example.org" { 
    simple-vhost.server-root = "/var/www/servers/" 
    simple-vhost.default-host = "example.org"
    simple-vhost.document-root = "pages"
} 
$HTTP ["host"] == "news.example.org" { 
    server.document-root = "/var/www/servers/news2.example.org/pages/"
}
```
# 自定义404页面
静态/动态错误页 = 默认返回 200 ok
server.error-handler-404 = "/error-404.php"
`server.error-handler` 捕获所有HTTP状态> = 400并将HTTP状态保留在返回的静态文件中

仅-静态错误页-前缀
server.errorfile-prefix = "/srv/www/htdocs/errors/status-"

在目录/ srv / www / htdocs / errors中创建静态页面以进行错误处理:
/srv/www/htdocs/errors/status-404.html
/srv/www/htdocs/errors/status-500.html
/srv/www/htdocs/errors/status-501.html

# 模块mod_dirlisting-目录列表
如果请求目录并且在该目录中找不到索引文件，则生成目录列表

要全局启用目录列表：
dir-listing.activate = "enable"
如果只需要一个或多个特定目录，则使用条件：
$HTTP["url"] =~ "^/download($|/)" {
     dir-listing.activate = "enable" 
   }

# HTTP-Redirection
“mod_redirect”-URL重定向
url.redirect

# URL-Rewriting
“mod_rewrite”-内部重定向，URL重写
url.rewrite-once
url.rewrite-repeat

# output-compression 压缩
“mod_compress”-缓存静态文件压缩输出

“mod_deflate”-压缩静态或动态的任何输出

---

磁盘文件传输-缓冲开关
server.network-backend = “writev”

