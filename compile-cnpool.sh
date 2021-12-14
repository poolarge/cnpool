#！bin/bash
# compile xmr
sudo apt install -y build-essential cmake pkg-config libssl-dev libzmq3-dev libunbound-dev libsodium-dev libunwind8-dev liblzma-dev libreadline6-dev libldns-dev libexpat1-dev libpgm-dev qttools5-dev-tools libhidapi-dev libusb-1.0-0-dev libprotobuf-dev protobuf-compiler libudev-dev libboost-chrono-dev libboost-date-time-dev libboost-filesystem-dev libboost-locale-dev libboost-program-options-dev libboost-regex-dev libboost-serialization-dev libboost-system-dev libboost-thread-dev ccache doxygen graphviz
git clone --recursive https://github.com/monero-project/monero
cd monero
git checkout 992b7ce30fa101f55314b89aa5bdf20881f5b43d
git submodule sync && git submodule update
make
cd build/Linux && mv _HEAD_detached_at_992b7ce30_ master
cd ~

# compile pool
sudo apt install -y liblmdb-dev libevent-dev libjson-c-dev uuid-dev libmicrohttpd-dev libmysqlclient-dev zip
git clone https://github.com/poolarge/cnpool.git
cd cnpool
export MONERO_ROOT=~/monero
make
cd ~/cnpool/build/debug

