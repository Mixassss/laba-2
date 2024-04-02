package main

import (
	"fmt"
)

func romToInt(s string) int {
	romNums := map[byte]int{
		'I': 1,
		'V': 5,
		'X': 10,
		'L': 50,
		'C': 100,
		'D': 500,
		'M': 1000,
	}
	res := romNums[s[len(s)-1]] // Численное значение для последнего символа
	for i := len(s) - 2; i >= 0; i-- {
		if romNums[s[i]] < romNums[s[i+1]] {
			res -= romNums[s[i]] // Если меньшая цифра перед большей, вычитаем ее значение
		} else {
			res += romNums[s[i]] // Складываем значения
		}
	}
	return res
}

func main() {
	var num string
	fmt.Print("Введите римское число: ")
	fmt.Scanln(&num)
	fmt.Println("Число:", romToInt(num))
}
