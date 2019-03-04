#!/bin/bash
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#
MY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Echo you can override envronment variables to build images you want
# PYTHON_VERSION [2.7, 3.5, 3.6] - you can choose which python version should be installed
# DOCKERHUB_USER = defaults to airflow but you can override it to build images you want to
#                  publish under different dockerhub user
# PUSH_IMAGES = defaults to 0 - no images are pushed, but you can set it to 1 to push images to dockerhub
#               useful when you use your own DOCKERHUB_USER and push images for caching for your organization

PYTHON_VERSION=${PYTHON_VERSION:=$(python -c 'import sys; print("%s.%s" % (sys.version_info.major, sys.version_info.minor))')}

export DOCKERHUB_USER=${DOCKERHUB_USER:=potiuk}
export IMAGE_NAME=${DOCKERHUB_USER}/test-docker-caching:latest-${PYTHON_VERSION}
export PUSH_IMAGES=${PUSH_IMAGES:=0}

hooks/build

