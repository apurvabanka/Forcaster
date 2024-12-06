# Stage 1: Build Flutter app
FROM ubuntu:22.04 AS builder

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl unzip git wget xz-utils libglu1-mesa libpulse0 && \
    apt-get clean

# Install Flutter
RUN wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.5-stable.tar.xz && \
    tar -xf flutter_linux_3.24.5-stable.tar.xz -C /opt && \
    rm flutter_linux_3.24.5-stable.tar.xz

ENV PATH="/opt/flutter/bin:/opt/flutter/bin/cache/dart-sdk/bin:$PATH"

RUN rm -rf /opt/flutter/bin/cache

RUN git config --global --add safe.directory /opt/flutter

# Enable web development
RUN flutter config --no-analytics && \
    flutter channel stable && flutter upgrade && flutter config --enable-web

# Set working directory
WORKDIR /app

# Copy Flutter project files
COPY . .

# Install dependencies and build the app
RUN for i in {1..5}; do flutter pub get && break || sleep 5; done && \
    flutter build web

# Stage 2: Serve app with nginx
FROM nginx:alpine
COPY --from=builder /app/build/web /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
