package main

import (
  "net/http"
  "path/filepath"
    "picklery/picklery-backend/initializers"

  "github.com/gin-contrib/static"
  "github.com/gin-gonic/gin"
)

// runs before main
func init() {
  initializers.LoadEnv()
}

// main entry point to the program
func main() {
  // creation of http app
  app := gin.Default()
  
  // middleware for serving static site
  app.Use(static.Serve("/", static.LocalFile(filepath.Join("..", "picklery-frontend", "dist"), false)))
  
  // api handling
  api := app.Group("/api")
  api.GET("/hello", func(ctx *gin.Context) {
    ctx.JSON(http.StatusOK, gin.H{
      "message": "hello world",
    })
  })
  
  // fallback route for SPA frontend
  // will be necessary for frontend routing w vue-router if desired
  // app.NoRoute(func(ctx *gin.Context) {
  //   ctx.File(filepath.Join("..", "picklery-frontend", "dist", "index.html"))
  // })
  
  app.Run()
}