FROM debian:latest

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip

RUN pip3 install --break-system-packages snakemake

WORKDIR /workspace

CMD ["snakemake", "--cores", "1"]
