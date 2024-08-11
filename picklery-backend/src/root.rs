use actix_files::Files;
use std::path::Path;

pub fn root_service() -> Files {
	Files::new("/", Path::new("../picklery-frontend/dist"))
		.index_file("index.html")
		.prefer_utf8(true)
}