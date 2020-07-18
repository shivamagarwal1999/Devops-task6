FROM centos
WORKDIR /work1
RUN yum install sudo -y
COPY kubernetes.repo /etc/yum.repos.d/
RUN yum install kubectl -y
COPY ca.crt /work1
COPY client.crt /work1
COPY client.key /work1
COPY config.yml /root/.kube/config
RUN yum install wget -y
RUN sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
RUN yum install  java-11-openjdk.x86_64 -y
RUN sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
RUN yum install httpd -y
RUN sudo yum install /sbin/service -y
RUN yum install php -y
RUN yum install curl -y
RUN yum install jenkins -y
RUN yum install git -y
RUN yum install  python3 -y
RUN yum install net-tools -y
RUN yum install initscripts -y
RUN chown -R jenkins /root/.kube
RUN echo -e "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN echo "/etc/rc.d/init.d/jenkins start" >> /etc/bashrc
