FROM centos:6.4
MAINTAINER Yuya Yabe <yuyabee@gmail.com>

RUN yum -y update
RUN yum -y install git gcc make openssl-devel readline-devel zlib-devel curl-devel libyaml-devel

RUN git clone https://github.com/sstephenson/rbenv.git /usr/local/rbenv

ENV PATH /usr/local/rbenv/bin:/usr/local/shims:$PATH
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile
RUN source /etc/profile

RUN git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build
RUN cd /usr/local/rbenv/plugins/ruby-build/; ./install.sh

RUN rbenv install 2.1.0
RUN rbenv global 2.1.0

CMD ["eval", "'$(rbenv init -)'"]
