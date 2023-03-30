FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y bc bzip2 cpio g++ file git libssl-dev make ncurses-dev unzip rsync wget
RUN git clone https://github.com/bakueikozo/buildroot_am3352_aki.git
WORKDIR buildroot_am3352_aki
RUN make akiduki_am3352_defconfig
COPY config-fragment .
RUN support/kconfig/merge_config.sh .config config-fragment
RUN make

CMD /bin/bash
