package main

import (
	"fmt"
	"strconv"
)

func sumOfDigits(n int) int {
	strN := strconv.Itoa(n)
	sum := 0
	for _, digit := range strN {
		digitInt, _ := strconv.Atoi(string(digit))
		sum += digitInt
	}
	return sum
}

func productOfDigits(n int) int {
	strN := strconv.Itoa(n)
	result := 1
	for _, digit := range strN {
		digitInt, _ := strconv.Atoi(string(digit))
		result *= digitInt
	}
	return result
}

func findNumbers(sequence []int) []int {
	result := []int{}
	for index, number := range sequence {
		if number >= 0 && sumOfDigits(number) < productOfDigits(number) {
			result = append(result, index+1)
		}
	}
	return result
}

func main() {
	sequence := []int{3, 27, 14, 99}
	output := findNumbers(sequence)
	fmt.Println(output)
}
