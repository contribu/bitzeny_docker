FROM buildpack-deps:trusty

SHELL ["/bin/bash", "-c"]

RUN apt-get update \
  && apt-get install -y \
    git \
  && rm -rf /var/lib/apt/lists/* \  
  && rm -rf /tmp/*

RUN cd /root \
  && git clone https://github.com/bitzeny/cpuminer.git \
  && cd cpuminer \
  && ./autogen.sh \
  && ./configure CFLAGS="-O3 -march=native -funroll-loops -fomit-frame-pointer" \
  && make
