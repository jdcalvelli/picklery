use actix_web::{Responder, HttpResponse};

pub async fn test_api_service() -> impl Responder{
	HttpResponse::Ok().body("testing api endpoint")
}