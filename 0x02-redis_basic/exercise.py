#!/usr/bin/env python3
'''exercise.py'''
import redis
import uuid
from typing import Union, callable


class Cache:
    '''Clas that init value to store client'''
    def __init__(self):
        self._redis = redis.Redis()
        self._redis.flushdb()
        self.data = None

    def store(self, data: Union[str, bytes, int, float]) -> str:
        '''method that takes a data argument and returns a string'''
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key

    def get(self, key: str, fn: callable = None) -> Union[str, bytes, int, float]:
        '''get function that take str value'''
        value = self.data.get(key)
        if value is not None and fn is not None:
            return fn(value)
        return value

    def get_str(self, key: str) -> str:
        '''function that return str value'''
        return self.get(key, lambda x: x.decode('utf-8'))

    def get_int(self, key: str) -> int:
        '''function that return int value'''
        return self.get(key, lambda x; int(x))
