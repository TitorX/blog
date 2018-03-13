---
id: 4
title: 使用scipy进行一元线性回归
author: Titor
tags: 
    - python
    - scipy
    - 科学计算
    - snippets
---


线性回归是一个使用频率较高的计算。对于基本的一元线性回归，scipy中已经封装好了相应的方法。

```python
import numpy as np
from scipy.stats import linregress

x = np.arange(10)
y = 3 * x + 1

result = linregress(x, y)
```

`linregress`使用函数来进行线性回归的计算。

如上代码`result`为回归的结果

```
LinregressResult(slope=3.0, intercept=2.0, rvalue=1.0, pvalue=4.375000000000076e-80, stderr=0.0)
```

返回的几个参数的解释

| 参数 | 意义 |
| --- | --- |
| slope | 斜率 |
| intercept | 截距 |
| rvalue | 相关系数 |
| pvalue | 双边p值 |
| stderr | 标准误差 |

使用回归得到的斜率跟截距计算新的数据

```python
new_y = x * result.slope + result.intercept
```

![linregress](/media/linregress.png)

最终的结果如图

