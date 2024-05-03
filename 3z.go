import "fmt"

func sumOfDigits(n int) int {
	sum := 0
	for n > 0 {
		sum += n % 10
		n /= 10
	}
	return sum
}

func productOfDigits(n int) int {
	prod := 1
	for n > 0 {
		prod *= n % 10
		n /= 10
	}
	return prod
}

func checkNumber(n int) bool {
	return sumOfDigits(n) < productOfDigits(n)
}

func main() {
	numbers := []int{3, 27, 14, 99}
	number := 1
	for _, num := range numbers {
		if checkNumber(num) {
			fmt.Print(number, " ")
		}
		number++
	}
}
