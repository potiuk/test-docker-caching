ARG BASE_IMAGE
FROM ${BASE_IMAGE}

RUN echo "Base image:" ${BASE_IMAGE}

ARG EXTRAS
ENV EXTRAS=${EXTRAS}

RUN echo "EXTRAS:" ${EXTRAS}

ARG TEST_VERSION

# If you build for different version it will invalidate the cache here and rebuild from scratch
# This is typically used in release versions
ENV TEST_VERSION=${TEST_VERSION}

RUN apt-get update \
    && apt-get install -y \
      vim \
      wget \
      less \
    && apt-get autoremove -yqq --purge \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY setup.cfg /opt/setup.cfg
COPY setup.cfg /opt/setup.cfg

ARG PYTHON_VERSION
ENV PYTHON_VERSION=${PYTHON_VERSION}

COPY . /opt

RUN echo "Image: ${BASE_IMAGE}"
RUN echo "Extras: ${EXTRAS}"
RUN echo "Version: ${TEST_VERSION}"
RUN echo "Python version: ${PYTHON_VERSION}"


RUN cat /opt/test.txt
