FROM ubuntu:14.04
MAINTAINER Eric Young <eric@stratolinux.com>
ENV DEBIAN_FRONTEND noninteractive

# To get rid of error messages like "debconf: unable to initialize frontend: Dialog":
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN echo "deb http://archive.ubuntu.com/ubuntu trusty multiverse" >> /etc/apt/sources.list
RUN apt-get -q update

# Install Dependencies
RUN apt-get install -qy git python unrar python-software-properties software-properties-common wget 

RUN apt-get -qy upgrade

# Set correct environment variables
ENV HEADDIR /opt/headphones
RUN git clone https://github.com/rembo10/headphones.git $HEADDIR

# apt clean
RUN apt-get clean &&\
  rm -rf /var/lib/apt/lists/* &&\
  rm -rf /tmp/* &&\
  rm -rf /var/tmp/*

# headphones Configuration
VOLUME /config
# Downloads directory
VOLUME /downloads
# Music directory
VOLUME /music

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

EXPOSE 8181

CMD ["/start.sh"]
