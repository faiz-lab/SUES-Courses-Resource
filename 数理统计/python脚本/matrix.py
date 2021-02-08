"""
Function: 
Coding: utf-8
Author: Sun Yuexin
Date:
"""

import numpy as np

# mat_x = np.transpose([[1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1000, 600, 1200, 500, 300, 400, 1300, 1100, 1300, 300],
#          [5, 7, 6, 6, 8, 7, 5, 4, 3, 9]])
# mat_y = np.transpose([[100, 75, 80, 70, 50, 65, 90, 100, 110, 60]])
mat_x = np.transpose([[1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 2, 3, 4, 5, 6, 7, 8, 9],
         [1, 4, 9, 16, 25, 36, 49, 64, 81]])
mat_y = np.transpose([[21.9, 47.1, 61.9, 70.8, 72.8, 66.4, 50.3, 25.3, 3.2]])
a = np.mat(np.transpose(mat_x)) * mat_x
beta = np.mat(a.I * np.mat(np.transpose(mat_x)) * np.mat(mat_y))
print(beta)

# print(beta)
