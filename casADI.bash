mkdir -p ~/software/casADI/ipopt
cp ./coinhsl.zip ~/software/casADI/ipopt
cd ~/clash-for-linux
./start.sh
export http_proxy="localhost:7890"
cd ~/software/casADI/ipopt
# install ASL
sudo apt install swig
git clone https://github.com/coin-or-tools/ThirdParty-ASL.git
cd ThirdParty-ASL
sudo ./get.ASL
sudo ./configure
sudo make
sudo make install
cd ..
#install BLAS, LAPACK
sudo apt install -y libblas-dev  liblapack-dev
#install HSL
git clone https://github.com/coin-or-tools/ThirdParty-HSL.git
unzip coinhsl.zip -d ./ThirdParty-HSL
cd ThirdParty-HSL
sudo ./configure
make clean
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
sudo apt install -y libmumps-seq-dev
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
sudo cp -r /usr/local/include/coin-or/mumps /usr/include
git clone https://github.com/casadi/casadi.git
cd casadi
mkdir build
cd build
export $LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
cmake -DWITH_PYTHON=ON -DWITH_PYTHON3=ON -DWITH_IPOPT=ON _DWITH_MUMPS=ON ..
make
sudo make install
