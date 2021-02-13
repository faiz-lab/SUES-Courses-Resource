"""
Function: The Method of Least Squares
Coding: utf-8
Author: fox2049
Date:
"""

import sympy

x = sympy.symbols("x")
i = 2*(5**0.5)
a = sympy.solve([(((x**2 + 9)**0.5-i)/3)-(i/5)], [x])
print(a)
