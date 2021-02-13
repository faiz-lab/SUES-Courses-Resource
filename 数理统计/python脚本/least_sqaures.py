"""
Function: The Method of Least Squares
Coding: utf-8
Author: fox2049
Date:
"""

if __name__ == '__main__':
    # x = [1, 2, 3, 4, 5, 6]
    # y = [10.4, 11.4, 13.1, 14.2, 14.8, 15.7]
    # x = [300 ,400, 500, 600, 700, 800]
    # y = [40, 50, 55, 60, 67, 70]
    # x = [49508,55152,60894,64181,41248,69609,81745,141165,135596,138593,142892,161761,259414,163738,184936,266081,313254,461484]
    # y = [527,860,1063,1281,1027,1823,2354,3997,4819,5432,6333,7090,10548,8837,9726,13837,16341,21802]
    x = [0.5,1.0,1.6,1.8,2.6,3.2,3.8,4.7]  # 3
    y = [0.28,0.29,0.29,0.18,0.17,0.18,0.10,0.12]
    # x = [1.5, 2, 3, 4.5, 7.5, 9.1, 10.5, 12]
    # y = [5.6, 6.6, 7.2, 7.8, 10.1, 10.8, 13.5, 16.5]
    n = len(x)
    alpha = 0.05
    x_square_sum, y_square_sum, x_sum, y_sum, xy_sum = 0, 0, 0, 0, 0
    for i, j in zip(x, y):
        x_square_sum += i ** 2
        y_square_sum += j ** 2
        x_sum += i
        y_sum += j
        xy_sum += i * j
    x_mean = x_sum / n
    y_mean = y_sum / n
    Lxx = x_square_sum - (1 / n) * (x_sum ** 2)
    Lyy = y_square_sum - (1 / n) * (y_sum ** 2)
    Lxy = xy_sum - (1 / n) * x_sum * y_sum

    b = Lxy / Lxx
    a = y_mean - b * x_mean
    Q = Lyy - b * Lxy
    sigma_square = Q / (n - 2)
    print("x_square_sum = %f, y_square_sum = %f, x_sum = %f, y_sum = %f, xy_sum = %f" % (x_square_sum, y_square_sum, x_sum, y_sum, xy_sum))
    print("x_mean, y_mean = ", x_mean, y_mean)
    print("Lxx = ", Lxx, "Lxy = ", Lxy, "Lyy = ", Lyy)
    if b > 0:
        print("y^ = a^ - b^x = ", a, "+", b, "x")
    else:
        print("y^ = a^ - b^x = ", a, b, "x")
    print("T-test", "-" * 30)
    print("Q = ", Q, "σ^2 = ", sigma_square, "σ = ", sigma_square ** 0.5)
    T = b * (Lxx ** 0.5) / (sigma_square ** 0.5)
    F = ((b ** 2) * Lxx) / sigma_square
    print("Statistic value(T): ", T)
    print("reject: t[0.975](%d)" % (n-2))
    print("F-test", "-" * 30)
    print("Statistic value(F): ", F)
    print("reject: f[%f](1, %d)" % (1 - alpha, n - 2))
    print("n =", len(x))
    print("test", "-" * 30)
    p = 1
    Sr, Se = 0, 0
    for i, j in zip(x, y):
        y_hat = 0.3144637931034481 - 0.04717241379310338 * i
        Sr += (y_hat - y_mean) ** 2
        Se += (j - y_hat) ** 2
    FF = (Sr/p)/(Se/(n-p-1))
    print(FF)


