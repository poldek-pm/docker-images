# based on https://github.com/oingo/docker-gcc-centos/blob/master/Dockerfile

FROM centos:latest

# Base install up-to-date and epel is required for many packages
RUN yum update -y && \
    yum install -y epel-release && \
    yum clean all

# Software development tools, RPM build requirements
RUN yum install -y auto{conf,make} ctags elfutils gcc{,-c++} gettext gettext-devel intltool libtool make patch{,utils} && \
    yum install -y redhat-rpm-config rpm-{build,sign} spectool && \
    yum install -y git yum-utils && \
    yum -y --enablerepo=epel-testing install rpm-devel zlib-devel zstd libzstd-devel check-devel \
             rpm-devel readline-devel openssl-devel pcre-devel libxml2-devel xmlto docbook-dtds && \
    yum clean all

RUN mkdir -p ~/rpmbuild/{BUILD,RPMS,SOURCES,SRPMS,SPECS}

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

CMD ["bash"]

