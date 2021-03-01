"""
Function: rank sum test for array X and array Y. Mathematical Statistics and Its Application, Practice 4, task-12
Coding: utf-8
Author: fox2049
Date: 2020/11/19
"""
from collections import Counter


def rank_sum_test(arr_x, arr_y):
    arr_all = sorted(arr_x + arr_y)
    show = Counter(arr_all)
    number = 1
    rank_sum = 0
    for i in show:
        new_number = number + show[i]
        sum_value = 0
        for a in range(number, new_number):
            if i in X:
                sum_value = sum_value + a
        rank = sum_value / show[i]
        if show[i] == 1:
            print("%.2f >>> %d" % (i, rank))
        else:
            print("%.2f >>> %.1f (%d & %d)" %(i, rank, number, new_number - 1))
        rank_sum += rank
        number = new_number
    return rank_sum


if __name__ == '__main__':
    X = [1.13, 1.26, 1.16, 1.41, 0.86, 1.39, 1.21, 1.22, 1.20, 0.62, 1.18, 1.34]
    Y = [1.21, 1.31, 0.99, 1.59, 1.41, 1.48, 1.31, 1.12, 1.60, 1.38, 1.60, 1.84]
    m, n = 12, 12
    out = rank_sum_test(X, Y)
    up = out - (n * (n + m + 1) / 2)
    down = ((n * m * (m + n + 1)) / 12) ** (1 / 2)
    u = up / down
    print("rank_sum = ", out)
    print("test statistic value =  %f" % u)
