cd ~
mkdir software && cd software
mkdir ipopt && cd ipopt
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

