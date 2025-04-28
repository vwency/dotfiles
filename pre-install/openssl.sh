sudo apt update
sudo apt install -y git gcc make cmake autoconf libtool
git clone --depth 1 https://github.com/quictls/openssl.git
cd openssl
./config --prefix=/usr/local/openssl-quic --openssldir=/usr/local/openssl-quic
make -j$(nproc)
sudo make install
echo 'export PATH=/usr/local/openssl-quic/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/openssl-quic/lib:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc


-------------------------------

tar -xvzf openssl-3.5.0.tar.gz
cd openssl-3.5.0
./config --prefix=/usr/local/openssl --openssldir=/usr/local/openssl
make
sudo make install
echo "export PATH=/usr/local/openssl/bin:$PATH" >> ~/.bashrc
source ~/.bashrc