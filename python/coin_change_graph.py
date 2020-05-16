from typing import List
from visualiser.visualiser import Visualiser as vs

# Add decorator
# Decorator accepts optional arguments: ignore_args , show_argument_name, show_return_value and node_properties_kwargs
@vs(node_properties_kwargs={"shape":"record", "color":"#000000", "backgroundcolor":"#badbde", "style":"filled", "fillcolor":"grey"})
def coin_exchange(amount: int, coins: List[int]) -> int:
    if len(coins) == 0 or amount < 0:
        return 0
    if amount == 0:
        return 1
    return coin_exchange(amount=amount - min(coins), coins=coins) + coin_exchange(amount=amount, coins=sorted(coins)[1:])


def main():
    # Call function
    print(coin_exchange(amount=11, coins=[1,5,10]))
    # Save recursion tree to a file
    vs.make_animation("fibonacci.gif", delay=0.5)


if __name__ == "__main__":
    main()
