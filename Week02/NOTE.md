# 异常

异常也是一个类

## 异常捕获过程

- 异常类把错误消息打包到一个对象

- 然后该对象会自动查找到调用栈

- 直到运行系统找到明确声明如何处理这些类异常的位置

- **所有异常继承自 BaseException**

- Traceback 显示了出错的位置，**显示的顺序和异常信息对象传播的方向是相反的**

## 异常信息与异常捕获

异常信息在 Traceback 信息的最后一行，有不同的类型

- 捕获异常可以使用 try…except 语法
- try…except 支持多重异常处理

常见的异常类型主要有：

- LookupError 下的 IndexError 和 KeyError
- IOError
- NameError
- TypeError
- AttributeErrorZeroDivisionError

【Note】异常发生后，其后面的代码将不再执行

```python
1/0
# 出现异常后的代码将不再执行
print('我不会执行')

# 捕获异常
try:
    1/0
except Exception as e:
    print(e)
```

## 嵌套异常捕获

```python
try:
    1/0
except Exception as e:
    try:
        1/0
    except Exception as f:
        print(f'f 内嵌异常{f}')
    print(f'e 外层异常{e}')
```

## 链式异常捕获

在整个链式异常捕获结构中，如果已经有了捕获输出，则后面的异常不会再进行捕获输出

```python
def f1():
    1/0

def f2():
    list1 = []
    list1[1] # IndexError: list index out of range
    f1() # ZeroDivisionError: division by zero

def f3():
    f2()

try:
    f3()
except (ZeroDivisionError,Exception) as e:
    print(e)
    
    
>> list index out of range
```

## 自定义异常捕获

继承Exception类

```python
class UserInputError(Exception):
    def __init__(self,ErrorInfo):
        super().__init__(self, ErrorInfo)
        self.errorinfo = ErrorInfo
    def __str__(self):
        return self.errorinfo
    

userinput = 'a'
try:
    if(not userinput.isdigit()):
        # 抛出异常
        raise UserInputError('用户输入错误')
except UserInputError as ue:
    print(ue)
finally:
    del userinput
```

## 下载中间件

Request 对象经过下载中间件时会被调用，优先级高的先调用:

```python
process_request(request, spider)
```

Response 对象经过下载中间件时会被调用，优先级高的后调用:

```python
process_response(request, response, spider)
```

当 process_exception() 和 process_request() 抛出异常时会被调用

```python
process_exception(request, exception, spider)
```

使用 crawler 来创建中间器对象，并（必须）返回一个中间件对象

```python
from_crawler(cls, crawler)
```

## 分布式爬虫

Scrapy 原生不支持分布式，多机之间需要 Redis 实现队列和管道的共享。
scrapy-redis 很好地实现了 Scrapy 和 Redis 的集成

### 使用 scrapy-redis 之后 Scrapy 的主要变化：

- 使用了 RedisSpider 类替代了 Spider 类
- Scheduler 的 queue 由 Redis 实现
- item pipeline 由 Redis 实现 


