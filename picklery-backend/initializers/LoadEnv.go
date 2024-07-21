package initializers

import (
	"log"
	"path/filepath"

	"github.com/joho/godotenv"
)

func LoadEnv() {
	envError := godotenv.Load(filepath.Join("..", ".env"))
	  if envError != nil {
		log.Fatal("Error loading .env file")
	  }
}