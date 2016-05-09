FROM ubuntu:precise

RUN apt-get -y update && apt-get -y install git ssh
RUN mkdir -p /var/run/sshd

RUN git config --global user.email "robot@example.com"
RUN git config --global user.name "Robot"

ADD https://raw.github.com/progrium/gitreceive/master/gitreceive /usr/local/bin/
ADD receiver /home/git/receiver

RUN chmod 755 /home/git/receiver usr/local/bin/gitreceive 
RUN /usr/local/bin/gitreceive init

ADD sshkey.pub /root/.ssh/authorized_keys
RUN chown root:root /root/.ssh/authorized_keys

VOLUME /home/git
EXPOSE 22
#CMD /usr/sbin/sshd
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
