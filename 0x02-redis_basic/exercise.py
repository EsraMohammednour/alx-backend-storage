#!/usr/bin/env python3
'''exercise.py'''
import redis
import uuid


class Cache:
    '''Clas that init value to store client'''
    def __init__(self):
        self._redis = redis.Redis()
        self._redis.flushdb()
        self.data = None
    def store(self, data: any):
        '''method that takes a data argument and returns a string'''
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key
