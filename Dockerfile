FROM --platform=linux/amd64 ubuntu:20.04

# Create a user
RUN adduser hack

# Set working directory
WORKDIR /src

# Install HHVM
RUN apt-get update && apt-get install -y \
    software-properties-common \
    apt-transport-https \
    && apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xB4112585D386EB94 \
    && add-apt-repository https://dl.hhvm.com/ubuntu \
    && apt-get update && apt-get install -y hhvm

# Set the user
USER hack
