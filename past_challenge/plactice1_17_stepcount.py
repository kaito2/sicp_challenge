#! /usr/bin/env python3

"""
練習問題1.17 の解答ステップ数をカウントするためにpythonで書き直したソース
「対数的ステップ」をとっている(はず)
"""


step = 0

def kakeru(a,b):
    global step
    step+=1
    if b == 0:
        return 0
    if b % 2 == 0:
        return double(kakeru(a,halve(b)))
    return (a + kakeru(a,b-1))

def double(n):
    return n*2

def halve(n):
    return n/2

for i in range(100):
    step = 0
    print('3 x {} = '.format(i),end='')
    print(kakeru(3,i),end=' :')
    print(' step({})'.format(step))
