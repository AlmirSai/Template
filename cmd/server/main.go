package main

import (
	"fmt"
	"time"

	"github.com/fatih/color"
)

func main() {
	for i := 0; i < 10; i++ {
		fmt.Print(color.GreenString("The app is successfully running"))
		time.Sleep(10 * time.Millisecond)
	}
}
