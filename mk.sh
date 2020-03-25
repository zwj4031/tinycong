tar -xf ./linux.txz
cp -r config/.config linux-4.14.10/.config
cd linux-4.14.10
make -j9
cd ..
