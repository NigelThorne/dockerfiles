FROM ruby:2.1.5
ENV LANG C.UTF-8

#RUN apt-get -y update && apt-get -y install git ssh
#########

# Let's start with some basic stuff.
RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    curl \
    lxc \
    iptables \
    git \
    ssh

RUN mkdir -p /var/run/sshd
    
# Install Docker from Docker Inc. repositories.
RUN curl -sSL https://get.docker.com/ | sh
###########

RUN git config --global user.email "robot@example.com"
RUN git config --global user.name "Robot"

ADD sshkey.pub /root/.ssh/authorized_keys
RUN chown root:root /root/.ssh/authorized_keys

# Install the magic wrapper.
#ADD ./wrapdocker /usr/local/bin/wrapdocker
#RUN chmod +x /usr/local/bin/wrapdocker

#ADD https://raw.github.com/progrium/gitreceive/master/gitreceive /usr/local/bin/
ADD gitreceive /usr/local/bin/
RUN chmod 755 /usr/local/bin/gitreceive 
RUN /usr/local/bin/gitreceive init

ADD receiver /home/git/receiver
RUN chmod 755 /home/git/receiver

VOLUME /home/git
#VOLUME /var/lib/docker
EXPOSE 22

# some other linked image 
ENV DOCKER_HOST tcp://docker:2375

#COPY run.sh /usr/local/bin/
#RUN chmod 755 /usr/local/bin/run.sh 

#RUN wrapdocker
#ENTRYPOINT ["/usr/local/bin/run.sh"]
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
#ENTRYPOINT ["run"]
