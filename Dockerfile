# RiakCS
#
# VERSION               0.0.1

FROM      ubuntu
MAINTAINER Jeffery Utter "jeff@jeffutter.com"

RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
RUN bash -c "echo deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen > /etc/apt/sources.list.d/10gen.list"
RUN apt-get update
RUN apt-get -y install mongodb-10gen

EXPOSE 22
EXPOSE 27017

CMD ["/bin/bash"]
