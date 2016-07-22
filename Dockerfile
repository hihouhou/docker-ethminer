#
# Ethereum Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM ubuntu:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >


ENV YOUR_URL your_url
ENV YOUR_WALLET your_wallet
ENV YOUR_WORKER your_worker
ENV YOUR_EMAIL your_email

#Update & install packages for installting add-apt-repository
RUN apt-get update && \
    apt-get install -y software-properties-common

# Update & install packages for installing ethereum
RUN add-apt-repository -y ppa:ethereum/ethereum-qt && \
    add-apt-repository -y ppa:ethereum/ethereum && \
    apt-get update && \
    apt-get install -y ethminer

RUN find / -name ethminer 
CMD /usr/bin/ethminer --farm-recheck 200 -F $YOUR_URL/$YOUR_WALLET/$YOUR_WORKER/$YOUR_EMAIL -C
