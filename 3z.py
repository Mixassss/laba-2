def sum_digits(n):
    s = 0
    while n:
        s += n % 10
        n //= 10
    return s

def product_digits(n):
    p = 1
    while n:
        p *= n % 10
        n //= 10
    return p

def check_num(n):
    return sum_digits(n) < product_digits(n)

if __name__ == "__main__":
    numbers = map(int, input().split())
    result = []
    index = 1
    for number in numbers:
        if check_num(number):
            result.append(str(index))
        index += 1
    print(" ".join(result))
