package main

import (
	"fmt"
)

func main() {
	str := "sd10sds101sdd100101" // строка
	in := 0
	out := ""
	for i := 0; i < len(str); i++ {
		if string(str[i]) == "1" && in == 0 {
			in = 1
			out = "1"
			continue
		}
		if string(str[i]) == "1" && in == 2 {
			out += "1"
			fmt.Println(out)
			in = 0
			i--
		}
		if string(str[i]) == "0" && (in == 1 || in == 2) {
			out += "0"
			in = 2
		} else if in == 1 || in == 2 {
			in = 0
		}
	}
}
