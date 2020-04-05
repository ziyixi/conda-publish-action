FROM continuumio/miniconda3:4.7.10

LABEL "repository"="https://github.com/m0nhawk/conda-package-publish-action"
LABEL "maintainer"="Andrew Prokhorenkov <andrew.prokhorenkov@gmail.com>"

# to fix: import cv2 > ImportError: libGL.so.1: cannot open shared object file: No such file or directory
RUN sudo apt-get update
RUN sudo apt-get install -y libgl1-mesa-dev

RUN conda install -y anaconda-client conda-build conda-verify

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
