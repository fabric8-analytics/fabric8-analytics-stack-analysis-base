FROM centos:7
LABEL maintainer="Avishkar Gupta <avgupta@redhat.com>"

# Need two yum installs here otherwise python-pip is not found
RUN yum install -y epel-release && \
    yum install -y zip python-pip python-devel gcc tkinter gcc-c++.x86_64 && \
    yum clean all

# --------------------------------------------------------------------------------------------------
# install python packages
# --------------------------------------------------------------------------------------------------
COPY ./hack/requirements.txt /
RUN pip install -r /requirements.txt && rm /requirements.txt
RUN pip install pomegranate==0.7.3
