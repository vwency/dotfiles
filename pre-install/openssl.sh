git clone --quiet --depth=1 -b openssl-$OPENSSL_VERSION https://github.com/openssl/openssl


-------------------------------
tar -xvzf openssl-3.5.0.tar.gz
cd openssl-3.5.0
./config --prefix=/usr/local/openssl --libdir=lib --openssldir=/usr/local/openssl
make
sudo make install
echo 'export PATH=/usr/local/openssl/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/openssl/lib:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc


---------------------------------
sudo ldconfig /usr/local/openssl/lib (optional)
