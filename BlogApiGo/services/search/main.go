package main

import (
	"BlogApiGo/configs/search"
	"log"
)

func main() {
    router := search.RouteInit()
    if err := router.Run(":8080"); err != nil {
    	log.Fatal("router err")
	}
}
