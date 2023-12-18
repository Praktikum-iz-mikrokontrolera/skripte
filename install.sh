sudo apt install git cmake python3-pip python3-setuptools python3-wheel
mkdir ~/.pim
cd ~/.pim
touch DO-NOT-TOUCH
wget -q https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/RC2.1/gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2
tar -xjf gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2
rm gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2
echo export PATH=$(pwd)/gcc-arm-none-eabi-9-2019-q4-major/bin:$PATH >> ~/.bash_profile
source ~/.bash_profile
sudo -H python3 -m pip install intelhex prettytable future
python3 -m pip install -U pyocd
python3 -m pyocd pack install stm32l476rg
sudo wget https://raw.githubusercontent.com/pyocd/pyOCD/main/udev/49-stlinkv2-1.rules -P /etc/udev/rules.d/
sudo udevadm control --reload
sudo udevadm trigger
git clone --recursive https://github.com/USCRPL/mbed-cmake-example-project.git project-template
cd project-template
git submodule foreach git pull origin master
python3 -m pip install -r mbed-cmake/mbed-src/requirements.txt
python3 mbed-cmake/configure_for_target.py -a mbed_app.json -i .mbedignore NUCLEO_L476RG
mkdir build
