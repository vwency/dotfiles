git clone https://github.com/ngtcp2/sfparse.git
cd sfparse
autoreconf -i
./configure --prefix=/usr/local
make -j$(nproc)
sudo make install
cd ..


# Клонируем nghttp3
git clone https://github.com/ngtcp2/nghttp3
cd nghttp3
autoreconf -i
./configure --prefix=/usr/local
make -j$(nproc)
sudo make install
cd ..

# Клонируем ngtcp2
git clone https://github.com/ngtcp2/ngtcp2
cd ngtcp2
autoreconf -i
./configure --prefix=/usr/local --with-openssl --with-nghttp3=/usr/local
make -j$(nproc)
sudo make install
cd ..
