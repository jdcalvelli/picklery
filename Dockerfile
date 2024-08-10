# STAGE 1 BUILD VUE FRONTEND
FROM node:20 AS frontend-builder
WORKDIR /app
COPY picklery-frontend/package*.json ./
RUN npm install
COPY picklery-frontend .
RUN npm run build

# STAGE 2 BUILD RUST BACKEND
FROM rust:1.79.0 AS backend-builder
WORKDIR /app
COPY picklery-backend/Cargo.toml ./
COPY picklery-backend/src ./src
RUN cargo build --release

# STAGE 3 - COMBINE
FROM debian:bookworm-slim
WORKDIR /app
COPY --from=frontend-builder /app/dist ./picklery-frontend/dist
COPY --from=backend-builder /app/target/release/picklery-backend ./picklery-backend/
WORKDIR /app/picklery-backend
CMD ["./picklery-backend"]
