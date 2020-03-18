#! /bin/bash
# create all the Compass ECR repositories for storing our own custom coredns images.
set -eu
aws ecr --profile staging-cluster create-repository --repository-name coredns --region=us-east-1
aws ecr --profile beta create-repository --repository-name coredns --region=us-east-1
aws ecr --profile gamma create-repository --repository-name coredns --region=us-east-1
aws ecr --profile production-cluster create-repository --repository-name coredns --region=us-east-1
