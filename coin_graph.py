#! /usr/bin/env python3

from graphviz import Digraph

# formatはpngを指定(他にはPDF, PNG, SVGなどが指定可)
G = Digraph(format='png')
G.attr('node', shape='circle')

coinValue = [1,5,10,25,50]

graph_id = 0


def cc (amount, no, p_id):
    global graph_id
    global G

    graph_id+=1
    my_id = graph_id
    print(p_id,my_id)
    G.node(str(my_id),label='({},{})'.format(amount,no))
    if graph_id != 1:
        G.edge(str(p_id),str(my_id))
    if amount == 0:
        return 1
    if amount < 0 or no == -1:
        return 0
    return cc(amount,no-1,my_id) + cc(amount-coinValue[no],no,my_id)

def coin_count(amount):
    cnt = cc(amount,4,0)
    # print()するとdot形式で出力される
    global G
    print(G)
    G.render('binary_tree')
    return cnt

    # binary_tree.pngで保存


print(coin_count(11))
