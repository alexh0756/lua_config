import os
import sys

import pandas as pd
import numpy as np

print(os.path.dirname(__file__))
print('hello world')

pd.DataFrame()

def sum_axis(df):

    df['something'] = df['x'] + df['y']

    return df


df = pd.DataFrame({'x': [1, 2, 3, 4], 'y': [4, 3, 2, 1]})
print(df)

df = sum_axis(df)
print(df)
print()
