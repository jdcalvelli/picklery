package initializers

import (
	"log"
	"github.com/joho/godotenv"
)

func LoadEnv() {
	envError := godotenv.Load()
	  if envError != nil {
		log.Fatal("Error loading .env file")
	  }
}