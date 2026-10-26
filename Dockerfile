FROM registry.gitlab.com/pld-linux/pld

RUN set -x \
    && echo -e '#!/bin/sh\n# w/o for texlive depencency loop' > /usr/bin/texhash && chmod 755 /usr/bin/texhash \
    && poldek --noask --noprogress -u findutils coreutils && poldek --noask --noprogress -Orpmdef="_pkgverify_flags 0" -u ca-certificates git-core libstdc++ fakeroot autoconf automake libtool rpm-build-tools bzip2-devel check-devel docbook-dtd412-xml docbook2X gettext-autopoint gettext-tools glibc-devel libgomp-devel libxml2-devel lua54-devel ncurses-devel openssl-devel pcre-devel perl-XML-Simple perl-base perl-modules pkgconfig popt-devel readline-devel rpm-devel tar gzip texinfo xmlto xz zlib-devel zstd-devel python3 python3-cryptography curl nodejs gnupg2 gnupg-agent rpm-sign \
    && poldek clean

# Set environment variables.
ENV HOME=/root
ENV LC_ALL=C

# Define working directory.
WORKDIR /root

CMD ["/bin/sh"]
