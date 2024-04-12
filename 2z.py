def rom_to_int(s):
    rom_nums = {'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000}
    res = rom_nums[s[-1]]  # Численное значение для последнего символа
    for i in range(len(s) - 2, -1, -1):
        if rom_nums[s[i]] < rom_nums[s[i + 1]]:
            res -= rom_nums[s[i]]  # Если меньшая цифра перед большей, вычитаем ее значение
        else:
            res += rom_nums[s[i]]  # Сложение
    return res

num = input("Введите римское число: ")
print("Число:", rom_to_int(num))