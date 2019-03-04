#!/usr/bin/env bash
MY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export PYTHON_VERSION=$(python -c 'import sys; print("%s.%s" % (sys.version_info.major, sys.version_info.minor))')
${MY_DIR}/docker_build.sh
