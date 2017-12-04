FROM centos:7
MAINTAINER Avishkar Gupta <avgupta@redhat.com>

RUN yum install -y epel-release && \
    yum install -y zip && \
    yum install -y python-pip python-devel gcc && \
    yum -y install tkinter && \
    yum-config-manager --disable testing-devtools-2-centos-7 && \
    yum -y install gcc-c++.x86_64 && \
    yum clean all


# --------------------------------------------------------------------------------------------------
# install python packages
# --------------------------------------------------------------------------------------------------
COPY ./hack/requirements.txt /
RUN pip install -r /requirements.txt && rm /requirements.txt
RUN pip install pomegranate==0.7.3
