FROM rust:1.79.0-slim-bullseye

RUN apt-get update && apt-get install -y wget make xz-utils && apt-get clean

WORKDIR /app

COPY . .

ENV PATH="/app/nodejs/bin:${PATH}"

RUN make frontend.server-setup
RUN make init

CMD ["make", "serve"]