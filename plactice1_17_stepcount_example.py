#! /usr/bin/env python3

"""
練習問題1.17 の例題のステップ数をカウントするためにpythonで書き直したソース
「線形的ステップ数」をとっている
"""

step = 0

def kakeru(a,b):
    global step
    step += 1
    if b == 0:
        return 0
    return (a + kakeru(a,b-1))

for i in range(100):
    step = 0
    print('3 x {} = '.format(i),end='')
    print(kakeru(3,i),end=' :')
    print(' step({})'.format(step))
