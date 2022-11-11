#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes

docker build --file 3.2/Dockerfile -t evanzacks705/cimg-sf-ruby:3.2.0-preview3 -t evanzacks705/cimg-sf-ruby:3.2-rc .
docker build --file 3.2/node/Dockerfile -t evanzacks705/cimg-sf-ruby:3.2.0-preview3-node -t evanzacks705/cimg-sf-ruby:3.2-rc-node .
docker build --file 3.2/browsers/Dockerfile -t evanzacks705/cimg-sf-ruby:3.2.0-preview3-browsers -t evanzacks705/cimg-sf-ruby:3.2-rc-browsers .
