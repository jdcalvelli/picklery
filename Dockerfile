FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y wget make xz-utils && apt-get clean

WORKDIR /app

COPY . .

ENV PATH="/app/nodejs/bin:/app/golang/bin:${PATH}"
ENV GOROOT="/app/golang"

RUN make server-setup
RUN make init

CMD ["make", "serve"]