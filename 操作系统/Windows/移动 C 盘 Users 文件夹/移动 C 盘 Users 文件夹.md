---
toc:
    depth_from: 2
---

@import "style.css"

# 移动 C 盘下的 Users 文件夹

<div id="tags" style="text-align: right;">
<img src="../../../log/魔术师.svg" height="30">
<img src="../../../log/气球狗.svg" height="30">
<img src="../../../log/兔子.svg" height="30">
</div>

[TOC]

## 概述
&emsp;在用户处于登录状态下时， “Users 文件夹” 被系统所使用，而无法被正常移动。请登录管理员账户，执行以下命令后注销，在登录界面点击 <img src="img\轻松访问.png" height="20"> “轻松访问”

```javascript {cmd="node"}
var util= require('util');
//var encoder_utf8 = new util.TextEncoder('utf-8');
//let gbkdecoder = new util.TextDecoder();

var iconv = require('iconv-lite');
var encoding = 'cp936';
var binaryEncoding = 'binary';

//child_process.exec('svn log', { encoding: binaryEncoding }, function(err, stdout, stderr){
//    console.log(iconv.decode(new Buffer(stdout, binaryEncoding), encoding), iconv.decode(new Buffer(stderr, binaryEncoding), encoding));
//})

var child_process=require("child_process");
child_process.execFile("test.bat",null,{cwd:'C:\\Users\\bjiang\\Documents\\workspace\\helper\\操作系统\\Windows\\移动 C 盘 Users 文件夹',encoding:'gbk'},function(error,stdout,stderr){
    if(error !==null){
        console.log("exec error"+error)
    }
    else console.log("成功")
    console.log('stdout: ' + iconv.decode(new Buffer(stdout, binaryEncoding), encoding));
    console.log('stderr: ' + stderr);
})
```
```javascript {cmd="node"}
var child_process = require('child_process');
var iconv = require('iconv-lite');
var encoding = 'cp936';
var binaryEncoding = 'binary';

child_process.exec('ipconfig', { encoding: binaryEncoding }, function(err, stdout, stderr){
    console.log(iconv.decode(new Buffer(stdout, binaryEncoding), encoding), iconv.decode(new Buffer(stderr, binaryEncoding), encoding));
});
```