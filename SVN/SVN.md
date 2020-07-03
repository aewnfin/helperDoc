# SVN 更新部署流程
—— SVN 更新部署流程涉及 **开发人员** **运维人员**

子流程：
- 上传（开发人员）
- 部署（运维人员）



<div STYLE="page-break-after:always"><div>



## 上传

上传子流程涉及实体：
- 代码文件
- 图形化界面Ⅰ
- 邮件
- 操作步骤
    - 填报 SVN 提交请求
    - 发送邮件

### 代码文件
部署至外网 80.xx：
- `QSrule\Public\home\yq\src\xc\xxx.class.php` 单个文件
- `Dmgmt\` 文件夹下所有文件

部署至内网 5.xx：
- `QSrule\Application\Home\View\Vision\indexNew.html` 单个文件
- `QSrule\` 文件夹下所有文件


### 图形化界面Ⅰ
—— 图像化界面内包含各种 **<元件>**
    ![图形化界面1](svn-img\图形化界面1.png)
> **图像化界面Ⅰ**
>
> - 开发人员，在内网请打开 [内网文件夹](//192.168.11.2/operations/SVN/Debug-dev) 并保存至 **本地** ，以使用 SVN.exe
> - 开发人员，在外网请打开 **本地** 的 SVN.exe

### 操作步骤
&emsp;&emsp;例举，在 **外网** 提交 `QSrule\Public\home\yq\src\xc\` 文件夹下所有文件至 SVN
```xml
<!-- 由当前网段确定下拉选项 比如在外网 -->
<!-- 联通 SVN -->
//下拉选择 “外网” ；确认 IP 地址为 “192.168.106.2:3693”
<input SVN-ip>
//点击
<button 测试>

<!-- 提交请求 -->
//输入文件夹路径 QSrule\Public\home\yq\src\xc\
<input file_list>
//点击
<button 提交请求>
```


### 邮件
—— 邮件内容包含各种 **[要素]**
```ini
[测试] [线上]

[80.xx]
··· ···

[5.xx]
··· ···

[已提交 SVN]
```

> **邮件**
>
> - 邮件由 **开发人员** 在完成 <u>上传子流程</u> 后，通过 [企业邮箱](https://exmail.qq.com) 发送给 **运维人员**



<div STYLE="page-break-after:always"><div>



## 部署

部署子流程涉及实体：
- 邮件
- 图形化界面Ⅱ
- 操作步骤
    - 提交 SVN
    - 更新


### 邮件
—— 邮件内容包含各种 **[要素]**
```ini
[测试] [线上]

[80.xx]
··· ···

[5.xx]
··· ···

[已提交 SVN]
```


### 图形化界面Ⅱ
—— 图像化界面内包含各种 **<元件>**
```html
<input SVN-ip>

<button 测试环境> <button 线上环境> <button 测试连接>

<button 提交SVN>

<button 更新>
```

> **图像化界面Ⅱ**
>
> - 运维人员，请打开 **虚拟机-SVN_console_10.6** 中的程序 [SVN-ops-Client 3.26](C:/Users/Administrator/Desktop/svn-client-ops/SVN.exe)

<div STYLE="page-break-after:always"><div>


### 操作步骤
&emsp;&emsp;例举，对要素 `[80.xx]` + `[测试]` 操作：
```xml
<!-- [80.xx] 要素对应下拉选项 外网域控 和 80.xx 主机-->
<!--操作①：向域控主机提交 SVN-->
// 下拉选择 “外网域控”
<input SVN-ip>
// 点击
<button 测试连接>
// 点击
<button 提交SVN>

<!-- [测试] 要素对应 测试环境 部署-->
<!--操作②：部署-->
// 下拉选择 “80.xx”
<input SVN-ip>
// 点击
<button 测试环境>
// 点击
<button 更新>
```

> **邮件**
>
> - **运维人员** 完成部署后，请通过邮件回复 **开发人员**




<div STYLE="page-break-after:always"><div>



> **PS**
>
> `[5.33]` 没有测试环境可以部署