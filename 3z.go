package main

import (
	"fmt"
	"strconv"
	"strings"
)

func sumDigits(n int) int {
	s := 0
	for n != 0 {
		s += n % 10
		n /= 10
	}
	return s
}

func productDigits(n int) int {
	p := 1
	for n != 0 {
		p *= n % 10
		n /= 10
	}
	return p
}

func checkNum(n int) bool {
	return sumDigits(n) < productDigits(n)
}

func main() {
	var numbers []int
	var input string
	fmt.Scanln(&input)
	strNumbers := strings.Split(input, " ")
	for _, strNum := range strNumbers {
		num, _ := strconv.Atoi(strNum)
		numbers = append(numbers, num)
	}

	var result []string
	index := 1
	for _, number := range numbers {
		if checkNum(number) {
			result = append(result, strconv.Itoa(index))
		}
		index++
	}

	fmt.Println(strings.Join(result, " "))
}
