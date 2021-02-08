"""
Function: 
Coding: utf-8
Author: Sun Yuexin
Date:
"""

import sympy

x = sympy.symbols("x")
i = 2*(5**0.5)
a = sympy.solve([(((x**2 + 9)**0.5-i)/3)-(i/5)], [x])
print(a)
