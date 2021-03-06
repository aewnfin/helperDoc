# echo 命令
- **-E**
- -n
- -e
    - \a
    - \b
    - \c
    - \f
    - \n
    - \r
    - \t
    - \v
    - \\\\
    - \nnn
- -help
- -version
> echo [-n] [-e] [字符串]

> echo [--help] [--version]

## 输出颜色文本
例如：
```sh
echo -e "\033[44;37;5m ME\033[0m COOL"
```

|编码|效果|
|:-:|:-|
|0|还原为默认效果|
|1|粗体|
|2|50% 亮度|
|4|下划线|
|5|闪烁|
|7|反色|
|22|一般密度|
|24|关闭下划线|
|25|关闭闪烁|
|27|关闭反向图象|

|编码|颜色|
|:-:|:-|
|30|黑色前景|
|31|红色前景|
|32|绿色前景|
|33|黄色前景|
|34|蓝色前景|
|35|紫色前景|
|36|青色前景|
|37|灰白前景|
|38|在缺省前景颜色的字体上设置下划线|
|39|在缺省前景颜色的字体上关闭下划线|
|40|黑色背景|
|41|红色背景|
|42|绿色背景|
|43|黄色背景|
|44|蓝色背景|
|45|紫色背景|
|46|青色背景|
|47|灰白背景|
|49|缺省黑色背景|

|编码|其他|
|:-:|:-|
|\033[2J|清除屏幕|
|\033[0q|关闭所有的键盘指示灯|
|\033[1q|"滚动锁定"指示灯(Scroll Lock)|
|\033[2q|"数值锁定"指示灯(Num Lock)|
|\033[3q|"大写锁定"指示灯(Caps Lock)|
|\033[15:40H|把关闭移动到第15行，40列|
|\007|发蜂鸣生 beep|

> `\033[` 与 `m` 之间为为有效格式编码，数值和编码的前后顺序没有关系
>
> `\033[` 可由 `^[[` 替代，`^[` 需先按 <kbd>Ctrl</kbd> + <kbd>V</kbd> ，然后再按 <kbd>ESC</kbd> 键产生

## 其他用法
```sh
# 光标跳到第 60 列，然后显示一个 OK
echo -en '\033[60G' && echo OK
# "\033[" 是终端转义字符开始，60G 是命令
```