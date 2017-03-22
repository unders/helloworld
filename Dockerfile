FROM scratch
MAINTAINER unders <anders.tornqvist@gmail.com>
ADD release/helloworld /usr/bin/helloworld
ENTRYPOINT ["helloworld"]