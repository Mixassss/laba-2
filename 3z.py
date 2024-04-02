def sum_of_digits(n):
    return sum(int(digit) for digit in str(n))

def product_of_digits(n):
    result = 1
    for digit in str(n):
        result *= int(digit)
    return result

def find_numbers(sequence):
    result = []
    for index, number in enumerate(sequence):
        if number >= 0 and sum_of_digits(number) < product_of_digits(number):
            result.append(index + 1)
    return result

sequence = [3, 27, 14, 99]
output = find_numbers(sequence)
print(output)