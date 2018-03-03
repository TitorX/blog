---
title: 使用scipy进行一维插值运算
author: Titor
tags: 
    - python
    - scipy
    - 科学计算
    - snippets
---

在科学计算的过程中，经常会使用来自真实世界采集的物理量。而这些采集所得的量经常会由于各种意外原因，存在一定程度的缺失。

如：每隔1小时采集一次地面温度，但是由于各种意外情况，导致一份数据中很多个时刻是没有数据的，也就是存在不定数量的的空缺点。

这时候就需要通过数学的方法对空缺的数值进行补全。

来看一段来自wikipedia的描述

> 数学旳数值分析领域中，内插或称插值（英语：interpolation)是一种通过已知的、离散的数据点，在范围内推求新数据点的过程或方法。求解科学和工程的问题时，通常有许多数据点借由采样、实验等方法获得，这些数据可能代表了有限个数值函数，其中自变量的值。而根据这些数据，我们往往希望得到一个连续的函数（也就是曲线）；或者更密集的离散方程与已知数据互相吻合，这个过程叫做拟合。

> 与插值密切相关的另一个问题是通过简单函数逼近复杂函数。假设给定函数的公式是已知的，但是太复杂以至于不能有效地进行评估。来自原始函数的一些已知数据点，或许会使用较简单的函数来产生插值。当然，若使用一个简单的函数来估计原始数据点时，通常会出现插值误差；然而，取决于该问题领域和所使用的插值方法，以简单函数推得的插值数据，可能会比所导致的精度损失更大。

在`python`中进行插值运算可以使用`scipy`库来完成。

```python
import numpy as np
from scipy.interpolate import interp1d
import matplotlib.pyplot as plt

# 原始数据
x = np.arange(0, 11)
y = np.cos(x)

plt.scatter(x, y, color='r', label="r")

# 插值数据
new_x = np.arange(0, 10, 0.1)

for kind in ["nearest","zero","slinear","quadratic","cubic"]:
    f = interp1d(x, y, kind=kind)
    new_y = f(new_x)
    
    plt.scatter(x, y, label="original", color="r")
    plt.plot(new_x, new_y, label=kind)

    plt.legend()
    plt.show()
    plt.clf()
```
![nearest](/media/nearest.png)
![zero](/media/zero.png)
![slinea](/media/slinear.png)![quadrati](/media/quadratic.png)
![cubi](/media/cubic.png)


上图即为插值后的效果图。`interp1d`支持5中不同的插值方法，在实际应用中应根据数据的情况来选择适当的算法。

这篇文章针对的是一维数据的插值，事实上多维情况也是类似的原理。后续若有时间则出一篇文章介绍多维插值的做法。


