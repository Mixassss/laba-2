package main

import (
	"fmt"
	"regexp"
)

func main() {
	stroka := "11001101000110"
	regular := regexp.MustCompile("1[0]+1")
	res := regular.FindAllString(stroka, -1)
	for _, match := range res {
		fmt.Println(match)
	}
}