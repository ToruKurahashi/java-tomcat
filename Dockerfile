FROM ubuntu:14.04
MAINTAINER toru_kurahashi@eastback.jp

RUN apt-get update
RUN apt-get install -y apt-file
RUN apt-file update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections
RUN apt-get install -y oracle-java7-installer
RUN apt-get install -y tomcat7

EXPOSE 8080
VOLUME /var/lib/tomcat7/webapps
