#! /usr/bin/env python3

coinValue = [1,5,10,25,50]

graph_id = 0


def cc (amount, no):
    global graph_id
    #print(graph_id)
    graph_id+=1
    if amount == 0:
        return 1
    if amount < 0 or no == -1:
        return 0
    return cc(amount,no-1) + cc(amount-coinValue[no],no)

def coin_count(amount):
    return cc(amount,4)

print(coin_count(24))
