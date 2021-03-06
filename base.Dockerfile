FROM ubuntu:xenial

RUN echo "deb http://ppa.launchpad.net/pypy/ppa/ubuntu xenial main" > \
    /etc/apt/sources.list.d/pypy-ppa.list

RUN apt-key adv --keyserver keyserver.ubuntu.com \
                --recv-keys 2862D0785AFACD8C65B23DB0251104D968854915
RUN apt-get update

RUN apt-get install -qyy \
    -o APT::Install-Recommends=false -o APT::Install-Suggests=false \
    virtualenv pypy libffi6 openssl ca-certificates

RUN virtualenv -p /usr/bin/pypy /appenv
RUN . /appenv/bin/activate; pip install pip==8.1.2
