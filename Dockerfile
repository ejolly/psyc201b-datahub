# 1) choose base container
# generally use the most recent tag

# base notebook, contains Jupyter and relevant tools
# See https://github.com/ucsd-ets/datahub-docker-stack/wiki/Stable-Tag 
# for a list of the most current containers we maintain
# Package list: https://github.com/ucsd-ets/datahub-docker-stack/wiki/ghcr-io-ucsd-ets-datascience-notebook-2025.1-stable
ARG BASE_CONTAINER=ghcr.io/ucsd-ets/datascience-notebook:2025.1-stable

FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

# 2) change to root to install packages
USER root

RUN apt-get -y install htop

# 3) install packages using notebook user
USER jovyan

RUN conda install -y -c ejolly -c conda-forge -c defaults pymer4 && \
    pip install --no-cache-dir polars

# Override command to disable running jupyter notebook at launch
CMD ["/bin/bash"]
