use dotenv::dotenv;
use std::env;
use actix_web::{HttpServer, App};
use actix_files::Files;
use std::path::Path;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    
    // load dotenv
    dotenv().ok();
    // get port - using panics here which is not great
    let port: u16 = env::var("PORT").unwrap().parse().unwrap();
    
    // opening server
    HttpServer::new(|| {
        App::new()
            .service(
                Files::new("/", Path::new("../picklery-frontend/dist"))
                .index_file("index.html")
                .prefer_utf8(true))
    })
    .bind(("127.0.0.1", port))?
    .run()
    .await
} 