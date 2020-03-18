#! /bin/bash
set -eux

export rev="compass-1.6.7.1"
make -f Makefile.release release
make -f Makefile.release docker

# push to Backend Services
eval `aws ecr get-login --profile backend-services --region=us-east-1 --no-include-email`
docker tag coredns/coredns:coredns-amd64 667043388539.dkr.ecr.us-east-1.amazonaws.com/coredns:$rev
docker push 667043388539.dkr.ecr.us-east-1.amazonaws.com/coredns:$rev

# push to Staging Cluster
eval `aws ecr get-login --profile staging-cluster --region=us-east-1 --no-include-email`
docker tag coredns/coredns:coredns-amd64 961350931373.dkr.ecr.us-east-1.amazonaws.com/coredns:$rev
docker push 961350931373.dkr.ecr.us-east-1.amazonaws.com/coredns:$rev

# push to Beta
eval `aws ecr get-login --profile beta --region=us-east-1 --no-include-email`
docker tag coredns/coredns:coredns-amd64 928990672971.dkr.ecr.us-east-1.amazonaws.com/coredns:$rev
docker push 928990672971.dkr.ecr.us-east-1.amazonaws.com/coredns:$rev

# push to Gamma
eval `aws ecr get-login --profile gamma --region=us-east-1 --no-include-email`
docker tag coredns/coredns:coredns-amd64 311936565521.dkr.ecr.us-east-1.amazonaws.com/coredns:$rev
docker push 311936565521.dkr.ecr.us-east-1.amazonaws.com/coredns:$rev

# push to Production Cluster
eval `aws ecr get-login --profile production-cluster --region=us-east-1 --no-include-email`
docker tag coredns/coredns:coredns-amd64 070944181368.dkr.ecr.us-east-1.amazonaws.com/coredns:$rev
docker push 070944181368.dkr.ecr.us-east-1.amazonaws.com/coredns:$rev
