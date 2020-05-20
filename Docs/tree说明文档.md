### Tree
 > **tree是一个能列出递归目录的命令，以图形显示驱动器或路径的文件夹结构，可以生成命令树。Windows和Linux都有，mac没有原生支持，但是可以通过homebrew安装**

###  目的
**解决项目因多人开发而造成相关代码难以查找的难题**

###  安装
**在命令行执行`brew install tree`**

### 常用命令
 - 命令帮助 `tree -help`
 - 只显示文件夹 `tree -d`
 - 显示项目层级 `tree -L n`(n表示层级数，如要显示项目三级结构，可以用`tree -L 3`)
 - 过滤不想要显示的文件或者文件夹 `tree -l pattern` (举个例子，如果我们要显示某个项目下3层的所有文件结构，同时又过滤Authentication文件夹，最后输出到tree.md，可以这么写`tree -L 3 -I "Authentication"`)

### 为项目输出markdown文档
> `tree >"name".md`
 `tree >"name".markdown`
> 举例，在Authentication文件目录下输出markdown文件可以这么写`tree >Authentication.markdown`

### 常见问题
#### 目录乱码
使用`tree -N`输出原样字符、例如在包含有非英文命名的Authentication目录下生产markdown,可以使用`tree -N Authentication.markdown`

#### 输出规范
通常我们在项目里分模块的生成markdown文件进行文字描述,我们可以在命令行输入`tree -L 2 -N`进行目录浏览,并输入`tree -L 2 -N >Authentication.markdown`输出包含目录结构的markdown文件，通常我们在markdown里面的开头和结尾使用符号```来使文本高亮

### 示例
**在项目中我们通常把登录、注册、更改密码、第三方登录业务放在命名为Authentication（验证）的目录下,我们建立命名为tree的项目并添加几个空文件来进行举例**

1. 建立空项目目录如下

  ![preview](https://i.loli.net/2019/07/05/5d1e9c9e0cdd424710.png)

2. 在命令行输入tree -L 3进行目录预览

![preview](https://i.loli.net/2019/07/05/5d1e9c9ded75576305.png)

3. 使用命令`tree -L 3 -N >Authentication.markdown`,如下图所示

![preview](https://i.loli.net/2019/07/05/5d1e9c9e0510334587.png)

4. 自动生成的格式如下

![preview](https://i.loli.net/2019/07/05/5d1e9d4a195b531504.png)

5. 我们通常使用markdown语法使文本高亮便于已读，并为目录备注中文译名方便他人查看

![preview](https://i.loli.net/2019/07/05/5d1e9d818266217967.png)

6. 最后

![preview](https://i.loli.net/2019/07/05/5d1e9dab0079652036.png)

### 更多参考
1. [在Mac环境下使用tree](https://blog.csdn.net/alicelmx/article/details/81188389)

2. [在Windows环境下使用tree](https://www.jianshu.com/p/af694e4059c0)

3. [在Linux环境下使用tree](https://www.cnblogs.com/h--d/p/6507421.html)
