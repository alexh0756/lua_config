import os
import sys

import pandas as pd
import numpy as np

print(os.path.dirname(__file__))
print("hello world")

print("something new")


def sum_axis(df):
    df["something"] = df["x"] + df["y"]

    return df


def minus_nums(a, b):
    return b - a


b = "definition"


r = "something"

df = pd.DataFrame({"x": [1, 2, 3, 4], "y": [4, 3, 2, 1]})
print(df)

df["z"] = df["x"] + df["y"]


def function(c, d):
    return c + d


df = sum_axis(df)
print(df)
print()


import functions

print(functions.sum(a, b))
