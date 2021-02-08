"""
Function: the sign test for Mathematical Statistics and Its Application, Practice 4, task-12
Coding: utf-8
Author: Sun Yuexin
Date: 2020/11/21
"""


if __name__ == '__main__':
    X = [1.13, 1.26, 1.16, 1.41, 0.86, 1.39, 1.21, 1.22, 1.20, 0.62, 1.18, 1.34]
    Y = [1.21, 1.31, 0.99, 1.59, 1.41, 1.48, 1.31, 1.12, 1.60, 1.38, 1.60, 1.84]
    n_plus, n_minus = 0, 0
    for i in range(0, 12):
        print(i)
        x = X[i]
        y = Y[i]
        if x > y:
            n_plus += 1
        if x < y:
            n_minus += 1
    print("n+=", n_plus, "\n", "n-=", n_minus)
    s = min(n_plus, n_minus)
    print("s= ", s)



