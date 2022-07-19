FROM gitpod/workspace-full

ARG KUBESCAPE_VERSION="v2.0.163"
RUN curl -LO https://github.com/armosec/kubescape/releases/download/${KUBESCAPE_VERSION}/kubescape-ubuntu-latest && \
    sudo mv kubescape-ubuntu-latest /usr/bin/kubescape && \
    sudo chmod +x /usr/bin/kubescape && \
    bash -c "echo . \<\(kubescape completion bash\) >> ~/.bashrc"

ARG PROM_VERSION="2.36.0"
RUN curl -LO https://github.com/prometheus/prometheus/releases/download/v${PROM_VERSION}/prometheus-${PROM_VERSION}.linux-amd64.tar.gz && \
    tar -xzvf prometheus-${PROM_VERSION}.linux-amd64.tar.gz && \
    sudo mv prometheus-${PROM_VERSION}.linux-amd64/promtool /usr/local/bin/promtool && \
    rm -rf prometheus-${PROM_VERSION}.linux-amd64/ && \
    rm -f prometheus-${PROM_VERSION}.linux-amd64.tar.gz