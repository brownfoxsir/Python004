
# 作业一
# 扁平序列 ：str
# 容器序列： list dict collections.deque tuple
# 可变序列： list dict collections.deque
# 不可变序列： str  tuple 


print("===============================作业二==========================")
# 作业二
from collections.abc import Iterable

def redefine_map(func, seq):
    if not isinstance(seq, Iterable):
        raise Exception(f"{ type(seq).__name__} 类型是不可迭代的，请传入正确的数据类型")
    map_seq= []
    for item in seq:
        map_seq.append(func(item))
    return map_seq

value = redefine_map(lambda x:x+1, [1,2,3])
print(value)

print("===============================作业三==========================")
# 作业三
import time
from functools import wraps
 
def timer(func):
    @wraps(func)
    def run_time(*args, **kwargs):
        time_start = time.time()
        result = func(*args, **kwargs)
        time_stop = time.time()
        print(f"{func.__name__} 函数运行消耗了：{time_stop - time_start} s")
        return result
    return run_time

@timer
def test(num):
    sum = 0
    for i in range(num):
        sum += 1
    return sum

test(100000)
