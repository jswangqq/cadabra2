FROM ubuntu:20.04
USER root
SHELL [ "/bin/bash", "-c" ]
# RUN apt update
# RUN apt install -y ca-certificates
RUN cp /etc/apt/sources.list /etc/apt/sources.list.backup
COPY sources.list /etc/apt/sources.list
RUN apt update

RUN DEBIAN_FRONTEND=noninteractive apt install -y git cmake g++ libgmp3-dev uuid-runtime
RUN DEBIAN_FRONTEND=noninteractive apt install -y libgtkmm-3.0-dev libboost-all-dev libgmp-dev libsqlite3-dev uuid-dev
RUN DEBIAN_FRONTEND=noninteractive apt install -y texlive texlive-latex-extra texlive-science dvipng

# COPY Anaconda3-2021.11-Linux-x86_64.sh /
# RUN chmod +x Anaconda3-2021.11-Linux-x86_64.sh
# RUN bash Anaconda3-2021.11-Linux-x86_64.sh -b
# RUN rm -rf Anaconda3-2021.11-Linux-x86_64.sh
# COPY condarc.txt ~/.condarc
# RUN touch ~/.bashrc
# RUN echo "export PATH=/root/anaconda3/bin:$PATH" >> ~/.bashrc
# RUN source ~/.bashrc
# RUN /root/anaconda3/bin/conda init bash

RUN DEBIAN_FRONTEND=noninteractive apt install -y python3-matplotlib python3-mpmath python3-sympy python3-gmpy2
RUN DEBIAN_FRONTEND=noninteractive apt install -y python3-pip libpython3-dev python3-dev 
# RUN mkdir ~/.pip
# COPY pip.conf ~/.pip/pip.conf
RUN pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip3 install jupyter

COPY cadabra2-2.3.7.2-focal.deb /
RUN dpkg -i cadabra2-2.3.7.2-focal.deb
RUN rm -rf cadabra2-2.3.7.2-focal.deb
