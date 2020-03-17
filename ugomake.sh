#! /bin/bash
set -eux

export rev="ugo-0.10"
eval `aws ecr get-login --profile backend-services --region=us-east-1 --no-include-email`
make -f Makefile.release release
make -f Makefile.release docker
docker tag coredns/coredns:coredns-amd64 667043388539.dkr.ecr.us-east-1.amazonaws.com/coredns:$rev
docker push 667043388539.dkr.ecr.us-east-1.amazonaws.com/coredns:$rev
