---
title: 在无界面环境下运行matplotlib
author: Titor
tags: 
    - python
    - matplotlib
    - 科学计算
    - snippets
---

在没有安装图形界面的服务器上使用`matplotlib`绘图，会在`import`相应包的时候报错。
只需要在导入`matplotlib`包之前，执行下面两行语句，就可以解决这个问题。

<!--more-->

```
import matplotlib as mpl
mpl.use('Agg')
```


