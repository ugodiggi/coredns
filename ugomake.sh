#! /bin/bash
set -eux

export rev="0.8"
make -f Makefile.release release
make -f Makefile.release docker
docker tag coredns/coredns:coredns-amd64 667043388539.dkr.ecr.us-east-1.amazonaws.com/coredns:ugo-$rev
docker push 667043388539.dkr.ecr.us-east-1.amazonaws.com/coredns:ugo-$rev
