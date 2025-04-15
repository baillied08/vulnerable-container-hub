FROM ubuntu:jammy-20230916
RUN apt-get update && apt-get install -y curl nginx
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

COPY file_system /root/test

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1

EXPOSE 80
