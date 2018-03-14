---
id: 5
title: Python collections模块
author: Titor
tags: 
    - python
---


`collections`模块是`python`标准库的一部分。提供了一些实用的高级集合类。

<!--more-->

确切的说，就是对`list dict tuple`这些基本的数据结构的一些升级、增强。

`collections`模块中主要的内容有`namedtuple` `deque` `defaultdict` `OrderedDict`。通过名字也可以对这四个数据结构的功能特点有一定了解了。还有一个简单的计数器`Counter`。

### namedtuple

`namedtuple`是对基本的`tuple`进行了一定的增强。

基本的`tuple`用来保存一个不变集合，如保存一个员工的基本信息：

```
employee1 = ('Mike', 'male', 5000)
```

如上一个`元组`是用来表示一个雇员的`姓名` `性别` `工资`信息的。

但是用`tuple`来保存这段信息的话，代码里并没有明确的指明数据的含义，除了写这段代码的人，其他人来看很难正确领会到这段代码表达的含义。

使用`namedtuple`可以很方便的解决这个问题。

```python
from collections import namedtuple

Employee = namedtuple('Employee', ['name', 'gender', 'salary'])

employee1 = Employee('Mike', 'male', 5000)

print(employee1.name)
print(employee1.gender)
print(employee1.salary)
```

结果如下

```
Mike
male
5000
```

使用`namedtuple`来创建一个自定义的`tuple`对象，这个自定义的对象是`tuple`类的子类。`namedtuple`实质上就是一个工厂，用来生成用户定制的`tuple`子类。

使用`namedtuple`定制的类，在实例化、使用时较灵活。

```python
employee1 = Employee(gender='male', salary=5000, name='Mike')


print(employee1.name)
print(employee1[0])

print(employee1.gender)
print(employee1[1])

```

结果如下

```
Mike
Mike
male
male
```

实例化的时候，可以指定参数名来传参。使用的时候，使用点号来引用对应的属性，也支持像一个普通元组一样，使用下标索引。


### deque

`deque`是对`list`的一个增强。使用`list`的时候，使用下标来索引数据十分方便。但是若是在`list`上进行频繁的插入、删除，效率就比较低了，而且也不是十分的方便。`deque`是一个支持高效插入跟删除操作的双向列表。

```python
from collections import deque

q = deque([1, 2, 3, 4])
# 右端插入
q.append(5)
# 左端插入
q.appendleft(0)
# 右端pop
q.pop()
# 左端pop
q.popleft()

print(q)
```

结果如下

```
deque([1, 2, 3, 4])
```

`deque`与`list`的使用基本相同。主要的区别就是`append appendleft pop popleft`在左右端直接增删元素。

需要注意的是，`list`的`pop`方法支持`index`参数。`l.pop()`不填写参数的时候默认弹出最右端的元素，也可以通过`index`参数指定弹出的元素，如`l.pop(3)`。但是在`deque`中则不然，`pop`方法是没有参数的，只作用于最右的元素。


### defaultdict

`defaultdict`是对基本的`dict`的一个增强。

一个普通的字典

```python

d = {}

d['abc']

```

若是引用的`key`不存在，会抛出异常。而`defaultdict`就是处理这种情况，在引用不存在的`key`时，返回预设好的值。

```python
from collections import defaultdict

d = defaultdict(lambda: "default value")

d['k1'] = 1
print(d['k1'])
print(d['k2'])
```

结果如下

```
1
default value
```

可以看到，`k2`这个键是不存在的，因此返回值是我们预设好的一个值。

这里需要注意的是，`defaultdict`的参数必须要是一个可调用对象(`callable`)或者`None`，因此上面的实例代码中填写了一个`lambda`函数来返回预设的默认值。

除此之外，`defaultdict`与正常的`dict`是几乎完全一致的。

### OrderedDict

`OrderedDict`是有序字典。我们都知道，普通的`dict`是无序的，或者说普通字典的顺序不是按照代码里生成字典时的顺序来的。

那么需要对`dict`进行有顺序迭代的场景下，`OrderedDict`就派上用场了。

```python
from collections import OrderedDict

od = OrderedDict([
    ('key1', 'a'),
    ('key3', 'b'),
    ('key2', 'c')
])

od['key5'] = 'd'
od['key4'] = 'e'

print(od)
```

结果如下

```
OrderedDict([('key1', 'a'), ('key3', 'b'), ('key2', 'c'), ('key5', 'd'), ('key4', 'e')])
```

可以看到，确实是有顺序的，按照我们赋值时给定的顺序。

### Counter

`Counter`是一个非常简单的计数器，某些时候很实用。

```python
from collections import Counter

s = 'aabbbcccddddddddd'

count = Counter(s)

print(count)
print(count['a'])
print(count.most_common())
print(count.most_common(1))
print(count.most_common(2))
```

结果如下

```
Counter({'d': 9, 'b': 3, 'c': 3, 'a': 2})
2
[('d', 9), ('b', 3), ('c', 3), ('a', 2)]
[('d', 9)]
[('d', 9), ('b', 3)]
```

可以看到，`Counter`的返回值是一个类似字典的结构，返回一个记录了各个元素出现次数的字典。`Cunter`的内部事实上就是用一个`dict`来实现的计数功能。

`Counter`的返回值跟普通的`dict`基本没有区别，这是增加了一个`most_common`方法。将统计结果从大到小排列，还支持设置返回前`n`个元素。

当然，`Counter`不仅仅是用来统计字符串，`list` `tuple`等都可以。



