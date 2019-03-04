#!/bin/bash
rm -rf test-docker-caching
docker system prune --all --force
git clone https://github.com/potiuk/test-docker-caching.git
cd test-docker-caching
./hooks/build
cd ..
