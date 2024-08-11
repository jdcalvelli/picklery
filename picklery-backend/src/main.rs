use dotenv::dotenv;
use std::env;
use actix_web::{HttpServer, App, web};

mod root;
mod api;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    
    // load dotenv
    dotenv().ok();
    // get port - using panics here which is not great
    let port: u16 = env::var("PORT")
        .unwrap_or_else(|_| panic!("Critical: ENV var not found."))
        .parse()
        .unwrap_or_else(|_| panic!("Critical: Error parsing ENV var."));
    
    // opening server
    HttpServer::new(|| {
        // need to go in order of most restrictive endpoint to least
        App::new()
            // this could be done with a config instead of directly scoping here
            .service(web::scope("/api")
                .route("/test", web::get().to(api::test_api::test_api_service))
            )
            .service(root::root_service())
    })
    .bind(("0.0.0.0", port))?
    .run()
    .await
} 