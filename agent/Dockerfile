FROM ubuntu:noble-20240801

RUN apt-get update -qq && \
  apt-get install --no-install-recommends -y \
  curl \
  ca-certificates \
    git \
  tzdata && \
  rm -rf /var/lib/apt/lists /var/cache/apt/archives

RUN install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc && \
    chmod a+r /etc/apt/keyrings/docker.asc && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update -qq && \
  apt-get install --no-install-recommends -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin && \
  rm -rf /var/lib/apt/lists /var/cache/apt/archives
