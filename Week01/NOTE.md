# Requests

Requests是一个优雅而简单的Python HTTP库

```python
import requests
#request HTTP 请求类型
r = requests.post('http://httpbin.org/post', data = {'key':'value'})
r = requests.put('http://httpbin.org/put', data = {'key':'value'})
r = requests.delete('http://httpbin.org/delete')
r = requests.head('http://httpbin.org/get')
r = requests.options('http://httpbin.org/get')
```

## 传递 URL 参数

Requests 允许使用 `params` 关键字参数，以一个**字符串字典**来提供这些参数

字典里值为 `None` 的键都不会被添加到 URL 的查询字符串里

可以将一个**列表**作为值传入

```python
payload = {'key1': 'value1', 'key2': None}
r = requests.get("http://httpbin.org/get", params=payload)
>> r.url
'http://httpbin.org/get?key1=value1'
```

## 响应内容

响应response

- response.text ：能读取服务器响应的内容
- response.encoding ：Requests 展示推测的文本编码，并且可以通过这个属性指定文本内容编码
- response.url：打印请求url

## 二进制响应内容

以字节的方式访问请求响应体，对于非文本请求：

```
>>> r.content
b'[{"repository":{"open_issues":0,"url":"https://github.com/...
```

Requests 会自动为你解码 `gzip` 和 `deflate` 传输编码的响应数据。

例如，以请求返回的二进制数据创建一张图片，你可以使用如下代码：

```python
>>> from PIL import Image
>>> from io import BytesIO

>>> i = Image.open(BytesIO(r.content))
```

## JSON 响应内容

Requests 中也有一个内置的 JSON 解码器

```python
>>> import requests

>>> r = requests.get('https://api.github.com/events')
>>> r.json()
[{u'repository': {u'open_issues': 0, u'url': 'https://github.com/...
```

如果 JSON 解码失败， `r.json()` 就会抛出一个异常。例如，响应内容是 401 (Unauthorized)，尝试访问 `r.json()` 将会抛出 `ValueError: No JSON object could be decoded` 异常。

需要注意的是，成功调用 `r.json()` 并**不**意味着响应的成功。有的服务器会在失败的响应中包含一个 JSON 对象（比如 HTTP 500 的错误细节）。这种 JSON 会被解码返回。要检查请求是否成功，请使用 `r.raise_for_status()` 或者检查 `r.status_code` 是否和你的期望相同。

## 原始响应内容

初始请求中设置 `stream=True`

```
>>> r = requests.get('https://api.github.com/events', stream=True)
>>> r.raw
<requests.packages.urllib3.response.HTTPResponse object at 0x101194810>
>>> r.raw.read(10)
'\x1f\x8b\x08\x00\x00\x00\x00\x00\x00\x03'
```

但一般情况下，应该以下面的模式将文本流保存到文件：

```
with open(filename, 'wb') as fd:
    for chunk in r.iter_content(chunk_size):
        fd.write(chunk)
```

使用 `Response.iter_content` 将会处理大量你直接使用 `Response.raw` 不得不处理的。 当流下载时，上面是优先推荐的获取内容方式。

## 定制请求头

传递 `dict` 给 `headers` 参数

所有的 header 值必须是 `string`、bytestring 或者 unicode

```python
>>> url = 'https://api.github.com/some/endpoint'
>>> headers = {'user-agent': 'my-app/0.0.1'}

>>> r = requests.get(url, headers=headers)
```

##  POST 请求

要发送一些编码为表单形式的数据——非常像一个 HTML 表单。要实现这个，只需简单地传递一个字典给 data 参数。数据字典在发出请求时会自动编码为表单形式.

```python
>>> payload = {'key1': 'value1', 'key2': 'value2'}

>>> r = requests.post("http://httpbin.org/post", data=payload)
>>> print(r.text)
{
  "args": {}, 
  "data": "", 
  "files": {}, 
  "form": {
    "key1": "value1"
  }, 
......
}
```

如果传递一个 `string` 而不是一个 `dict`，那么数据会被直接发布出去。

```
>>> import json

>>> url = 'https://api.github.com/some/endpoint'
>>> payload = {'some': 'data'}

>>> r = requests.post(url, data=json.dumps(payload))
```

此处除了可以自行对 `dict` 进行编码，你还可以使用 `json` 参数直接传递，然后它就会被自动编码。这是 2.4.2 版的新加功能：

```
>>> url = 'https://api.github.com/some/endpoint'
>>> payload = {'some': 'data'}

>>> r = requests.post(url, json=payload)
```

## 响应状态码

reponse.status_code：返回状态码

```
r.status_code == requests.codes.ok #判断返回是否正常
```

可以通过 [`Response.raise_for_status()`](https://requests.readthedocs.io/zh_CN/latest/api.html#requests.Response.raise_for_status) 来抛出异常：

## 响应头

头部是大小写不敏感

```
>>> r.headers['Content-Type']
'application/json'

>>> r.headers.get('content-type')
'application/json'
```

## Cookie

如果某个响应中包含一些 cookie，你可以快速访问它们：

```
>>> url = 'http://example.com/some/cookie/setting/url'
>>> r = requests.get(url)

>>> r.cookies['example_cookie_name']
'example_cookie_value'
```

要想发送你的cookies到服务器，可以使用 `cookies` 参数：

```
>>> url = 'http://httpbin.org/cookies'
>>> cookies = dict(cookies_are='working')

>>> r = requests.get(url, cookies=cookies)
>>> r.text
'{"cookies": {"cookies_are": "working"}}'
```

Cookie 的返回对象为 [`RequestsCookieJar`](https://requests.readthedocs.io/zh_CN/latest/api.html#requests.cookies.RequestsCookieJar)，它的行为和字典类似，但接口更为完整，适合跨域名跨路径使用。你还可以把 Cookie Jar 传到 Requests 中：

```
>>> jar = requests.cookies.RequestsCookieJar()
>>> jar.set('tasty_cookie', 'yum', domain='httpbin.org', path='/cookies')
>>> jar.set('gross_cookie', 'blech', domain='httpbin.org', path='/elsewhere')
>>> url = 'http://httpbin.org/cookies'
>>> r = requests.get(url, cookies=jar)
>>> r.text
'{"cookies": {"tasty_cookie": "yum"}}'
```

## 重定向与请求历史

默认情况下，除了 HEAD, Requests 会自动处理所有重定向。

可以使用响应对象的 `history` 方法来追踪重定向。

[`Response.history`](https://requests.readthedocs.io/zh_CN/latest/api.html#requests.Response.history) 是一个 [`Response`](https://requests.readthedocs.io/zh_CN/latest/api.html#requests.Response) 对象的列表，为了完成请求而创建了这些对象。这个对象列表按照从最老到最近的请求进行排序。

例如，Github 将所有的 HTTP 请求重定向到 HTTPS：

```
>>> r = requests.get('http://github.com')

>>> r.url
'https://github.com/'

>>> r.status_code
200

>>> r.history
[<Response [301]>]
```

如果你使用的是GET、OPTIONS、POST、PUT、PATCH 或者 DELETE，那么你可以通过 `allow_redirects` 参数禁用重定向处理：

```
>>> r = requests.get('http://github.com', allow_redirects=False)
>>> r.status_code
301
>>> r.history
[]
```

如果你使用了 HEAD，你也可以启用重定向：

```
>>> r = requests.head('http://github.com', allow_redirects=True)
>>> r.url
'https://github.com/'
>>> r.history
[<Response [301]>]
```

## 超时

你可以告诉 requests 在经过以 `timeout` 参数设定的秒数时间之后停止等待响应。基本上所有的生产代码都应该使用这一参数。如果不使用，你的程序可能会永远失去响应：

```
>>> requests.get('http://github.com', timeout=0.001)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
requests.exceptions.Timeout: HTTPConnectionPool(host='github.com', port=80): Request timed out. (timeout=0.001)
```

注意

`timeout` 仅对连接过程有效，与响应体的下载无关。 `timeout` 并不是整个下载响应的时间限制，而是如果服务器在 `timeout` 秒内没有应答，将会引发一个异常（更精确地说，是在 `timeout` 秒内没有从基础套接字上接收到任何字节的数据时）If no timeout is specified explicitly, requests do not time out.

## 错误与异常

遇到网络问题（如：DNS 查询失败、拒绝连接等）时，Requests 会抛出一个 `ConnectionError` 异常。

如果 HTTP 请求返回了不成功的状态码， [`Response.raise_for_status()`](https://requests.readthedocs.io/zh_CN/latest/api.html#requests.Response.raise_for_status) 会抛出一个 `HTTPError` 异常。

若请求超时，则抛出一个 `Timeout` 异常。

若请求超过了设定的最大重定向次数，则会抛出一个 `TooManyRedirects` 异常。

所有Requests显式抛出的异常都继承自 `requests.exceptions.RequestException` 。

## XML 实例文档

我们将在下面的例子中使用这个 XML 文档。

```
<?xml version="1.0" encoding="ISO-8859-1"?>

<bookstore>

<book>
  <title lang="eng">Harry Potter</title>
  <price>29.99</price>
</book>

<book>
  <title lang="eng">Learning XML</title>
  <price>39.95</price>
</book>

</bookstore>
```

## 选取节点

XPath 使用路径表达式在 XML 文档中选取节点。节点是通过沿着路径或者 step 来选取的。

### 下面列出了最有用的路径表达式：

| 表达式   | 描述                                                       |
| :------- | :--------------------------------------------------------- |
| nodename | 选取此节点的所有子节点。                                   |
| /        | 从根节点选取。                                             |
| //       | 从匹配选择的当前节点选择文档中的节点，而不考虑它们的位置。 |
| .        | 选取当前节点。                                             |
| ..       | 选取当前节点的父节点。                                     |
| @        | 选取属性。                                                 |

### 实例

在下面的表格中，我们已列出了一些路径表达式以及表达式的结果：

| 路径表达式      | 结果                                                         |
| :-------------- | :----------------------------------------------------------- |
| bookstore       | 选取 bookstore 元素的所有子节点。                            |
| /bookstore      | 选取根元素 bookstore。注释：假如路径起始于正斜杠( / )，则此路径始终代表到某元素的绝对路径！ |
| bookstore/book  | 选取属于 bookstore 的子元素的所有 book 元素。                |
| //book          | 选取所有 book 子元素，而不管它们在文档中的位置。             |
| bookstore//book | 选择属于 bookstore 元素的后代的所有 book 元素，而不管它们位于 bookstore 之下的什么位置。 |
| //@lang         | 选取名为 lang 的所有属性。                                   |

## 谓语（Predicates）

谓语用来查找某个特定的节点或者包含某个指定的值的节点。

谓语被嵌在方括号中。

### 实例

在下面的表格中，我们列出了带有谓语的一些路径表达式，以及表达式的结果：

| 路径表达式                         | 结果                                                         |
| :--------------------------------- | :----------------------------------------------------------- |
| /bookstore/book[1]                 | 选取属于 bookstore 子元素的第一个 book 元素。                |
| /bookstore/book[last()]            | 选取属于 bookstore 子元素的最后一个 book 元素。              |
| /bookstore/book[last()-1]          | 选取属于 bookstore 子元素的倒数第二个 book 元素。            |
| /bookstore/book[position()<3]      | 选取最前面的两个属于 bookstore 元素的子元素的 book 元素。    |
| //title[@lang]                     | 选取所有拥有名为 lang 的属性的 title 元素。                  |
| //title[@lang='eng']               | 选取所有 title 元素，且这些元素拥有值为 eng 的 lang 属性。   |
| /bookstore/book[price>35.00]       | 选取 bookstore 元素的所有 book 元素，且其中的 price 元素的值须大于 35.00。 |
| /bookstore/book[price>35.00]/title | 选取 bookstore 元素中的 book 元素的所有 title 元素，且其中的 price 元素的值须大于 35.00。 |

## 选取未知节点

XPath 通配符可用来选取未知的 XML 元素。

| 通配符 | 描述                 |
| :----- | :------------------- |
| *      | 匹配任何元素节点。   |
| @*     | 匹配任何属性节点。   |
| node() | 匹配任何类型的节点。 |

### 实例

在下面的表格中，我们列出了一些路径表达式，以及这些表达式的结果：

| 路径表达式   | 结果                              |
| :----------- | :-------------------------------- |
| /bookstore/* | 选取 bookstore 元素的所有子元素。 |
| //*          | 选取文档中的所有元素。            |
| //title[@*]  | 选取所有带有属性的 title 元素。   |

## 选取若干路径

通过在路径表达式中使用“|”运算符，您可以选取若干个路径。

### 实例

在下面的表格中，我们列出了一些路径表达式，以及这些表达式的结果：

| 路径表达式                       | 结果                                                         |
| :------------------------------- | :----------------------------------------------------------- |
| //book/title \| //book/price     | 选取 book 元素的所有 title 和 price 元素。                   |
| //title \| //price               | 选取文档中的所有 title 和 price 元素。                       |
| /bookstore/book/title \| //price | 选取属于 bookstore 元素的 book 元素的所有 title 元素，以及文档中所有的 price 元素。 |

## XPath 轴

轴可定义相对于当前节点的节点集。

| 轴名称             | 结果                                                     |
| :----------------- | :------------------------------------------------------- |
| ancestor           | 选取当前节点的所有先辈（父、祖父等）。                   |
| ancestor-or-self   | 选取当前节点的所有先辈（父、祖父等）以及当前节点本身。   |
| attribute          | 选取当前节点的所有属性。                                 |
| child              | 选取当前节点的所有子元素。                               |
| descendant         | 选取当前节点的所有后代元素（子、孙等）。                 |
| descendant-or-self | 选取当前节点的所有后代元素（子、孙等）以及当前节点本身。 |
| following          | 选取文档中当前节点的结束标签之后的所有节点。             |
| namespace          | 选取当前节点的所有命名空间节点。                         |
| parent             | 选取当前节点的父节点。                                   |
| preceding          | 选取文档中当前节点的开始标签之前的所有节点。             |
| preceding-sibling  | 选取当前节点之前的所有同级节点。                         |
| self               | 选取当前节点。                                           |

## 位置路径表达式

位置路径可以是绝对的，也可以是相对的。

绝对路径起始于正斜杠( / )，而相对路径不会这样。在两种情况中，位置路径均包括一个或多个步，每个步均被斜杠分割：

### 绝对位置路径：

```
/step/step/...
```

### 相对位置路径：

```
step/step/...
```

每个步均根据当前节点集之中的节点来进行计算。

### 步（step）包括：

- 轴（axis）

  定义所选节点与当前节点之间的树关系

- 节点测试（node-test）

  识别某个轴内部的节点

- 零个或者更多谓语（predicate）

  更深入地提炼所选的节点集

### 步的语法：

```
轴名称::节点测试[谓语]
```

### 实例

| 例子                   | 结果                                                         |
| :--------------------- | :----------------------------------------------------------- |
| child::book            | 选取所有属于当前节点的子元素的 book 节点。                   |
| attribute::lang        | 选取当前节点的 lang 属性。                                   |
| child::*               | 选取当前节点的所有子元素。                                   |
| attribute::*           | 选取当前节点的所有属性。                                     |
| child::text()          | 选取当前节点的所有文本子节点。                               |
| child::node()          | 选取当前节点的所有子节点。                                   |
| descendant::book       | 选取当前节点的所有 book 后代。                               |
| ancestor::book         | 选择当前节点的所有 book 先辈。                               |
| ancestor-or-self::book | 选取当前节点的所有 book 先辈以及当前节点（如果此节点是 book 节点） |
| child::*/child::price  | 选取当前节点的所有 price 孙节点。                            |