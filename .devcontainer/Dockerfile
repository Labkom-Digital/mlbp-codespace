FROM mcr.microsoft.com/devcontainers/miniconda:1-3

COPY ./environment.yml /tmp/conda-tmp/
RUN conda env update -n base -f /tmp/conda-tmp/environment.yml

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    gnupg \
    git \
    build-essential

RUN pip install --no-cache-dir notebook jupyterlab setuptools jupyterdartkernel

RUN curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/dart-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/dart-archive-keyring.gpg] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main" | tee /etc/apt/sources.list.d/dart_stable.list > /dev/null && \
    apt-get update && \
    apt-get install -y --no-install-recommends dart

RUN git clone https://github.com/vickumar1981/jupyter-dart-kernel.git /opt/jupyter-dart-kernel && \
    cd /opt/jupyter-dart-kernel && \
    pip install . && \
    jupyter kernelspec install /opt/jupyter-dart-kernel

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN ln -s /usr/bin/dart /usr/local/bin/dart

# RUN ./install-go.sh

# ENV PATH=/usr/local/go/bin:/go/bin:${PATH}

# RUN ./install-gophernotes.sh