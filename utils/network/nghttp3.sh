git clone https://github.com/ngtcp2/nghttp3.git
cd nghttp3
git checkout main  # или master, в зависимости от репо
git submodule update --init
autoreconf -fi
./configure --prefix=/usr/local/nghttp3 --enable-lib-only
make -j$(nproc)
sudo make install


echo 'export PKG_CONFIG_PATH=/usr/local/nghttp3/lib/pkgconfig:$PKG_CONFIG_PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/nghttp3/lib:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc


1. Объединение путей в LD_LIBRARY_PATH
Добавьте оба пути через двоеточие (:) в файл ~/.bashrc (или ~/.zshrc, если используете Zsh):

bash
echo 'export LD_LIBRARY_PATH=/usr/local/openssl/lib:/usr/local/nghttp3/lib:$LD_LIBRARY_PATH' >> ~/.bashrc
