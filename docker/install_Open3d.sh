cd /
wget https://github.com/Kitware/CMake/releases/download/v3.23.1/cmake-3.23.1.tar.gz \
  && tar -zxf cmake-3.23.1.tar.gz && cd cmake-3.23.1 \
  && sudo ./configure && make && sudo make install \
  && cd ../ && rm -r cmake-3.23.1 && rm cmake-3.23.1.tar.gz

sudo apt-get update && apt-get install -y libglfw3-dev
sudo apt-get install -y xorg-dev libglu1-mesa-dev python3-dev libsdl2-dev libc++-7-dev libc++abi-7-dev ninja-build libxi-dev gfortran libtbb-dev libosmesa6-dev libudev-dev autoconf libtool

cd /
git clone https://github.com/isl-org/Open3D
cd Open3D && mkdir build && cd build && cmake .. && make -j4 && make install
