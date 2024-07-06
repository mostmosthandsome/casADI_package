mkdir -p ~/software/casADI/ipopt
cp ./coinhsl.zip ~/softwre/casADI/ipopt
cd ~/software/casADI/ipopt
# install ASL
git clone https://github.com/coin-or-tools/ThirdParty-ASL.git
cd ThirdParty-ASL
sudo ./get.ASL
sudo ./configure
sudo make
sudo make install
cd ..
#install BLAS, LAPACK
sudo apt install libblas-dev  liblapack-dev
#install HSL
git clone https://github.com/coin-or-tools/ThirdParty-HSL.git
unzip coinhsl.zip -d ./ThirdParty-HSL
sudo ./configure
sudo make
sudo make install
cd ..
#install mumps
git clone https://github.com/coin-or-tools/ThirdParty-Mumps.git
cd ThirdParty-Mumps
sudo ./get.Mumps
sudo ./configure
sudo make
sudo make install
cd ..
#install ipopt
git clone https://github.com/coin-or/Ipopt.git
cd Ipopt
mkdir build && cd build
../configure --with-mumps --with-mumps-cflags="-I/usr/local/include/coin-or/mumps" --with-mumps-lflags="-L/usr/local/lib -lcoinmumps"  --with-hsl-cflags="-I/usr/local/include/coin-or/hsl" --with-hsl-lflags="-L/usr/local/lib -lcoinhsl"
sudo make
sudo make install

cd ../..
#install casADI
git clone https://github.com/casadi/casadi.git
cd casadi
mkdir build
cd build
cmake -DWITH_PYTHON=ON -DWITH_PYTHON3=ON ..
make
sudo make install
